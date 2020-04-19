	private _radio = nearestObjects [playerstartatpos, ["Land_Communication_F"], 5000];
    sleep 1;

	private _name = "antenne_radio";
	_missionmarker = createMarker [_name, position (_radio select 0)];
	_missionmarker setMarkerShape "ICON";
	_missionmarker setMarkerType "selector_selectedMission";
	_missionmarker setMarkerText "Antenne Radio";
	_missionmarker setMarkerColor "ColorRed";
	_missionmarker setMarkerSize [1,1];
	_missionmarker setMarkerBrush "FDiagonal";