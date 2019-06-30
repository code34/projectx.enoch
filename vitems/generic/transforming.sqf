    _tool = _this select 0;

    if(isNull cursorObject && {isplayer cursorObject}) exitWith { false;};
    if(cursorObject distance player > 10) exitWith {false;};

    private _model = "new" call OO_MODEL;
    private _type = "getCursorType" call _model;
    private _cutdamage = 0;
    private _percutdamage = 0;
    private _cutresistance = 0;
    private _percutresistance = 0;
    private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
    private _sound = "";

    switch (_type) do {
        case "house" : {
            _cutresistance = 1;
            _percutresistance = 0.29;
        };
        case "wall" : {
            _cutresistance = 1;
            _percutresistance = 0.2;
        };
        case "tree" : {
            _cutresistance = 0.1;
            _percutresistance = 1;
        };
        case "bush" : {
            _cutresistance = 0.05;
            _percutresistance = 1;
        };
        default {
            _cutresistance = 1;
            _percutresistance = 1;
        };
    };

    switch (_tool) do {
        case "axe" : {
            _sound = _path + "sounds\axe.ogg";
            _cutdamage = 0.3;
            _percutdamage = 0;
        };
        case "masse" : {
            _sound = _path + "sounds\masse.ogg";
            _cutdamage = 0;
            _percutdamage = 0.3;
        };
        default {};
    };

    _tcutdamage = _cutdamage - _cutresistance;
    _tpercutdamage = _percutdamage - _percutresistance;

    if!(_tpercutdamage < 0 && _tcutdamage < 0) then {
        private _damage = _tpercutdamage max _tcutdamage;
        cursorObject  setDammage ((getDammage cursorObject) + _damage);
        hint format["You smash for %1 Dammages\nCutresistance %2 Percutresistance %3", _damage, _cutresistance, _percutresistance];
    };
    playSound3D [_sound, player, false, getPosASL player, 5, 1, 10];
    true;