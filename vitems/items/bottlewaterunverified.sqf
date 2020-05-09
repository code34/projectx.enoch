	[20,true] call vitems_drinking;
	if(random 1 < 0.70) then {
		private _virus = floor (random 100);
		["addVirus", _virus] call health;
	};
	["addItemsByLabel", [["emptybottle", 1]]] call capcontainer;
	[20] call vitems_digesting;
	true;