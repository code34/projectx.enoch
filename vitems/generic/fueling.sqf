	private _bonus = _this select 0;
	if(isnull cursorObject) exitWith {
		hint "You must point to an object";
		false;
	};

	if(cursorObject distance player > 10) exitWith {
		hint "You must point to an object";
		false;
	};

	if!(cursorObject isKindOf "Car") exitWith {
		hint "Object must be a vehicle";
		false;
	};

	["playSound", ["refuel.ogg", player, false, 5, 1, 10]] call mysound;
	private _object = cursorObject;
	private _fuel = getFuelCargo _objet;
	_object setFuelCargo (_fuel + _bonus);
	true;