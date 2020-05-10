	// extraction point   
	private _position = [4090.96,10220.8,0.101196];
	private _name = "extraction_zone";
	private _marker = createMarker [_name, _position];
	_marker setMarkerShape  "ELLIPSE";
	_marker setMarkerType "hd_pickup";
	_marker setMarkerText "Extraction";
	_marker setMarkerColor "ColorRed";
	_marker setMarkerSize [20,20];
	_marker setMarkerBrush "FDiagonal";

	private _name = "extraction_point";
	private _marker2 = createMarkerLocal [_name, _position];
	_marker2 setMarkerShape  "ICON";
	_marker2 setMarkerType "hd_pickup";
	_marker2 setMarkerText "Extraction Point";
	_marker2 setMarkerColor "ColorRed";
	_marker2 setMarkerSize [0.5,0.5];
	_marker2 setMarkerBrush "FDiagonal";

	// Require RHS - USA SOCOM
	private _vehicle = createVehicle ["C_Heli_Light_01_civil_F", _position, [], 0, "NONE"];
	private _container = ["new", [netId _vehicle, ((getModelInfo _vehicle) select 0)]] call OO_CONTAINER;
	private _content = [["failurehelicopterengine", 1]];
	["overLoad", _content] call _container;
	"save" call _container;
	["delete", _container] call OO_CONTAINER;
	 
	_vehicle spawn { 
		private _vehicle = _this;
		private _flag = false;
		while {!_flag} do {
			_flag = _vehicle getVariable ["enginerepaired", false];
			if((missionNamespace getVariable ["xsitereport", 0]) isEqualTo 1) then { _flag = true;};
			_vehicle setHitPointDamage["HitEngine", 1];
			sleep 1;
		};
		_vehicle setHitPointDamage["HitEngine", 0];
	};

	private _group = createGroup west;
	private _classes = ["B_T_Engineer_F", "B_T_Soldier_A_F", "B_T_Soldier_AAR_F", "B_T_Support_AMG_F"];
	{
		private _defendposition =  (_vehicle getRelPos [random 25, random 360]);
		private _unit = _group createUnit [_x, _defendposition, [], 0, "FORM"];
		_unit setDamage 1;
		sleep 0.1;
	} foreach _classes;
	deleteGroup _group;