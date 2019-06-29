    private _bonus = _this select 0;
    private _object = player;
    
    if(!(isNull cursorObject) && {isPlayer cursorObject} && {alive cursorObject}) then { _object = cursorObject;};
    _object setDamage ((getDammage _object) - _bonus);
    true;