	createDialog "loadingscreen";

	private _object = cursorObject;
	if (isNull _object) then { 
		_object = "Box_B_UAV_06_F" createVehicle position player; 
		_object setpos (position player);
	};

	[] spawn {
		for "_i" from 0 to 9 do {
				"incProgressBar" call loadingscreen;
				sleep 0.1;
		};
	};

	proxcontainer = ["new", [netId _object, ((getModelInfo _object) select 0)]] call OO_CONTAINER;
	capcontainer = ["new", [netId player, ((getModelInfo player) select 0)]] call OO_CONTAINER;

	"closeDialog" call loadingscreen;

	createDialog "VITEMS";