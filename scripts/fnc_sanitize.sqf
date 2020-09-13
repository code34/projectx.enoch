	// clean all djunks
	while { true } do {
		{
			if!(isPlayer _x) then {
				private _lifetime = _x getVariable ["lifetime", 0];
				_lifetime = _lifetime + 1;
				if(_lifetime > 10) then { _x setDamage 1; deleteVehicle _x;} else { _x setVariable ["lifetime",_lifetime, false];};
			};
			sleep 0.01;
		} forEach allUnits;
		sleep 60;
	};