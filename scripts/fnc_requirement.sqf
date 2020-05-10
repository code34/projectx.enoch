	_vehicle = _this;

	// Require RHS - USA SOCOM
	private _container = ["new", [netId _vehicle, ((getModelInfo _vehicle) select 0)]] call OO_CONTAINER;
	private _content = [["failureengine", 1]];
	["overLoad", _content] call _container;
	"save" call _container;
	["delete", _container] call OO_CONTAINER;

	_vehicle spawn { 
		private _vehicle = _this;
		private _flag = false;
		while {!_flag} do {
			_flag = _vehicle getVariable ["enginerepaired", false];
			_vehicle setHitPointDamage["HitEngine", 1];
			sleep 5;
		};
		_vehicle setHitPointDamage["HitEngine", 0];
		_vehicle setDamage 0;
	};