	if(isNull cursorObject && {isplayer cursorObject}) exitWith { false;};
	if(cursorObject distance player > 10) exitWith {false;};
	cursorObject setVariable ["enginerepaired", true, true];
	playSound "wrench";
	true;