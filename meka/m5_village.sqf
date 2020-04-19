	// Mission Village

	private _missionplan = missionNamespace getVariable ["missionplan", 0];
	while { !(_missionplan isEqualTo 1) } do {
		_missionplan = missionNamespace getVariable ["missionplan", 0];
		sleep 1;
	};	

	// on recupere un centre medical
	private _house = selectRandom (nearestObjects [[6000,6000], ["Land_HealthCenter_01_F"] , 6000]);
	private _position = getpos _house;

	private _container = ["new", [netId _house, ((getModelInfo _house) select 0)]] call OO_CONTAINER;
	["addItemsByLabel", [["medicalnote", -1],["bk18researchreport", -1],["bk18", 20]]] call _container;
	"save" call _container;
	["delete", _container] call OO_CONTAINER;

    private _name = "village_zone";
    private _marker = createMarker [_name, _position];
    _marker setMarkerShape  "ELLIPSE";
    _marker setMarkerType "mil_join";
    _marker setMarkerText "";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerSize [100,100];
    _marker setMarkerBrush "FDiagonal";

    private _name = "village_point";
    private _marker2 = createMarker [_name, _position];
    _marker2 setMarkerShape  "ICON";
    _marker2 setMarkerType "mil_join";
    _marker2 setMarkerText "Desolated village";
    _marker2 setMarkerColor "ColorRed";
    _marker2 setMarkerSize [0.5,0.5];
    _marker2 setMarkerBrush "FDiagonal";

	while { ((_position call fnc_getnearestplayer) select 0) > 100} do { sleep 5;};

	private _zombies = ["RyanZombieC_man_1medium", "RyanZombieC_man_polo_1_Fmedium", "RyanZombieC_man_polo_2_Fmedium", "RyanZombieC_man_polo_4_Fmedium", "RyanZombieC_man_polo_5_Fmedium", "RyanZombieC_man_polo_6_Fmedium", "RyanZombieC_man_p_fugitive_Fmedium", "RyanZombieC_man_w_worker_Fmedium", "RyanZombieC_scientist_Fmedium", "RyanZombieC_man_hunter_1_Fmedium", "RyanZombieC_man_pilot_Fmedium", "RyanZombieC_journalist_Fmedium", "RyanZombieC_Orestesmedium", "RyanZombieC_Nikosmedium", "RyanZombie15medium", "RyanZombie16medium", "RyanZombie17medium", "RyanZombie18medium", "RyanZombie19medium", "RyanZombie20medium", "RyanZombie21medium", "RyanZombie22medium", "RyanZombie23medium", "RyanZombie24medium", "RyanZombie25medium", "RyanZombie26medium", "RyanZombie27medium", "RyanZombie28medium", "RyanZombie29medium", "RyanZombie30medium", "RyanZombie31medium", "RyanZombie32medium"];

	private _gc = [];
	private _group = createGroup east;

	for "_i" from 0 to 60 step 1 do {
			//_position = _house getRelPos [200 + (random 100), random 360];
			_position = _house getRelPos [5 + (random 10), random 360];
			private _type = format["%1%2", (selectRandom _zombies),"Opfor"];
			private _unit = _group createUnit [_type, _position, [], 0, "NONE"];
			_unit setDamage 1;
			_unit setdir (random 360);
			_gc pushBack _unit;
			//_unit moveTo _position;
			//_unit setAnimSpeedCoef 1.3;
			//sleep 0.5;
	};

	sleep 480;

	{
		hideBody _x;
		sleep 1;
		deleteVehicle _x;
		sleep 5;
	} forEach _gc;

/*	_group deleteGroupWhenEmpty true;
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

	{deleteVehicle _x;} foreach _gc*/