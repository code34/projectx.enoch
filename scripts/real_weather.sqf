	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2013-2020 Nicolas BOITEUX

	Real weather for MP GAMES v 1.5
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	private ["_lastrain", "_rain", "_fog", "_mintime", "_maxtime", "_overcast", "_realtime", "_random","_startingdate", "_startingweather", "_timeforecast", "_daytimeratio", "_nighttimeratio", "_timesync", "_wind"];
	
	// Real time vs fast time
	// true: Real time is more realistic weather conditions change slowly (ideal for persistent game)
	// false: fast time give more different weather conditions (ideal for non persistent game) 
	_realtime = false;

	// Random time before new forecast
	// true: forecast happens bewteen mintime and maxtime
	// false: forecast happens at mintime
	_random = false;

	// Min time seconds (real time) before a new weather forecast
	_mintime = 600;

	// Max time seconds (real time) before a new weather forecast
	_maxtime = 1200;

	// If Fastime is on
	// Ratio 1 real time second for x game time seconds
	// Default: 1 real second = 6 second in game
	_daytimeratio = 24;
	_nighttimeratio = 48;

	// send sync data across the network each xxx seconds
	// 60 real seconds by default is a good value
	// shortest time do not improve weather sync
	_timesync = 60;

	// Mission starting date is 25/09/2013 at 12:00
	_startingdate = [2019, 08, 01, 05, 00];

	// Mission starting weather "CLEAR|CLOUDY|RAIN";
	_startingweather = selectRandom ["CLOUDY", "RAIN", "CLEAR"];

	_setWeather = {
		_wcweather = [];
		switch(toUpper(_this)) do {
			case "CLEAR": {
				_wcweather = [0, 0, 0, [random 3, random 3, true], date];
			};
			
			case "CLOUDY": {
				_wcweather = [0, 0, 0.6, [random 3, random 3, true], date];
			};
			
			case "RAIN": {
				_wcweather = [1, 0, 1, [random 3, random 3, true], date];
			};
			default {
				_wcweather = [0, 0, 0, [random 3, random 3, true], date];
				diag_log "Real weather: wrong starting weather";
			};
		};
		_wcweather;
	};


	/////////////////////////////////////////////////////////////////
	// Do not edit below
	/////////////////////////////////////////////////////////////////
	
	// export temperature outside
	externaltemperature = 28;

	if(_mintime > _maxtime) exitwith {hint format["Real weather: Max time: %1 can no be higher than Min time: %2", _maxtime, _mintime];};
	_timeforecast = _mintime;

	if!(isnil "_startingdate") then { setdate _startingdate };

	wcweather = _startingweather call _setWeather;

	checkTemperature = {
		private _basetemp = 22;
		private _rainmalus = rain * 4;
		private _fogmalus = fog * 4;
		private _windmalus = 0;
		private _hour = date select 3;
		private _hourmalus = 0;
		if((_hour >= 22) and (_hour <= 24)) then { _hourmalus = 4;};
		if((_hour >=0) and(_hour <=6)) then {_hourmalus = 8;};
		if((_hourmalus > 0) && (( _rainmalus > 0) || (_fogmalus > 0))) then { _windmalus = windStr * 4;};
		floor(_basetemp - _rainmalus - _fogmalus - _windmalus - _hourmalus);
	};

	// add handler
	if (local player) then {
		wcweatherstart = true;
		"wcweather" addPublicVariableEventHandler {
			// first JIP synchronization
			if(wcweatherstart) then {
				wcweatherstart = false;
				skipTime -24;
				86400 setRain (wcweather select 0);
				86400 setfog (wcweather select 1);
				86400 setOvercast (wcweather select 2);
				skipTime 24;
				simulweatherSync;
				setwind (wcweather select 3);
				setdate (wcweather select 4);
			}else{
				wcweather = _this select 1;
				60 setRain (wcweather select 0);
				60 setfog (wcweather select 1);
				60 setOvercast (wcweather select 2);
				setwind (wcweather select 3);
				setdate (wcweather select 4);
			};
			externaltemperature = call checkTemperature;
		};
	};

	// SERVER SIDE SCRIPT
	if (!isServer) exitWith{};

	// apply weather
	skipTime -24;
	86400 setRain (wcweather select 0);
	86400 setfog (wcweather select 1);
	86400 setOvercast (wcweather select 2);
	skipTime 24;
	simulweatherSync;
	setwind (wcweather select 3);
	setdate (wcweather select 4);

	// sync server & client weather & time
	[_realtime, _timesync, _daytimeratio, _nighttimeratio] spawn {
		private["_realtime", "_timesync", "_daytimeratio", "_nighttimeratio"];
		
		_realtime = _this select 0;
		_timesync = _this select 1;
		_daytimeratio = _this select 2;
		_nighttimeratio =  _this select 3;

		while { true } do {
			wcweather set [4, date];
			publicvariable "wcweather";
			externaltemperature = call checkTemperature;
			if(!_realtime) then { 
				if((date select 3 > 16) or (date select 3 <6)) then {
					setTimeMultiplier _nighttimeratio;
				} else {
					setTimeMultiplier _daytimeratio;
				};
			};
			sleep _timesync;
		};
	};

	_lastrain = 0;
	while {true} do {
		_rain = 0;
		_fog = 0;
		_wind = [0,0,true];
		_overcast = random 1;
		if(overcast > 0.5) then { _rain = random overcast;} else {_rain = 0;};
		if(random 1 > 0.75) then {
			_wind = [random 10, random 10, true];
			_fog = 0;
		} else {
			_wind = [random 3, random 3,true];
			if((_lastrain > 0.6) and (_rain < 0.2)) then { _fog = 0.4 + random 0.2;} else {_fog = random 0.4;};
			if((date select 3 > 22) and (date select 3 <6)) then { _fog = 0.4 + random 0.6;};
		};
		_lastrain = _rain;
		wcweather = [_rain, _fog, _overcast, _wind, date];
		60 setRain (wcweather select 0);
		60 setfog (wcweather select 1);
		60 setOvercast (wcweather select 2);
		setwind (wcweather select 3);
		if(_random) then {
			_timeforecast = _mintime + (random (_maxtime - _mintime));
		};
		sleep _timeforecast;
	};