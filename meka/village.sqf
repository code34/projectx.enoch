	// Mission Village
    private _position = selectRandom [[5958.14,6820.89,0],[7324.22,6442.56,0],[10188.8,6836.29,0],[5234.04,5543.04,0]];
	private _ref = "Box_B_UAV_06_F" createVehicle _position;

	_position spawn {
		private _flag = true;
		private _position = _this;
		while { _flag } do {
			_flag = ["checkMissionDone", "village"] call missionloader;
			["remoteSpawn", ["callVillageMission", [_position], "client"]] call bmeclient;
			sleep 300 + (random 240);
		};
	};
	
	while { ((_position call fnc_getnearestplayer) select 0) > 100} do { sleep 5;};

	private _zombies = ["RyanZombieC_man_1medium", "RyanZombieC_man_polo_1_Fmedium", "RyanZombieC_man_polo_2_Fmedium", "RyanZombieC_man_polo_4_Fmedium", "RyanZombieC_man_polo_5_Fmedium", "RyanZombieC_man_polo_6_Fmedium", "RyanZombieC_man_p_fugitive_Fmedium", "RyanZombieC_man_w_worker_Fmedium", "RyanZombieC_scientist_Fmedium", "RyanZombieC_man_hunter_1_Fmedium", "RyanZombieC_man_pilot_Fmedium", "RyanZombieC_journalist_Fmedium", "RyanZombieC_Orestesmedium", "RyanZombieC_Nikosmedium", "RyanZombie15medium", "RyanZombie16medium", "RyanZombie17medium", "RyanZombie18medium", "RyanZombie19medium", "RyanZombie20medium", "RyanZombie21medium", "RyanZombie22medium", "RyanZombie23medium", "RyanZombie24medium", "RyanZombie25medium", "RyanZombie26medium", "RyanZombie27medium", "RyanZombie28medium", "RyanZombie29medium", "RyanZombie30medium", "RyanZombie31medium", "RyanZombie32medium"];

	private _gc = [];
	private _group = createGroup east;
	private _wgroup = createGroup west;

	for "_i" from 0 to 143 step 1 do {
			_position = _ref getRelPos [200 + (random 100), random 360];
			private _type = format["%1%2", (selectRandom _zombies),"Opfor"];
			private _unit = _group createUnit [_type, _position, [], 0, "NONE"];
			_unit moveTo _position;
			_unit setAnimSpeedCoef 1.3;
			sleep 0.5;
	};
	_group deleteGroupWhenEmpty true;
	_gc append (units _group);

	private _flag = false;
	private _init = false;
	private _civil = objNull;
	while { !_flag } do {
		_flag = true;
		{
			if(_x distance _position > 400) then {
				_x setAnimSpeedCoef 0.9;
				_x forgetTarget (_x findNearestEnemy _x);
			} else {
				_x setAnimSpeedCoef 1.3;
			};

		} forEach _gc;
		{
			if(_x distance _position < 1000) then { _flag = false;};
		} forEach allPlayers;
		sleep 5;
	};

	{deleteVehicle _x;} foreach _gc