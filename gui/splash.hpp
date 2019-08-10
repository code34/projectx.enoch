class splash {
	idd = 15000;
	name= "splash";
	movingEnable = false;
	enableSimulation = true;
	class RscPicture_15001: RscPicture
	{
		idc = 15001;
		text = "\splash\splash.jpg";
		x = -18 * GUI_GRID_W + GUI_GRID_X;
		y = -5.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 76 * GUI_GRID_W;
		h = 36 * GUI_GRID_H;
	};
	class RscButtonMenu_15002: RscButtonMenu
	{
		idc = 15002;
		text = "START GAME"; //--- ToDo: Localize;
		x = 42 * GUI_GRID_W + GUI_GRID_X;
		y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 7 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
		action = "closeDialog 0";
	};
	class RscButtonMenu_15003: RscButtonMenu
	{
		idc = 15003;
		text = "CREDITS"; //--- ToDo: Localize;
		x = 42 * GUI_GRID_W + GUI_GRID_X;
		y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 7 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
		action = "closeDialog 0";
	};
};