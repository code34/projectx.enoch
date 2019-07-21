	// Mission Military casern
    private _position = selectRandom [[1591.23,7610.05,0.00143909], [9731.79,8533.55,0.00143814], [11272.8,9434.47,0.00143909], [9844.07,8483.14,0.00143814], [5652.86,3796.77,0.00141907]];

	private _flag = true;
	while { _flag } do {
		_flag = ["checkMissionDone", "militarycasern"] call missionloader;
		["remoteSpawn", ["callMilitaryCasernMission", [_position], "client"]] call bmeclient;
		sleep 300 + (random 240);
	};

