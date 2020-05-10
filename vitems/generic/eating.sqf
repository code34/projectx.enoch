
	private _bonus = _this select 0;
	private _playsound = _this select 1;

	if(_playsound) then {
		["playSound", ["eat.ogg", player, false, 5, 1, 10]] call mysound;
	};

	["addFood", _bonus] call (missionNamespace getVariable "health");
	true;