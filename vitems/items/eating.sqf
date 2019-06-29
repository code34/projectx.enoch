
    private _bonus = _this select 0;
    private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
    private _sound = _path + "sounds\eat.ogg";
    playSound3D [_sound, player, false, getPosASL player, 5, 1, 10];
    ["addFood", _bonus] call (missionNamespace getVariable "health");
    true;