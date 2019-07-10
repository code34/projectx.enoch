    [] spawn {
        if(isNull cursorObject && {(cursorObject isKindOf "Man")}) exitWith { false;};
        
        playSound "wrench";
        sleep 4;

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
	};
    

