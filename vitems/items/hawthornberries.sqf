	[2,true] call vitems_eating;
	[1,false] call vitems_drinking;
	[5] call vitems_digesting;
	["slowZombie",60] spawn health;
	true;