    if(random 1 > 0.9) then {
    	[20,true] call vitems_drinking;
    } else {
		[120,true] call vitems_drinking;
	};
	["addItemsByLabel", [["emptybottle", 1]]] call capcontainer;
    true;