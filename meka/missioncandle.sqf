	// put helicopter gears in building
	private _typeof  = ["Land_GarageRow_01_small_F"];
	private _position = [6000,6000];
	private _array = nearestObjects [_position, _typeof , 7000];

	sleep 2;

	{
		private _container = ["new", [netId _x, ((getModelInfo _x) select 0)]] call OO_CONTAINER;
		private _content = [["helicoptercandle", 1]];
		["overLoad", _content] call _container;
		"save" call _container;
		["delete", _container] call OO_CONTAINER;
		sleep 0.1;
	} forEach _array;