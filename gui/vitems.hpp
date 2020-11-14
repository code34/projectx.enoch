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
			class OOP_MainLayer_100 : OOP_MainLayer {
				idc = 100;
				x = safeZoneX;
				y = safeZoneY;
				w = safeZoneW;
				h = safeZoneH;
				onLBDrop = "['dragDrop', _this] call VITEMS;";
				//onMouseButtonDown	= "[1,_this] call myEventFunction";
				//onMouseButtonUp		= "[2,_this] call myEventFunction";
				class controls{
					// Liste à gauche du menu inventaire
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
						onLBDblClick = "['getDblClick', _this] call VITEMS";
						colorBackground[] = {0, 0, 0, 0.6};
					};
					// Liste à droite du menu inventaire
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
						onMouseButtonClick = "['setCapMenu', _this] call VITEMS";
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
						x = (safezoneW * 0.260);
						y = (safezoneH * 0.020);
						w = (safezoneW * 0.48);
						h = (safezoneH * 0.07);
						text = "Inventory";
						size = 0.085;
						colorText[] = {1, 1, 1, 1};
						colorBackground[] = {0.5, 0.5, 0.5, 0.8};
						tooltipColorText[] = {1, 1, 1, 1};
						class Attributes {
							align = "center";
						};	
					};
					class OOP_Text_Description_107: RscStructuredText {
						idc = 107;
						x = (safezoneW * 0.312);
						y = (safezoneH * 0.092);
						w = (safezoneW * 0.427);
						h = (safezoneH * 0.696);
						text = "Description";
						colorBackground[] = {0.6, 0.6, 0.6, 0.5};
						size = (GUI_GRID_H * 1.15);
					};

					class headBackground : RscStructuredText {
						idc = 1099;
						x = (safezoneW * 0.261);
						y = (safezoneH * 0.092);
						w = (safezoneW * 0.05);
						h = (safezoneH * 0.1);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class head : RscActiveText {
						idc = 119;
						x = (safezoneW * 0.261);
						y = (safezoneH * 0.092);
						w = (safezoneW * 0.05);
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
						onMouseButtonDblClick = "['removeItem', 'head'] call VITEMS";
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
					};
					class uniformBackground : RscStructuredText {
						idc = 1100;
						x = (safezoneW * 0.261);
						y = (safezoneH * 0.193);
						w = (safezoneW * 0.05);
						h = (safezoneH * 0.1);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class uniform : RscActiveText {
						idc = 120;
						x = (safezoneW * 0.261);
						y = (safezoneH * 0.193);
						w = (safezoneW * 0.05);
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
						onLBDblClick = "['getDblClick', _this] call VITEMS";
						onMouseButtonDblClick = "['removeItem', 'uniform'] call VITEMS";
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
					};
					class vestBackground : RscStructuredText {
						idc = 1101;
						x = (safezoneW * 0.261);
						y = (safezoneH * 0.294);
						w = (safezoneW * 0.05);
						h = (safezoneH * 0.1);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class vest : RscActiveText {
						idc = 121;
						x = (safezoneW * 0.261);
						y = (safezoneH * 0.294);
						w = (safezoneW * 0.05);
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
						//onButtonClick = "hintc 'simple';";
						//onButtonDown = "systemchat format['down: %1', _this];";
						//onButtonUp = "systemchat format['up: %1', _this];";
						onMouseButtonDblClick = "['removeItem', 'vest'] call VITEMS";
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
					};
					class backpackBackground : RscStructuredText {
						idc = 1102;
						x = (safezoneW * 0.261);
						y = (safezoneH * 0.395);
						w = (safezoneW * 0.05);
						h = (safezoneH * 0.1);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class backpack : RscActiveText {
						idc = 122;
						x = (safezoneW * 0.261);
						y = (safezoneH * 0.395);
						w = (safezoneW * 0.05);
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
						onLBDblClick = "['getDblClick', _this] call VITEMS";
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onMouseButtonDblClick = "['removeItem', 'backpack'] call VITEMS";
					};
					class binocularBackground : RscStructuredText {
						idc = 1092;
						x = (safezoneW * 0.261);
						y = (safezoneH * 0.496);
						w = (safezoneW * 0.05);
						h = (safezoneH * 0.1);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class binocular : RscActiveText {
						idc = 112;
						x = (safezoneW * 0.261);
						y = (safezoneH * 0.496);
						w = (safezoneW * 0.05);
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
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onMouseButtonDblClick = "['removeItem', 'binocular'] call VITEMS";
					};
					class mapBackground : RscStructuredText {
						idc = 1099;
						x = (safezoneW * 0.261);
						y = (safezoneH * 0.597);
						w = (safezoneW * 0.05);
						h = (safezoneH * 0.1);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class map : RscActiveText {
						idc = 128;
						x = (safezoneW * 0.261);
						y = (safezoneH * 0.597);
						w = (safezoneW * 0.05);
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
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onMouseButtonDblClick = "['removeItem', 'binocular'] call VITEMS";
					};

					class weaponsBackground: RscStructuredText {
						idc = 1166;
						x = (safezoneW * 0.2645);
						y = (safezoneH * 0.838);
						w = (safezoneW * 0.453);
						h = (safezoneH * 0.162);
						text = "";
						size = 0.1;
						colorText[] = {1, 1, 1, 1};
						colorBackground[] = {0, 0, 0, 0.6};
						tooltipColorText[] = {1, 1, 1, 1};
						class Attributes {
							align = "center";
						};
					};
					class primaryweaponBackground : RscStructuredText {
						idc = 1089;
						x = (safezoneW * 0.265);
						y = (safezoneH * 0.890);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.11);
						colorBackground[] = {0.6, 0.6, 0.6, 0.5};
					};
					class primaryweapon : RscActiveText {
						idc = 109;
						x = (safezoneW * 0.265);
						y = (safezoneH * 0.890);
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
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onMouseButtonDblClick = "['removeItem', 'primaryweapon'] call VITEMS";
					};
					class gunweaponBackground : RscStructuredText {
						idc = 1091;
						x = (safezoneW * 0.396);
						y = (safezoneH * 0.890);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.11);
						colorBackground[] = {0.6, 0.6, 0.6, 0.5};
					};
					class gunweapon : RscActiveText {
						idc = 111;
						x = (safezoneW * 0.396);
						y = (safezoneH * 0.890);
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
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onMouseButtonDblClick = "['removeItem', 'handgunweapon'] call VITEMS";
					};
					class secondaryweaponBackground : RscStructuredText {
						idc = 1090;
						x = (safezoneW * 0.5265);
						y = (safezoneH * 0.890);
						w = (safezoneW * 0.13);
						h = (safezoneH * 0.11);
						colorBackground[] = {0.6, 0.6, 0.6, 0.5};
					};
					class secondaryweapon : RscActiveText {
						idc = 110;
						x = (safezoneW * 0.5265);
						y = (safezoneH * 0.890);
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
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onMouseButtonDblClick = "['removeItem', 'secondaryweapon'] call VITEMS";
					};
					class magprimaryweaponBackground : RscStructuredText {
						idc = 1093;
						x = (safezoneW * 0.265);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class magprimaryweapon : RscActiveText {
						idc = 113;
						x = (safezoneW * 0.265);
						y = (safezoneH * 0.839);
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
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};
					class maggunweaponBackground : RscStructuredText {
						idc = 1094;
						x = (safezoneW * 0.396);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class maggunweapon : RscActiveText {
						idc = 114;
						x = (safezoneW * 0.396);
						y = (safezoneH * 0.839);
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
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};
					class magsecondaryweaponBackground : RscStructuredText {
						idc = 1095;
						x = (safezoneW * 0.5265);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class magsecondaryweapon : RscActiveText {
						idc = 115;
						x = (safezoneW * 0.5265);
						y = (safezoneH * 0.839);
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
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};

					class opticprimaryweaponBackground : RscStructuredText {
						idc = 1096;
						x = (safezoneW * 0.3055);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.0492);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class opticprimaryweapon : RscActiveText {
						idc = 116;
						x = (safezoneW * 0.3055);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.0492);
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
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};
					class opticgunweaponBackground : RscStructuredText {
						idc = 1097;
						x = (safezoneW * 0.4365);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.0492);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class opticgunweapon : RscActiveText {
						idc = 117;
						x = (safezoneW * 0.4365);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.0492);
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
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};
					class opticsecondaryweaponBackground : RscStructuredText {
						idc = 1098;
						x = (safezoneW * 0.567);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.0492);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class opticsecondaryweapon : RscActiveText {
						idc = 118;
						x = (safezoneW * 0.567);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.0492);
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
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};

					class flashprimaryweaponBackground : RscStructuredText {
						idc = 1104;
						x = (safezoneW * 0.355);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class flashprimaryweapon : RscActiveText {
						idc = 124;
						x = (safezoneW * 0.355);
						y = (safezoneH * 0.839);
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
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};

					class flashhandgunweaponBackground : RscStructuredText {
						idc = 1105;
						x = (safezoneW * 0.486);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class flashhandgunweapon : RscActiveText {
						idc = 125;
						x = (safezoneW * 0.486);
						y = (safezoneH * 0.839);
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
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};

					class flashsecondaryweaponBackground : RscStructuredText {
						idc = 1106;
						x = (safezoneW * 0.6165);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.04);
						h = (safezoneH * 0.05);
						colorBackground[] = {0.5,0.5,0.5,1};
					};

					class flashsecondaryweapon : RscActiveText {
						idc = 126;
						x = (safezoneW * 0.6165);
						y = (safezoneH * 0.839);
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
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onLBDblClick = "['getDblClick', _this] call VITEMS";
					};

					class muzzleBackground : RscStructuredText {
						idc = 1107;
						x = (safezoneW * 0.6575);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.06);
						h = (safezoneH * 0.0805);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class muzzle : RscActiveText {
						idc = 127;
						x = (safezoneW * 0.6575);
						y = (safezoneH * 0.839);
						w = (safezoneW * 0.06);
						h = (safezoneH * 0.0805);
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
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onMouseButtonDblClick = "['removeItem', 'binocular'] call VITEMS";
					};

					class grenadeBackground : RscStructuredText {
						idc = 1108;
						x = (safezoneW * 0.6575);
						y = (safezoneH * 0.921);
						w = (safezoneW * 0.06);
						h = (safezoneH * 0.079);
						colorBackground[] = {0.5,0.5,0.5,1};
					};
					class grenade : RscActiveText {
						idc = 129;
						x = (safezoneW * 0.6575);
						y = (safezoneH * 0.921);
						w = (safezoneW * 0.06);
						h = (safezoneH * 0.079);
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
						onMouseButtonClick = "['setInvMenu', _this] call VITEMS";
						onMouseButtonDblClick = "['removeItem', 'binocular'] call VITEMS";
					};

					class capmenu : ctrlMenu {
						idc = 108;
						x = (safezoneW * 0.7);
						y = (safezoneH * 0.2);
						w = (safezoneW * 0.1);
						h = (safezoneH * 0.02);
						onMouseButtonClick = "['closeCapMenu', _this] call VITEMS";
						class Items {
							items[] = {"Use","Drop"};
							class Default {
								text = "";
								data = "";
								enable = 0;
								action = "";
							};
							class Use {
								text = "Use";
								action = "['actionCapMenu', 'use'] call VITEMS";
							};
							class Shred  {
								text = "Shred";
								action = "['actionCapMenu', 'shred'] call VITEMS";
							};
							class Drop  {
								text = "Drop";
								action = "['actionCapMenu', 'drop'] call VITEMS";
							};
						};
					};
					class invmenu : ctrlMenu {
						idc = 123;
						x = (safezoneW * 0.7);
						y = (safezoneH * 0.2);
						w = (safezoneW * 0.1);
						h = (safezoneH * 0.02);
						onMouseButtonClick = "['closeInvMenu', _this] call VITEMS";
						class Items {
							items[] = {"Loadout", "Drop"};
							class Default {
								text = "";
								data = "";
								enable = 0;
								action = "";
							};
							class Loadout {
								text = "Loadout";
								action = "['actionInvMenu', 'loadout'] call VITEMS";
							};
							class Drop  {
								text = "Drop";
								action = "['actionInvMenu', 'drop'] call VITEMS";
							};
						};
					};

				};
			};
	};
};