closeDialog 0;
private _result = [player, "ItemMap"] call BIS_fnc_hasItem;
if!(_result) then {player addWeapon "ItemMap";};
openMap true;
mapAnimAdd [0, 1, [6000,6000]];
mapAnimCommit;
false;