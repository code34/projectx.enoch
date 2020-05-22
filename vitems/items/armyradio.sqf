	private _state = missionNamespace getVariable ["armyradiostate", 0];
	switch (_state) do { 
		case 0 : {missionNamespace setVariable ["armyradiostate", 1, true];}; 
		case 1 : { playsound "carrier";};
		default {playSound "whitenoise";}; 
	};
	false;