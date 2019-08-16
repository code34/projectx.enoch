class Vitems {
	idd = 1000;
	name= "Vitems";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "with missionNamespace do{Vitems = ['new', _this select 0] call oo_Vitems;};";
	onUnload = "with missionNamespace do{['delete',Vitems] call oo_Vitems;};";
	class controlsBackground {
			class OOP_fond_items: RscStructuredText {
				idc = 99;
				x = (safezoneW * 0.26) + safeZoneX;
				y = (safezoneH * 0.09) + safeZoneY;
				w = (safezoneW * 0.48);
				h = (safezoneH * 0.70);
				text = "";
				colorBackground[] = {0, 0, 0, 0.8};
				size = (GUI_GRID_H * 1.15);
			};
	};
	class controls {
			class OOP_MainLayer_100_100 : OOP_MainLayer {
				idc = 100;
				x = safeZoneX;
				y = safeZoneY;
				w = safeZoneW;
				h = safeZoneH;
				onLBDrop = "['dragDrop', _this] call VITEMS;";
				//onMouseButtonDown	= "[1,_this] call myEventFunction";
				//onMouseButtonUp		= "[2,_this] call myEventFunction";
				class controls{
					class OOP_Listbox_Proximity_102: OOP_Listbox {
						idc = 102;
						x = (safezoneW * 0);
						y = (safezoneH * 0.04);
						w = (safezoneW * 0.25);
						h = (safezoneH * 0.96);
						rowHeight = 0.10;
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
						colorBackground[] = {0, 0, 0, 0.6};
					};
					class OOP_Listbox_Capacities_103: OOP_Listbox {
						idc = 103;
						x = (safezoneW * 0.75);
						y = (safezoneH * 0.04);
						w = (safezoneW * 0.25);
						h = (safezoneH * 0.96);
						rowHeight = 0.10;
						canDrag = 1;
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Capacities', _this] call Vitems;";
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
						onMouseButtonClick = "['setMenu', _this] call VITEMS";
						colorBackground[] = {0, 0, 0, 0.6};
					};
					class OOP_Text_proximity_104: RscStructuredText {
						idc = 104;
						x = (safezoneW * 0);
						y = (safezoneH * 0);
						w = (safezoneW * 0.25);
						h = (safezoneH * 0.04);
						text = "Proximity";
						size = GUI_TEXT_SIZE_LARGE;
						colorText[] = {1, 1, 1, 1};
						colorBackground[] = {0.5, 0.5, 0.5, 0.8};
						tooltipColorText[] = {1, 1, 1, 1};
						class Attributes {
							align = "center";
						};						
					};
					class OOP_Text_Capacities_105: RscStructuredText {
						idc = 105;
						x = (safezoneW * 0.75);
						y = (safezoneH * 0);
						w = (safezoneW * 0.25);
						h = (safezoneH * 0.04);
						text = "Capacities";
						size = GUI_TEXT_SIZE_LARGE;
						colorText[] = {1, 1, 1, 1};
						colorBackground[] = {0.5, 0.5, 0.5, 0.8};
						tooltipColorText[] = {1, 1, 1, 1};
						class Attributes {
							align = "center";
						};						
					};
					class OOP_Text_Inventory_106: RscStructuredText {
						idc = 106;
						x = (safezoneW * 0.25);
						y = (safezoneH * 0);
						w = (safezoneW * 0.5);
						h = (safezoneH * 0.08);
						text = "Inventory";
						size = 0.1;
						colorText[] = {1, 1, 1, 1};
						colorBackground[] = {0, 0, 0, 0.6};
						tooltipColorText[] = {1, 1, 1, 1};
						class Attributes {
							align = "center";
						};					
					};
					class OOP_Text_Description_107: RscStructuredText {
						idc = 107;
						x = (safezoneW * 0.25);
						y = (safezoneH * 0.8);
						w = (safezoneW * 0.5);
						h = (safezoneH * 0.20);
						text = "Description";
						colorBackground[] = {0, 0, 0, 0.6};
						size = (GUI_GRID_H * 1.15);
					};					
					class mymenu : ctrlMenu {
						idc = 108;
						x = (safezoneW * 0.7);
						y = (safezoneH * 0.2);
						w = (safezoneW * 0.1);
						h = (safezoneH * 0.02);
						onMouseButtonClick = "['closeMenu', _this] call VITEMS";
						class Items {
							items[] = {"Use","Shred","Drop","View"};
							class Default {
								text = "";
								data = "";
								enable = 0;
								action = "";
							};
							class Use {
								text = "Use";
								action = "['actionMenu', 'use'] call VITEMS";
							};
							class Shred  {
								text = "Shred";
								action = "['actionMenu', 'shred'] call VITEMS";
							};
							class Drop  {
								text = "Drop";
								action = "['actionMenu', 'drop'] call VITEMS";
							};
							class View  {
								text = "View item";
								action = "['actionMenu', 'View'] call VITEMS";
							};
						};
					};
					class headBackground : RscStructuredText {
						idc = 1099;
						x = (safezoneW * 0.45);
						y = (safezoneH * 0.12);
						w = (safezoneW * 0.1);
						h = (safezoneH * 0.1);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class head : RscActiveText {
						idc = 119;
						x = (safezoneW * 0.45);
						y = (safezoneH * 0.12);
						w = (safezoneW * 0.1);
						h = (safezoneH * 0.1);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};

					class uniformBackground : RscStructuredText {
						idc = 1100;
						x = (safezoneW * 0.265);
						y = (safezoneH * 0.23);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.22);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class uniform : RscActiveText {
						idc = 120;
						x = (safezoneW * 0.265);
						y = (safezoneH * 0.23);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.22);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};

					class vestBackground : RscStructuredText {
						idc = 1101;
						x = (safezoneW * 0.435);
						y = (safezoneH * 0.23);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.22);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class vest : RscActiveText {
						idc = 121;
						x = (safezoneW * 0.435);
						y = (safezoneH * 0.23);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.22);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						//onButtonClick = "hintc 'simple';";
						//onButtonDown = "systemchat format['down: %1', _this];";
						//onButtonUp = "systemchat format['up: %1', _this];";
					};

					class bagBackground : RscStructuredText {
						idc = 1102;
						x = (safezoneW * 0.605);
						y = (safezoneH * 0.23);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.22);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class bag : RscActiveText {
						idc = 122;
						x = (safezoneW * 0.605);
						y = (safezoneH * 0.23);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.22);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};

					class primaryweaponBackground : RscStructuredText {
						idc = 1089;
						x = (safezoneW * 0.265);
						y = (safezoneH * 0.60);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.11);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class primaryweapon : RscActiveText {
						idc = 109;
						x = (safezoneW * 0.265);
						y = (safezoneH * 0.60);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.11);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};
					class gunweaponBackground : RscStructuredText {
						idc = 1091;
						x = (safezoneW * 0.4);
						y = (safezoneH * 0.60);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.11);
						colorBackground[] = {0.5,0.5,0.5,1};
					};					
					class gunweapon : RscActiveText {
						idc = 111;
						x = (safezoneW * 0.4);
						y = (safezoneH * 0.60);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.11);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};
					class secondaryweaponBackground : RscStructuredText {
						idc = 1090;
						x = (safezoneW * 0.535);
						y = (safezoneH * 0.60);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.11);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class secondaryweapon : RscActiveText {
						idc = 110;
						x = (safezoneW * 0.535);
						y = (safezoneH * 0.60);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.11);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};
					class binocularBackground : RscStructuredText {
						idc = 1092;
						x = (safezoneW * 0.67);
						y = (safezoneH * 0.60);
						w = (safezoneW * 0.06);
						h = (safezoneH * 0.11);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class binocular : RscActiveText {
						idc = 112;
						x = (safezoneW * 0.67);
						y = (safezoneH * 0.60);
						w = (safezoneW * 0.06);
						h = (safezoneH * 0.11);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};
					class magprimaryweaponBackground : RscStructuredText {
						idc = 1093;
						x = (safezoneW * 0.265);
						y = (safezoneH * 0.72);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class magprimaryweapon : RscActiveText {
						idc = 113;
						x = (safezoneW * 0.265);
						y = (safezoneH * 0.72);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};					
					class maggunweaponBackground : RscStructuredText {
						idc = 1094;
						x = (safezoneW * 0.4);
						y = (safezoneH * 0.72);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class maggunweapon : RscActiveText {
						idc = 114;
						x = (safezoneW * 0.4);
						y = (safezoneH * 0.72);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};					
					class magsecondaryweaponBackground : RscStructuredText {
						idc = 1095;
						x = (safezoneW * 0.535);
						y = (safezoneH * 0.72);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class magsecondaryweapon : RscActiveText {
						idc = 115;
						x = (safezoneW * 0.535);
						y = (safezoneH * 0.72);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};

					class opticprimaryweaponBackground : RscStructuredText {
						idc = 1096;
						x = (safezoneW * 0.306);
						y = (safezoneH * 0.72);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class opticprimaryweapon : RscActiveText {
						idc = 116;
						x = (safezoneW * 0.306);
						y = (safezoneH * 0.72);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};					
					class opticgunweaponBackground : RscStructuredText {
						idc = 1097;
						x = (safezoneW * 0.441);
						y = (safezoneH * 0.72);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class opticgunweapon : RscActiveText {
						idc = 117;
						x = (safezoneW * 0.441);
						y = (safezoneH * 0.72);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};					
					class opticsecondaryweaponBackground : RscStructuredText {
						idc = 1098;
						x = (safezoneW * 0.576);
						y = (safezoneH * 0.72);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class opticsecondaryweapon : RscActiveText {
						idc = 118;
						x = (safezoneW * 0.576);
						y = (safezoneH * 0.72);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						style = "0x30 + 0x800";
						soundDoubleClick[] = {"",0.1,1};
						color[] = {1,1,1,1};
						colorBackground[] = {0,0,0,1};
						colorBackgroundSelected[] = {1,1,1,1};
						colorFocused[] = {0.0,0.0,0.0,0};
						onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
						canDrag = 1;
						onLBDragging = "['setDestination', _this] call VITEMS";
						onLBDrag = "['setSource', _this] call VITEMS";
						//onMouseButtonClick = "['setMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};

				};	
			};			
/*				class OOP_btn_use_110: OOP_Button {
						idc = 110;
						x = 90 * pixelGrid * pixelW;
						y = 27.7333 * pixelGrid * pixelH;
						w = 16 * pixelGrid * pixelW;
						h = 5.2 * pixelGrid * pixelH;
						text = "Use";
						action = "'btnAction_OOP_btn_use' call Vitems;";
					};
				class OOP_btn_weapons_111: OOP_Button {
					idc = 111;
					x = 90 * pixelGrid * pixelW;
					y = 20.8 * pixelGrid * pixelH;
					w = 16 * pixelGrid * pixelW;
					h = 5.2 * pixelGrid * pixelH;
					text = "Weapons";
					action = "'btnAction_OOP_btn_weapons' call Vitems;";
				};*/
	};
};

/*
["Vitems",1000,[[[["35.9269 * pixelGrid * pixelW","17.3333 * pixelGrid * pixelH","72.0731 * pixelGrid * pixelW","52 * pixelGrid * pixelH"],"text","OOP_Text_Fond","","OOP_Text",true,[],[-1,-1,-1,-1],[0,0,0,0.7],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["37.9228 * pixelGrid * pixelW","20.8 * pixelGrid * pixelH","23.9513 * pixelGrid * pixelW","32.9333 * pixelGrid * pixelH"],"","OOP_Listbox_Proximity","","OOP_Listbox",true,["onLBSelChanged","onLBDragging","onLBDrag"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["63.87 * pixelGrid * pixelW","20.8 * pixelGrid * pixelH","23.9513 * pixelGrid * pixelW","32.9333 * pixelGrid * pixelH"],"","OOP_Listbox_Capacities","","OOP_Listbox",true,["onLBSelChanged","onLBDrag","onLBDragging"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["37.9228 * pixelGrid * pixelW","19.0667 * pixelGrid * pixelH","9.97969 * pixelGrid * pixelW","1.73333 * pixelGrid * pixelH"],"Proximity","OOP_Text_proximity","","OOP_Text",true,[],[1,1,1,1],[0,0,0,0],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["63.87 * pixelGrid * pixelW","19.0667 * pixelGrid * pixelH","9.97969 * pixelGrid * pixelW","1.73333 * pixelGrid * pixelH"],"Capacities","OOP_Text_Capacities","","OOP_Text",true,[],[1,1,1,1],[0,0,0,0],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["35.9269 * pixelGrid * pixelW","13.8667 * pixelGrid * pixelH","72.0731 * pixelGrid * pixelW","3.46663 * pixelGrid * pixelH"],"Inventory","OOP_Text_Inventory","","OOP_Text",true,[],[1,1,1,1],[0,0.3,0,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["37.9228 * pixelGrid * pixelW","55.4667 * pixelGrid * pixelH","49.8984 * pixelGrid * pixelW","12.1333 * pixelGrid * pixelH"],"Description","OOP_Text_Description","","OOP_StructuredText",true,[],[-1,-1,-1,-1],[1,1,1,0.1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["90 * pixelGrid * pixelW","27.7333 * pixelGrid * pixelH","16 * pixelGrid * pixelW","5.2 * pixelGrid * pixelH"],"Use","OOP_btn_use","","OOP_Button",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["90 * pixelGrid * pixelW","20.8 * pixelGrid * pixelH","16 * pixelGrid * pixelW","5.2 * pixelGrid * pixelH"],"Weapons","OOP_btn_weapons","","OOP_Button",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]]]]
*/
