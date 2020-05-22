
	private _time = _this select 0;
	if(isnull cursorObject) exitWith {
		hint "You must point to an object";
		false;
	};
	if(cursorObject distance player > 10) exitWith {
		hint "You must point to an object";
		false;
	};

	private _object = cursorObject;
	private _c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _object; 
	
	_c4 attachTo [_object, [0,0,0]]; 
	[_c4, _time] spawn { 
		private _c4 = _this select 0;
		private _time = _this select 1;
		for "_i" from _time to 0 step -1 do {
			hint format ["Time: %1", _i];
			sleep 1;         
		};
		_c4 setDamage 1;
	};
	true;