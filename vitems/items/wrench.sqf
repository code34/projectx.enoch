    if(isNull cursorObject && {(cursorObject isKindOf "Man")}) exitWith { false;};
    if(cursorObject distance player > 5) exitWith { false;};
        
	playSound "wrench";

	switch (typeOf cursorObject) do {    
		case "Land_TBox_F" : {  
			cursorObject setVariable ["radioactive", false, true];
			player playActionNow "PutDown"; 
			true;
		}; 

		default { 
			hint "You repaired the object"; 
			player playActionNow "PutDown"; 
			cursorObject setDamage 0; 
			true;
		}; 
	};
	true;

    

