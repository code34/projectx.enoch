	private _time = _this select 0;
	if(isnull cursorObject) exitWith {false;};
	if(cursorObject distance player > 10) exitWith {false;};
	private _object = cursorObject;

	[_object, _time] spawn { 
		private _object = _this select 0;
		private _time = _this select 1;

		private _id = random 65000;
		private _name = format["gpstracker_%1", _id];
		private _marker = createMarkerLocal [_name, position _object];
		
		_marker setMarkerShapeLocal "ICON";
		_marker setMarkerTypeLocal "loc_CivilDefense";
		_marker setMarkerTextLocal _name;
		_marker setMarkerColor "ColorRed";
		_marker setMarkerSizeLocal [0.5,0.5];
		_marker setMarkerBrushLocal "FDiagonal";
		
		while { alive _object && _time > 0} do {
			_marker setMarkerPosLocal (position _object);
			_time = _time - 1;
			sleep 5;
		};
		deleteMarkerLocal _marker;
	};

	true;