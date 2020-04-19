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
			class weaponinfo: RscControlsGroup
			{
				idc = 2302;
				x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(profilenamespace getvariable [""IGUI_GRID_WEAPON_X"",		((safezoneX + safezoneW) - 		(10 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) - 4.3 * 			(			((safezoneW / safezoneH) min 1.2) / 40))])";
				y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(profilenamespace getvariable [""IGUI_GRID_WEAPON_Y"",		(safezoneY + 0.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
				w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
				h = "6 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				class controls
				{
					class CA_BackgroundWeapon: RscPicture
					{
						colorText[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
						idc = 1202;
						text = "\A3\ui_f\data\igui\rscingameui\rscunitinfo\gradient_ca.paa";
						x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						y = "1.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					class CA_BackgroundWeaponTitle: RscText
					{
						colorBackground[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
						idc = 1001;
						x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					class CA_BackgroundWeaponTitleDark: RscText
					{
						idc = 1008;
						x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						colorBackground[] = {0,0,0,0.1};
						sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					class CA_BackgroundWeaponMode: RscPicture
					{
						colorText[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
						idc = 1203;
						text = "\A3\ui_f\data\igui\rscingameui\rscunitinfo\mode_background_ca.paa";
						x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						y = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "0.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					class CA_Weapon: RscText
					{
						idc = 118;
						colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
						style = 1;
						x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						y = "0 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						text = "Welcome on ProjectX";
					};
					class CA_ModeTexture: RscPicture
					{
						idc = 187;
						colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
						x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						y = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "0.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					class CA_Mode: RscText
					{
						idc = -1;
						colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
						y = -1;
						x = "-5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						w = "4.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					class CA_ValueReload: RscIGProgress
					{
						idc = 154;
						colorBar[] = {"(profilenamespace getvariable ['IGUI_WARNING_RGB_R',0.8])","(profilenamespace getvariable ['IGUI_WARNING_RGB_G',0.5])","(profilenamespace getvariable ['IGUI_WARNING_RGB_B',0.0])",1};
						colorFrame[] = {0,0,0,0};
						style = 0;
						x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						y = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "0.2 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					class CA_AmmoCount: RscText
					{
						idc = 184;
						style = 1;
						colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
						x = "4.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						y = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						w = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						sizeEx = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						text = "25";
					};
					class CA_MagCount: RscText
					{
						colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
						idc = 185;
						x = "8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						y = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						w = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						text = "8";
					};
					class CA_AmmoType: RscText
					{
						idc = 155;
						colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
						x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						y = "1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						w = "4.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					class CA_GrenadeType: RscText
					{
						colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
						style = 2;
						idc = 152;
						x = "3.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						w = "4.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					class CA_GrenadeCount: RscText
					{
						colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
						style = 1;
						idc = 151;
						x = "8 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						y = "2.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						w = "2 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
					class CA_GunnerWeapon: RscText
					{
						idc = 150;
						colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
						colorBackground[] = {"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])","(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])","(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"};
						style = 1;
						x = "0 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						y = "4 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
						h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
						sizeEx = "0.8 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					};
				};
			};	
	};
};