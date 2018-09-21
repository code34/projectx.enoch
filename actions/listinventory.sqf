	createDialog "loadingscreen";

	private _i = 0;
	while { _i < 10 } do {
			_i = _i + 1;
			"incProgressBar" call loadingscreen;
			sleep 0.1;
	};
	"closeDialog" call loadingscreen;
	
	createDialog "UI_VITEMS";