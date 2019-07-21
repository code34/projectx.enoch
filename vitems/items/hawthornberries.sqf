    [2,true] call vitems_eating;
    [1,false] call vitems_drinking;

    [] spawn {
    	"slowVirus" call health;
    	sleep 60;
    	"initVirus" call health;
	};
	true;    

	