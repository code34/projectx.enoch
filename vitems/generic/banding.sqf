	private _bonus = _this select 0;
	private _object = player;

	if(!(isNull cursorObject) && {isPlayer cursorObject} && {alive cursorObject}) then { 
		if(cursorObject distance player < 3) then {
			_object = cursorObject;
		};
	};

	if(getDammage _object isEqualTo 0) exitWith {hint "you are not injured";false;};

	if (stance player == "STAND") then {
		if(vehicle player isEqualTo player) then {
			if(_object isEqualTo player) then {
				player playMove "AinvPknlMstpSlayWrflDnon_medic";
			} else {
				player playMove "AinvPknlMstpSlayWpstDnon_medicOther";
			};
		};
	};

	private _damage = (getDammage _object) - _bonus;
	if(_damage < 0) then {_damage = 0;};
	_object setDamage _damage;
	true;