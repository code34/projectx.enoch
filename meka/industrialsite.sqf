	// Mission Industrial site
    private _position = selectRandom [[10950.2,9036.15], [6390.8,4790.51], [9295.36,11169.9], [11545.4,7083.37]];

	private _flag = true;
	while { _flag } do {
		_flag = ["checkMissionDone", "industrialsite"] call missionloader;
		["remoteSpawn", ["callIndustrialSiteMission", [_position], "client"]] call bmeclient;
		sleep 300 + (random 240);
	};