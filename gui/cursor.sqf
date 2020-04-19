		private _active = false;
		while { true } do {
			_size = 0;
			_canbeprint = false;
			if ((typeof cursorObject) isKindOf "House_F") then {
				_size = ((2 boundingBoxReal cursorObject) select 2) - 1;
			} else {
				_size = ((2 boundingBoxReal cursorObject) select 2) + 2;
			};
			if (isnull (findDisplay 1000) and isnull (findDisplay 602)) then { _canbeprint = true;};
			if ((cursorObject distance player < _size) and (!(cursorObject isKindOf "Man") or !(alive cursorObject)) and _canbeprint) then {
				if!(_active) then {
					1001 cutRsc ["cursor", "PLAIN"];
					_active = true;
				};
			} else {
				1001 cutText ["", "PLAIN"];
				_active = false;
			};
			sleep 0.1;
		};