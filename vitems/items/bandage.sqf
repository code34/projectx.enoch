    private _object = player;
    
    if!(isNull cursorObject && isPlayer cursorObject && alive cursorObject) then { _object = cursorObject;false;}
    _object setDamage ((getDammage _object) - 0.35);
    true;