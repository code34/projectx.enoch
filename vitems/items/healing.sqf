
        private _bonus = _this select 0;
        ["addLife", _bonus] call (missionNamespace getVariable "health");
        true;