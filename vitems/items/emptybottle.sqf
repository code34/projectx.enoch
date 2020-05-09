	private _result = true;
		
	_count = count(nearestObjects [player, ["Land_ConcreteWell_02_F","Land_StoneWell_01_F", "Land_Water_source_F"], 10]);
	if(_count > 0) then {
			player playActionNow "PutDown";
			private _object = cursorTarget;
			private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
			private _sound = _path + "sounds\waterpump.ogg";
			playSound3D [_sound, _object, false, getPosASL _object, 2, 1, 40];
			["addItemsByLabel", [["waterbottle", 1]]] call capcontainer;
			_result = true;
	} else {
		if(surfaceIsWater(getpos player)) then {
			player playActionNow "PutDown";
			["addItemsByLabel", [["bottlewaterunverified", 1]]] call capcontainer;
			_result = true;
		} else {
			_result = false;
		};
	};
	_result;