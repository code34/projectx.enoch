
    if(isNull cursorObject && {(cursorObject isKindOf "Man")}) exitWith { false;};
    hint "You repaired the object"; 
    player playActionNow "PutDown"; 
    cursorObject setDamage 0; 
    true;