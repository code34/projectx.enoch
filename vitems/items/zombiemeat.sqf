	[20,true] call vitems_eating;
	private _rate = 0;
	if(random 1 > 0.7) then { _rate = 200;};
	[_rate] call vitems_digesting;