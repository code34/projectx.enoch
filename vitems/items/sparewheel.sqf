	
	if(isNull cursorObject && {!(cursorObject isKindOf "Car")}) exitWith { false;};
	_hitpoint = ["HitLFWheel","HitLF2Wheel","HitLMWheel","HitLBWheel","HitRFWheel","HitRF2Wheel","HitRMWheel","HitRBWheel"];

	private _max = 0;
	private _selected = "";

	{
		if((cursorObject getHitPointDamage _x) > _max) then { 
			_selected = _x; 
			_max = (cursorObject getHitPointDamage _x);
		};
	} forEach _hitpoint;

	cursorObject setHitPointDamage [_selected, 0];

	hint "You repaired the car"; 
	player playActionNow "PutDown"; 
	//cursorObject setDamage 0; 
	true;