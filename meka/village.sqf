	// Mission Village
    private _position = selectRandom [[5958.14,6820.89], [7324.22,6442.56], [10188.8,6836.29], [5234.04,5543.04]];

    hintc "here";

	private _flag = true;
	while { _flag } do {
		_flag = ["checkMissionDone", "village"] call missionloader;
		["remoteSpawn", ["callVillageMission", [_position], "client"]] call bmeclient;
		sleep 300 + (random 240);
	};