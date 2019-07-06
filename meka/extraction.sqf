    // extraction point

    private _position = [4090.96,10220.8,0.101196];
    private _vehicle = createVehicle ["C_Heli_Light_01_civil_F", _position, [], 0, "NONE"];
    _vehicle setVariable ["requirement", ["choppermotor", "wrench"],true];

    private _id = random 65000;
    private _name = format["extraction_%1", _id];
    private _marker = createMarker [_name, position _vehicle];
        
    _marker setMarkerShape "ICON";
    _marker setMarkerType "hd_pickup";
    _marker setMarkerText "Extraction Zone";
    _marker setMarkerColor "ColorBlue";
    _marker setMarkerSize [0.5,0.5];
    _marker setMarkerBrush "FDiagonal";

    while { _vehicle distance _position < 500} do {
    	sleep 30;
    };

    {
    	["remoteSpawn", ["callEnd", "End1", "client", owner _x]] call bmeclient;
    	sleep 0.1;
    } forEach (crew _vehicle);