	// Mission Village
    private _position = selectRandom [[4583.51,6406.58,0],[5244.35,5519.82,0],[5989.35,6813.9,0],[7663.97,5317.38,0],[7343.57,6417.51,0],[5964.46,8082.89,0],[8120.9,8726.18,0],[9881.56,8439.16,0],[10353.8,6832.84,0],[8441.52,6902.36,0]];
	private _ref = "Box_B_UAV_06_F" createVehicle _position;

	_position spawn {
		private _flag = true;
		private _position = _this;
		while { _flag } do {
			//_flag = ["checkMissionDone", "village"] call missionloader;
			["remoteSpawn", ["callVillageMission", [_position], "client"]] call bmeclient;
			sleep 300 + (random 240);
		};
	};

	private _houses = nearestObjects [_position, ["Ruins"] , 100];
	sleep 2;

	{
		if(random 1 > 0) then {
			private _container = ["new", [netId _x, ((getModelInfo _x) select 0)]] call OO_CONTAINER;
   			["addItemsByLabel", [["medicalnote", -1]]] call _container;
   			"save" call _container;
   			["delete", _container] call OO_CONTAINER;
   		};
   		sleep 1;
	}foreach _houses;

	while { ((_position call fnc_getnearestplayer) select 0) > 100} do { sleep 5;};

	private _zombies = ["RyanZombieC_man_1medium", "RyanZombieC_man_polo_1_Fmedium", "RyanZombieC_man_polo_2_Fmedium", "RyanZombieC_man_polo_4_Fmedium", "RyanZombieC_man_polo_5_Fmedium", "RyanZombieC_man_polo_6_Fmedium", "RyanZombieC_man_p_fugitive_Fmedium", "RyanZombieC_man_w_worker_Fmedium", "RyanZombieC_scientist_Fmedium", "RyanZombieC_man_hunter_1_Fmedium", "RyanZombieC_man_pilot_Fmedium", "RyanZombieC_journalist_Fmedium", "RyanZombieC_Orestesmedium", "RyanZombieC_Nikosmedium", "RyanZombie15medium", "RyanZombie16medium", "RyanZombie17medium", "RyanZombie18medium", "RyanZombie19medium", "RyanZombie20medium", "RyanZombie21medium", "RyanZombie22medium", "RyanZombie23medium", "RyanZombie24medium", "RyanZombie25medium", "RyanZombie26medium", "RyanZombie27medium", "RyanZombie28medium", "RyanZombie29medium", "RyanZombie30medium", "RyanZombie31medium", "RyanZombie32medium"];

	private _gc = [];
	private _group = createGroup east;

	for "_i" from 0 to 60 step 1 do {
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