	_this = _position;
	
	private _min = 64000;
	private _object = objNull;
	
	{
		if(_x distance _position < _min) then {
			_min = _x distance _position;
			_object = _x;
		};
	}foreach allplayers;
	[_min, _object];