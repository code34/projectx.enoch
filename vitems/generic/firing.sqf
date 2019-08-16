
    private _time = _this select 0;
    private _position = player getRelPos [2,0];
    private _fire = "FirePlace_burning_F" createVehicle _position;
    _fire setpos _position;
        
    [_time, _fire] spawn {
        private _time = _this select 0;
        private _fire = _this select 1;
        while { _time > 0 } do {
            if (inflamed _fire) then {
                _time = _time  - 1;
            };
            sleep 1;
        };
        deleteVehicle _fire;
    };
    true;