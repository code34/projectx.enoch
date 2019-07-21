    [0,true] call vitems_eating;

    [] spawn {
    	"slowVirus" call health;
    	sleep 60;
    	"initVirus" call health;
	};
	true;