	//createDialog "loadingscreen";

	private _object = cursorObject;
	private _tocreate = false;
	private _size = 0;

	if (isNull _object) then {
		_tocreate = true;
	} else {
		if ((typeof _object) isKindOf "House") then {
			_size = ((1 boundingBoxReal _object) select 2) - 1;
		} else {
			_size = ((1 boundingBoxReal _object) select 2) + 2;
		};
		if(_object distance player > _size) then {
			_tocreate = true;
		};
	};

	if(_tocreate) then {
		_object = createSimpleObject ["Box_B_UAV_06_F", [0,0,0]];
	};

/*	[] spawn {
		for "_i" from 0 to 9 do {
				"incProgressBar" call loadingscreen;
				sleep 0.1;
		};
	};*/

	proxcontainer = ["new", [netId _object, ((getModelInfo _object) select 0)]] call OO_CONTAINER;
	capcontainer = ["new", [netId player, ((getModelInfo player) select 0)]] call OO_CONTAINER;

	//"closeDialog" call loadingscreen;

	createDialog "VITEMS";