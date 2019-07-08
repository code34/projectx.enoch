    private _state = missionNamespace getVariable ["armyradiostate", 0];

    switch (_state) do {
    	// le relai radio est actif, il faut le desactiver
    	case 0 : { 
    		[] spawn fnc_relayradio;
    	};
    	// le relai radio est inactif, les communications sont rétablies
    	case 1 : {
            ["setPages", ["meka\story\receptionsignal.html"]] call tabnote;
            "createDialog" call tabnote;
    	};
    	default {};
	};