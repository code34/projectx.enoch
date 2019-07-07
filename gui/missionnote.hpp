#define GUI_GRID_X  (0)
#define GUI_GRID_Y  (0)
#define GUI_GRID_W  (0.025)
#define GUI_GRID_H  (0.04)
#define GUI_GRID_WAbs   (1)
#define GUI_GRID_HAbs   (1)

class missionnote {                              
    idd = 20000;
    movingEnable = 0;
    objects[] = { };
    controlsBackground[] = { };
    onload = "['setDisplay', _this select 0] call missionnote;";
    class Controls {
		class notepad: RscPicture
		{
			idc = 20002;
			text = "paa\computetab.paa";
			x = -4.5 * GUI_GRID_W + GUI_GRID_X;
			y = -3.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 48.5 * GUI_GRID_W;
			h = 33 * GUI_GRID_H;
		};
		class mapage : RscFeedback
		{
			onMouseButtonClick = "'nextPage' call missionnote;";
		    idc = 20001;
		    x = 0.4 * GUI_GRID_W + GUI_GRID_X;
		    y = 0.1 * GUI_GRID_H + GUI_GRID_Y;
		    w = 38.8 * GUI_GRID_W;
		    h = 24.1 * GUI_GRID_H;
			colorBackground[] = {0.67,0.67,0.4,1};
			colorText[] = {0,0,0,1};
		};
    };
};