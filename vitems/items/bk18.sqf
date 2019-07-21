    private _object = player;
    
    if(!(isNull cursorObject) && {isPlayer cursorObject} && {alive cursorObject}) then { 
        if(cursorObject distance player < 3) then {
            _object = cursorObject;
        };
    };
       
	player playActionNow "PutDown"; 
	_object setvariable ["ryanzombiesinfected",0];

    true;