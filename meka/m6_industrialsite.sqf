	// Mission Industrial site
	private _missionplan = missionNamespace getVariable ["missionplan", 0];
	while { !(_missionplan isEqualTo 1) } do {
		_missionplan = missionNamespace getVariable ["missionplan", 0];
		sleep 1;
	};

    private _gc = [];
    private _position = selectRandom [[10950.2,9036.15,0],[6390.8,4790.51,0],[9295.36,11169.9,0],[11545.4,7083.37,0]];
    //player setpos _position;

    private _name = "industrialsite_zone";
    private _marker = createMarker [_name, _position];
    _marker setMarkerShape  "ELLIPSE";
    _marker setMarkerType "mil_join";
    _marker setMarkerText "";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerSize [100,100];
    _marker setMarkerBrush "FDiagonal";

    private _name = "industrialsite_point";
    private _marker2 = createMarker [_name, _position];
    _marker2 setMarkerShape  "ICON";
    _marker2 setMarkerType "mil_join";
    _marker2 setMarkerText "Industrial site";
    _marker2 setMarkerColor "ColorRed";
    _marker2 setMarkerSize [0.5,0.5];
    _marker2 setMarkerBrush "FDiagonal";

    createbk18stock = {
        _position = _this;
        _number = 5;

        private _gc = [];
        private _posx = _position select 0;
        private _posy = _position select 1;
        private _posz = _position select 2;

        private _object = createSimpleObject ["CargoNet_01_barrels_F", _position];
        private _bbr = 2 boundingBoxReal _object;
        private _p1 = _bbr select 0;
        private _p2 = _bbr select 1;
        private _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
        private _maxLength = abs ((_p2 select 1) - (_p1 select 1));
        private _maxHeight = abs ((_p2 select 2) - (_p1 select 2));
        deleteVehicle _object;

        for "_enumx" from 0 to _number step 1 do {
            for "_enumy" from 0 to _number step 1 do {
                for "_enumz" from 0 to 5 step 1 do {
                    // B_Slingload_01_Fuel_F, CargoNet_01_barrels_F,CBRNContainer_01_closed_yellow_F 
                    private _object = createSimpleObject ["CargoNet_01_barrels_F", [_posx, _posy, _posz]];
                    private _container = ["new", [netId _object, ((getModelInfo _object) select 0)]] call OO_CONTAINER;
                    ["overLoad", [["am212", -1]]] call _container;
                    "save" call _container;
                    ["delete", _container] call OO_CONTAINER;
                    _posz = _posz + _maxHeight;
                    _gc pushBack _object;
                };
                _posz = (getPosASL _camion) select 2;
                _posy = _posy + _maxLength ;
            };
            _posy = _position select 1; 
            _posx = _posx +  _maxWidth;
        };
        _gc;
    };

    player setpos _position;

    private _camion = "B_Truck_01_ammo_F" createVehicleLocal _position;   
    _position = _camion getRelPos [25, 180];
    _gc = _gc + ([_position select 0, _position select 1, (getPosASL _camion) select 2] call createbk18stock);
    //_position = _camion getRelPos [70, floor(random 360)];
    //_gc = _gc + ([_position select 0, _position select 1, (getPosASL _camion) select 2] call createbk18stock);

    private _group = createGroup east;
    private _classes = ["O_Soldier_lite_F", "O_Soldier_lite_F", "O_Soldier_lite_F"];
    {
        _position = _camion getRelPos [10, random 360];
        private _unit = _group createUnit [_x, _position, [], 0, "NONE"];
        _unit setDamage 1;
        _gc pushBack _unit;
        sleep 0.1;
    } foreach _classes;
    deleteGroup _group;

	private _container = ["new", [netId _camion, ((getModelInfo _camion) select 0)]] call OO_CONTAINER;
   	["addItemsByLabel", [["shippingnote", -1]]] call _container;
   	"save" call _container;
    ["delete", _container] call OO_CONTAINER;
    sleep 3600;
    {deleteVehicle _x;} forEach _gc;