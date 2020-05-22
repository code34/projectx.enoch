
	if(isNull cursorObject && {isplayer cursorObject}) exitWith { false;};
	if(cursorObject distance player > 10) exitWith {false;};
	if!((typeOf cursorObject) isEqualTo "C_Heli_Light_01_civil_F") exitWith {false;};

	cursorObject setVariable ["enginerepaired", true, true];
	playSound "wrench";
	true;