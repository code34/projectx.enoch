
    if(isNull cursorObject && {isplayer cursorObject}) exitWith { false;};
    if(cursorObject distance player > 10) exitWith {false;};
    if!((typeOf cursorObject) isEqualTo "Land_TBox_F") exitWith {false;};

    cursorObject setVariable ["radioactive", false, true];
	playSound "wrench";

	true;