    
    if(isNull cursorObject && {!(cursorObject isKindOf "Car")}) exitWith { false;};
    hint "You repaired the car"; 
    player playActionNow "PutDown"; 
    cursorObject setDamage 0; 
    true;