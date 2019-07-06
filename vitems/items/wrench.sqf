    if(isNull cursorObject && {(cursorObject isKindOf "Man")}) exitWith { false;};
    
    switch (typeOf cursorObject) do { 
        
        case "Land_TBox_F" : {  
            cursorObject setVariable ["radioactive", false, true];
            true;
        }; 

        default { 
            hint "You repaired the object"; 
            player playActionNow "PutDown"; 
            cursorObject setDamage 0; 
            true;
        }; 
    };
    

