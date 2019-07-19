    private _state = missionNamespace getVariable ["armyradiostate", 0];
    switch (_state) do { 
    	case 0 : {
    		[] spawn fnc_relayradio_clientside; 
    	}; 
    	case -1 : {
    		playsound "carrier";
    	};
    	default {
    		playSound "whitenoise";
    	}; 
    };
    true;