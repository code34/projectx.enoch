    // extraction point
	extractionposition = [];
	extractionvehicle = objNull;
	callExtractionMission = {
		extractionposition = _this select 0;
		extractionvehicle = _this select 1;
	};
   
    while { extractionposition isEqualTo []} do { sleep 1;};

    private _position = extractionposition;
	private _vehicle = extractionvehicle;
	
	while { player distance _position > 25} do { sleep 1;};
	playMusic "stressante";
	sleep 5;
	["setPages", ["meka\story\carnageaeroport1.html", "meka\story\carnageaeroport2.html", "meka\story\carnageaeroport3.html","meka\story\carnageaeroport4.html","meka\story\carnageaeroport5.html"]] call tabnote;
	["showFile", true] call hud;

    [_vehicle, _position] spawn {
        _vehicle = _this select 0;
        _position = _this select 1;

        while { (_vehicle distance _position < 500) } do { sleep 30;};

        if(player in (crew _vehicle)) then {
			["End1", true, 5, true] spawn BIS_fnc_endMission;
        };
    };

	private _id = random 65000;
    private _name = format["extraction_%1", _id];
    private _marker = createMarkerlocal [_name, _position];
    _marker setMarkerShapeLocal  "ELLIPSE";
    _marker setMarkerTypeLocal "hd_pickup";
    _marker setMarkerTextLocal "Extraction";
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerSizeLocal [20,20];
    _marker setMarkerBrushLocal "FDiagonal";

    private _id = random 65000;
    private _name = format["extraction_%1", _id];
    private _marker2 = createMarkerLocal [_name, _position];
    _marker2 setMarkerShapeLocal  "ICON";
    _marker2 setMarkerTypeLocal "hd_pickup";
    _marker2 setMarkerTextLocal "Extraction";
    _marker2 setMarkerColorLocal "ColorRed";
    _marker2 setMarkerSizeLocal [1,1];
    _marker2 setMarkerBrushLocal "FDiagonal";