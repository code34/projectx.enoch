	[20,true] call vitems_drinking;
	if(random 1 < 0.97) then {
		private _virus = floor (random 200);
		["addVirus", _virus] call health;
	};
	["addItemsByLabel", [["emptybottle", 1]]] call capcontainer;
	[20] call vitems_digesting;
    true;