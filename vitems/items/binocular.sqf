private _result = [player, "Binocular"] call BIS_fnc_hasItem;
if!(_result) then {player addWeapon "Binocular";};
false;