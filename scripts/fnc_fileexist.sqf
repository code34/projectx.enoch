    // Killzone kid script
    disableSerialization;
    private _ctrl = findDisplay 0 ctrlCreate ["RscHTML", -1];
    _ctrl htmlLoad "vitems\items\" + _this;
    private _result = ctrlHTMLLoaded _ctrl;
    ctrlDelete _ctrl;
    _result;