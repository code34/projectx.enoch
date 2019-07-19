	// put helicopter gears in building
	private _typeof  = ["Land_FuelStation_03_shop_F", "Land_FuelStation_02_workshop_F","Land_FuelStation_Build_F","Land_CementWorks_01_grey_F","Land_Workshop_04_grey_F","Land_IndustrialShed_01_F"];
	private _position = [6000,6000];
	private _array = nearestObjects [_position, _typeof , 7000];
	
	sleep 2;

	{
   		private _container = ["new", [netId _x, ((getModelInfo _x) select 0)]] call OO_CONTAINER;
   		private _content = [["helicoptergears", 1]];
   		["overLoad", _content] call _container;
   		"save" call _container;
   		sleep 0.1;
	} forEach _array;