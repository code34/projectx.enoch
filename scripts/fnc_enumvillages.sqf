	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// Parse villages on map
	// -----------------------------------------------

	private ["_countofobject", "_sizeofzone", "_myy", "_myx", "_array", "_temp"];

	wcmapbottomleft = [0,0];
	wcmaptopright = [13000,13000];
	wcminimunbuildings = 20;
	wczones= [];

	_lastpos = [0,0];
	_sizeofzone = 1000;
	_myy = (wcmapbottomleft select 1);

	while { _myy < (wcmaptopright select 1) } do {
		for "_myx" from (wcmapbottomleft select 0) to ((wcmaptopright select 0) - 1) step _sizeofzone do {
			private _newy = _myy + (_sizeofzone / 2);
			private _newx = _myx + (_sizeofzone / 2);
			private _temp = [_newx, _newy];

            private _id = random 65000;
            private _name = format["target_%1", _id];
            private _marker = createMarker [_name, _temp];
            _marker setMarkerShape "RECTANGLE";
            _marker setMarkerType "loc_CivilDefense";
            _marker setMarkerText _name;
            _marker setMarkerColor "ColorRed";
            _marker setMarkerSize [_sizeofzone/2, _sizeofzone/2];
            _marker setMarkerBrush "FDiagonal";

			_array = nearestObjects [_temp, ["House_F", "House"] , (_sizeofzone / 2)];
			sleep 0.1;
			_countofobject = count _array;

			if (_countofobject > wcminimunbuildings) then {
				_marker setMarkerColor "ColorBlue";
				wczones pushBack _temp;
			};
		};
		_myy = _myy + _sizeofzone;
		sleep 0.01;
	};

	systemChat "Spawning system: initilialized";
	copyToClipboard format ["%1", wczones];

    /*      wczones = [];
        {
            {
                private _position = locationPosition _x;
                private _xcord = (size _x) select 0;
                private _ycord = (size _x) select 1;
                private _size = sqrt((_xcord * _xcord) + (_ycord * _ycord));
                _size = [_size, _size];
                wczones pushBack [_position, _size];

                private _id = random 65000;
                private _name = format["target_%1", _id];
                private _marker = createMarker [_name,_position];
                _marker setMarkerShape "ELLIPSE";
                _marker setMarkerType "loc_CivilDefense";
                _marker setMarkerText _name;
                _marker setMarkerColor "ColorRed";
                _marker setMarkerSize _size;
                _marker setMarkerBrush "FDiagonal";
                true;
            } count nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), [_x], worldSize];
            true;
        } count ["NameVillage", "NameCity", "NameCityCapital","NameLocal"];*/