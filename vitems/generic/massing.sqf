    
    _tool = _this select 0;

    if(isNull cursorObject && {(cursorObject isKindOf "Man")}) exitWith { false;};

    switch (_tool) do {
        case "masse" : {
            private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
            private _sound = _path + "sounds\masse.ogg";
            playSound3D [_sound, player, false, getPosASL player, 5, 1, 10];
            cursorObject  setDammage ((getDammage cursorObject) + 0.05);
        };
        default {};
    };
    true;