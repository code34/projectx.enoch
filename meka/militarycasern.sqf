	// Mission Military casern
    private _position = selectRandom [[1600.23,7605.56], [9712.34,8538.84], [11260.4,9423.81], [9837.61,8492.04], [5641.87,3814.86]];

	private _flag = true;
	while { _flag } do {
		_flag = ["checkMissionDone", "militarycasern"] call missionloader;
		["remoteSpawn", ["callMilitaryCasernMission", [_position], "client"]] call bmeclient;
		sleep 300 + (random 240);
	};