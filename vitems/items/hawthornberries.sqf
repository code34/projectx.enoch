    [2,true] call vitems_eating;
    [1,false] call vitems_drinking;
	[5] call vitems_digesting;

    [] spawn {
    	"slowVirus" call health;
    	sleep 60;
    	"initVirus" call health;
	};
	true;    

	