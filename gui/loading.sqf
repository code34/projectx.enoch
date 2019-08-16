	private _object = cursorObject;
	private _tocreate = false;
	private _size = 0;

	if ((typeof _object) isKindOf "House") then {
		_size = ((1 boundingBoxReal _object) select 2) - 1;
	} else {
		_size = ((1 boundingBoxReal _object) select 2) + 2;
	};

	if(_object distance player > _size) then { _tocreate = true; }; 
	if((isplayer _object) and (alive _object)) then { _tocreate = true; }; 
	if(isNull _object) then { _tocreate = true;};

	if(_tocreate) then {
		//_object = createSimpleObject ["Box_B_UAV_06_F", [0,0,0]];
		_object = "Box_B_UAV_06_F" createVehicle [0,0,0];
	};

	proxcontainer = ["new", [netId _object, ((getModelInfo _object) select 0)]] call OO_CONTAINER;
	[] call fnc_inventorycam;
	createDialog "VITEMS";