
	private _bonus = _this select 0;
	private _playsound = _this select 1;

	if(_playsound) then {
		private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
		private _sound = _path + "sounds\drink.ogg";
		playSound3D [_sound, player, false, getPosASL player, 5, 1, 10];
	};

	["addDrink", _bonus] call (missionNamespace getVariable "health");
	true;