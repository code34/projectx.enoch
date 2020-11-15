private _result = [player, "ItemCompass"] call BIS_fnc_hasItem;
if!(_result) then {player addWeapon "ItemCompass";};
false;