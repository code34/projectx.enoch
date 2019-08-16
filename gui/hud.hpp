class hud {
	idd = 1000;
	name= "hud";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "with missionNamespace do{ hud = ['new', _this select 0] call oo_hud;};";
	onUnload = "with missionNamespace do{['delete',hud] call oo_hud;};";
	duration = 10000000;
	class controlsBackground {};
	class controls{
			class OOP_Picture_drink_102: OOP_Picture {
				idc = 102;
				x = (safezoneW * 0.9) + safezoneX;
				y = (safezoneH * 0.28) + safezoneY;
				w = 6 * pixelGrid * pixelW;
				h = 5.2 * pixelGrid * pixelH;
				text = "paa\drink.paa";
			};
			class OOP_Picture_food_103: OOP_Picture {
				idc = 103;
				x = (safezoneW * 0.9) + safezoneX;
				y = (safezoneH * 0.36) + safezoneY;
				w = 6 * pixelGrid * pixelW;
				h = 5.2 * pixelGrid * pixelH;
				text = "paa\food.paa";
			};
			class OOP_Picture_life_104: OOP_Picture {
				idc = 104;
				x = (safezoneW * 0.9) + safezoneX;
				y = (safezoneH * 0.44) + safezoneY;
				w = 6 * pixelGrid * pixelW;
				h = 5.2 * pixelGrid * pixelH;
				text = "paa\life.paa";
			};
			class OOP_Picture_virus_105: OOP_Picture {
				idc = 105;
				x = (safezoneW * 0.9) + safezoneX;
				y = (safezoneH * 0.52) + safezoneY;
				w = 6 * pixelGrid * pixelW;
				h = 5.2 * pixelGrid * pixelH;
				text = "paa\virus.paa";
			};
			class OOP_Picture_blood_110: OOP_Picture {
				idc = 111;
				x = (safezoneW * 0.9) + safezoneX;
				y = (safezoneH * 0.60) + safezoneY;
				w = 6 * pixelGrid * pixelW;
				h = 5.2 * pixelGrid * pixelH;
				text = "paa\blood.paa";
			};	
			class OOP_Picture_zombie_112: OOP_Picture {
				idc = 112;
				x = (safezoneW * 0.9) + safezoneX;
				y = (safezoneH * 0.68) + safezoneY;
				w = 6 * pixelGrid * pixelW;
				h = 5.2 * pixelGrid * pixelH;
				text = "paa\zombie.paa";
			};	
			class OOP_Picture_file_110: OOP_Picture {
				idc = 110;
				x = (safezoneW * 0.9) + safezoneX;
				y = (safezoneH * 0.76) + safezoneY;
				w = 6 * pixelGrid * pixelW;
				h = 5.2 * pixelGrid * pixelH;
				text = "paa\file.paa";
			};						
			class OOP_Text_drink_106: OOP_Text {
				idc = 106;
				x = (safezoneW * 0.94) + safezoneX;
				y = (safezoneH * 0.28) + safezoneY;
				w = 5.748 * pixelGrid * pixelW;
				h = 3.46667 * pixelGrid * pixelH;
				text = "100%";
				colorText[] = {1, 1, 1, 1};
				tooltipColorText[] = {1, 1, 1, 1};
			};
			class OOP_Text_food_107: OOP_Text {
				idc = 107;
				x = (safezoneW * 0.94) + safezoneX;
				y = (safezoneH * 0.36) + safezoneY;
				w = 5.748 * pixelGrid * pixelW;
				h = 3.46667 * pixelGrid * pixelH;
				text = "100%";
				colorText[] = {1, 1, 1, 1};
				tooltipColorText[] = {1, 1, 1, 1};
			};
			class OOP_Text_life_108: OOP_Text {
				idc = 108;
				x = (safezoneW * 0.94) + safezoneX;
				y = (safezoneH * 0.44) + safezoneY;
				w = 6 * pixelGrid * pixelW;
				h = 3.46667 * pixelGrid * pixelH;
				text = "100%";
				colorText[] = {1, 1, 1, 1};
				tooltipColorText[] = {1, 1, 1, 1};
			};
			class OOP_Text_virus_109: OOP_Text {
				idc = 109;
				x = (safezoneW * 0.94) + safezoneX;
				y = (safezoneH * 0.52) + safezoneY;
				w = 6 * pixelGrid * pixelW;
				h = 3.46667 * pixelGrid * pixelH;
				text = "100%";
				colorText[] = {1, 1, 1, 1};
				tooltipColorText[] = {1, 1, 1, 1};
			};
			class OOP_Text_zombie_113: OOP_Text {
				idc = 113;
				x = (safezoneW * 0.94) + safezoneX;
				y = (safezoneH * 0.68) + safezoneY;
				w = 6 * pixelGrid * pixelW;
				h = 3.46667 * pixelGrid * pixelH;
				text = "100%";
				colorText[] = {1, 1, 1, 1};
				tooltipColorText[] = {1, 1, 1, 1};
			};
			class OOP_Text_file_114: OOP_Text {
				idc = 114;
				x = (safezoneW * 0.94) + safezoneX;
				y = (safezoneH * 0.76) + safezoneY;
				w = 6 * pixelGrid * pixelW;
				h = 3.46667 * pixelGrid * pixelH;
				text = "F1";
				colorText[] = {1, 1, 1, 1};
				tooltipColorText[] = {1, 1, 1, 1};
			};
		};
};