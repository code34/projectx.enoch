
	private _time = _this select 0;
	player playActionNow "PutDown"; 
	["playSound", ["makefire.ogg", player, false, 5, 1, 10]] call mysound;
	private _position = player getRelPos [2,0];

	[_time, _position] spawn {
		private _time = _this select 0;
		private _position = _this select 1;
		sleep 2;
		private _fire = "FirePlace_burning_F" createVehicle _position;
		_fire setpos _position;
		while { _time > 0 } do {
			if (inflamed _fire) then {
				_time = _time  - 1;
			};
			sleep 1;
		};
		deleteVehicle _fire;
	};
	true;