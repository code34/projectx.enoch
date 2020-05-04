
    if(isNull cursorObject && {isplayer cursorObject}) exitWith { false;};
    if(cursorObject distance player > 10) exitWith {false;};
    if!((typeOf cursorObject) isEqualTo "Land_TBox_F") exitWith {false;};
	_radiocenter = (nearestObjects [position player, ["Land_TBox_F"], 10]);
	if((count _radiocenter) isEqualTo 0) exitWith {false;};

    missionNamespace setVariable ["radioactive", true, true];
	playSound "wrench";
	player playActionNow "PutDown";
	true;