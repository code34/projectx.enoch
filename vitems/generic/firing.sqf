	if!(vehicle player isEqualTo player) exitWith {};
	
	(_this select 0) spawn {
		private _time = _this;
		player playActionNow "PutDown"; 
		["playSound", ["makefire.ogg", player, false, 5, 1, 10]] call mysound;
		private _position = player getRelPos [2,0];
		private _height = (getPosASL player) select 2;
		_position = [_position select 0, _position select 1, _height];
		sleep 2;
		private _fire = "FirePlace_burning_F" createVehicle _position;
		_fire setPosASL _position;
		while { _time > 0 } do {
			if (inflamed _fire) then {_time = _time - 1;};
			sleep 1;
		};
		deleteVehicle _fire;
	};
	true;