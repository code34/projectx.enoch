	["playSound", ["eat.ogg", player, false, 5, 1, 10]] call mysound;
	private _virus = floor (random 100);
	["addVirus", _virus] call health;
	[100] call vitems_digesting;