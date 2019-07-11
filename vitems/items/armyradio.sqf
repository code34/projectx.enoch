    private _state = missionNamespace getVariable ["armyradiostate", 0];

    switch (_state) do {
    	// le relai radio est actif, il faut le desactiver
    	case 0 : { 
    		[] spawn fnc_relayradio;
    	};
    	default {};
	};
    true;