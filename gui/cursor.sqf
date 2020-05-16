		private _active = false;
		private _pump = ["stonewell_01_f.p3d","concretewell_02_f.p3d"];

		while { true } do {
			private _size = 0;
			_canbeprint = false;
			switch (true) do { 
				case (((getModelInfo cursorObject) select 0) in _pump) : {
					_size = 3;
				}; 
				case ((typeof cursorObject) isKindOf "House_F") : {
					_size = ((2 boundingBoxReal cursorObject) select 2) - 1;
				}; 
				default {
					_size = ((2 boundingBoxReal cursorObject) select 2) + 2;
				}; 
			};
			if (isnull (findDisplay 1000) and isnull (findDisplay 602)) then { _canbeprint = true;};
			if ((cursorObject distance player < _size) and (!(cursorObject isKindOf "Man") or !(alive cursorObject)) and _canbeprint) then {
				if!(_active) then {
					if!(((getModelInfo cursorObject) select 0) in _pump) then {
						5000 cutRsc ["cursor", "PLAIN"];
					} else {
						5010 cutRsc ["cursorpump", "PLAIN"];
					};
					_active = true;
				};
			} else {
				5000 cutText ["", "PLAIN"];
				5010 cutText ["", "PLAIN"];
				_active = false;
			};
			sleep 1;
		};