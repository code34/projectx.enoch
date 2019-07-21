	private _result = true;

	if(surfaceIsWater(getpos player)) then {
		player playActionNow "PutDown";
		["addItemsByLabel", [["bottlewaterunverified", 1]]] call capcontainer;
		_result = true;
	} else {
		_result = false;
	};
	_result;