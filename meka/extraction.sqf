    // extraction point

    _position = [4090.96,10220.8,0.101196];
    
    private _veh = createVehicle ["C_Heli_Light_01_civil_F", _position, [], 0, "NONE"];
    _veh setVariable ["requirement", ["wrench", "axe"],true];
    player setpos getpos _veh;

    private _id = random 65000;
    private _name = format["extraction_%1", _id];
    private _marker = createMarker [_name, position _veh];
        
    _marker setMarkerShape "ICON";
    _marker setMarkerType "hd_pickup";
    _marker setMarkerText "Extraction Zone";
    _marker setMarkerColor "ColorBlue";
    _marker setMarkerSize [0.5,0.5];
    _marker setMarkerBrush "FDiagonal";