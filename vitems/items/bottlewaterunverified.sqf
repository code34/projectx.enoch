	[20,true] call vitems_drinking;
	private _virus = floor (random 200);
	["addVirus", _virus] call health;
	["addItemsByLabel", [["emptybottle", 1]]] call capcontainer;
    true;