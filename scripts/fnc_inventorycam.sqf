		private _pos = (player getRelPos [2,0]);
		invcam = "camera" camcreate [_pos select 0, _pos select 1, (((getPosATL player) select 2) + 1)];
		private _dir = invcam getRelDir player;
		invcam setDir _dir;
		invcam cameraeffect ["external", "front", "invcam"];
		//invcam camSetTarget player;
		invcam camcommitprepared 0;
		showcinemaborder false;