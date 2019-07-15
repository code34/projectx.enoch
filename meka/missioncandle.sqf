	// put helicopter gears in building
	private _typeof  = ["Land_GarageRow_01_small_F"];
	private _position = [4090.96,10220.8,0.101196];
	private _array = nearestObjects [_position, _typeof , 400];
	
	sleep 2;

	{
    	if(random 1 > 0.3) then {
    		private _container = ["new", [netId _x, ((getModelInfo _x) select 0)]] call OO_CONTAINER;
    		private _content = [["helicoptercandle", 1]];
    		["overLoad", _content] call _container;
    		"save" call _container;
    		["delete", _container] call OO_CONTAINER;
    		sleep 0.1;
    	};
	} forEach _array;