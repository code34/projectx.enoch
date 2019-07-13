#define GUI_GRID_X  (0)
#define GUI_GRID_Y  (0)
#define GUI_GRID_W  (0.025)
#define GUI_GRID_H  (0.04)
#define GUI_GRID_WAbs   (1)
#define GUI_GRID_HAbs   (1)

class tabnote {                              
    idd = 20000;
    movingEnable = 0;
    objects[] = { };
    controlsBackground[] = { };
    onload = "['setDisplay', _this select 0] call tabnote;";
    onunload = "'closeDialog' call tabnote;";
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
		class F1 : RscFeedback
		{
			onMouseButtonClick = "'nextPage' call tabnote;";
		    idc = 20001;
		    x = 0.4 * GUI_GRID_W + GUI_GRID_X;
		    y = 0.1 * GUI_GRID_H + GUI_GRID_Y;
		    w = 38.8 * GUI_GRID_W;
		    h = 24.1 * GUI_GRID_H;
			colorBackground[] = {0.67,0.67,0.4,1};
			colorText[] = {0,0,0,1};
		};
		class F2 : RscStructuredText
		{
		    idc = 20003;
		    x = 0.4 * GUI_GRID_W + GUI_GRID_X;
		    y = 0.1 * GUI_GRID_H + GUI_GRID_Y;
		    w = 38.8 * GUI_GRID_W;
		    h = 24.1 * GUI_GRID_H;
			colorBackground[] = {0.67,0.67,0.4,1};
			colorText[] = {0,0,0,1};
			class Attributes {
				color = "#000000";
				font = "EtelkaMonospacePro";
				align = "left";
				valign = "top";
				size = "1";
				shadow = false;
			};
		};    
    };
};