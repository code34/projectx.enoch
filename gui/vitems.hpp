class Vitems {
	idd = 1000;
	name= "Vitems";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "with missionNamespace do{Vitems = ['new', _this select 0] call oo_Vitems;};";
	onUnload = "with missionNamespace do{['delete',Vitems] call oo_Vitems;};";
	class controlsBackground {
		class OOP_MainLayer_100_100 : OOP_MainLayer {
			idc = 100;
			x = -37.9208 * pixelGrid * pixelW;
			y = -13 * pixelGrid * pixelH;
			w = 159.675 * pixelGrid * pixelW;
			h = 86.6667 * pixelGrid * pixelH;
			onLBDrop = "['dragDrop', _this] call VITEMS;";
			class controls{
				class OOP_Text_Fond_101: OOP_Text {
					idc = 101;
					x = 35.9269 * pixelGrid * pixelW;
					y = 17.3333 * pixelGrid * pixelH;
					w = 89.8172 * pixelGrid * pixelW;
					h = 52 * pixelGrid * pixelH;
					text = "";
					colorBackground[] = {0, 0, 0, 0.7};
				};
				class OOP_Listbox_Proximity_102: OOP_Listbox {
					idc = 102;
					x = 37.9228 * pixelGrid * pixelW;
					y = 20.8 * pixelGrid * pixelH;
					w = 23.9513 * pixelGrid * pixelW;
					h = 32.9333 * pixelGrid * pixelH;
					rowHeight = 0.05;
					onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Proximity', _this] call Vitems;";
					canDrag = 1;
					onLBDragging = "['setDestination', _this] call VITEMS";
					onLBDrag = "['setSource', _this] call VITEMS";
				};
				class OOP_Listbox_Capacities_103: OOP_Listbox {
					idc = 103;
					x = 63.87 * pixelGrid * pixelW;
					y = 20.8 * pixelGrid * pixelH;
					w = 23.9513 * pixelGrid * pixelW;
					h = 32.9333 * pixelGrid * pixelH;
					rowHeight = 0.05;
					canDrag = 1;
					onLBSelChanged = "['onLBSelChanged_OOP_Listbox_Capacities', _this] call Vitems;";
					onLBDragging = "['setDestination', _this] call VITEMS";
					onLBDrag = "['setSource', _this] call VITEMS";
				};
				class OOP_Text_proximity_104: OOP_Text {
					idc = 104;
					x = 37.9228 * pixelGrid * pixelW;
					y = 19.0667 * pixelGrid * pixelH;
					w = 9.97969 * pixelGrid * pixelW;
					h = 1.73333 * pixelGrid * pixelH;
					text = "Proximity";
					colorText[] = {1, 1, 1, 1};
					colorBackground[] = {0, 0, 0, 0};
					tooltipColorText[] = {1, 1, 1, 1};
				};
				class OOP_Text_Capacities_105: OOP_Text {
					idc = 105;
					x = 63.87 * pixelGrid * pixelW;
					y = 19.0667 * pixelGrid * pixelH;
					w = 9.97969 * pixelGrid * pixelW;
					h = 1.73333 * pixelGrid * pixelH;
					text = "Capacities";
					colorText[] = {1, 1, 1, 1};
					colorBackground[] = {0, 0, 0, 0};
					tooltipColorText[] = {1, 1, 1, 1};
				};
				class OOP_Text_Inventory_106: OOP_Text {
					idc = 106;
					x = 35.9269 * pixelGrid * pixelW;
					y = 13.8667 * pixelGrid * pixelH;
					w = 89.8172 * pixelGrid * pixelW;
					h = 3.46667 * pixelGrid * pixelH;
					text = "Inventory";
					colorText[] = {1, 1, 1, 1};
					colorBackground[] = {0, 0.3, 0, 1};
					tooltipColorText[] = {1, 1, 1, 1};
				};
				class OOP_Text_Description_109: OOP_StructuredText {
					idc = 109;
					x = 37.9228 * pixelGrid * pixelW;
					y = 55.4667 * pixelGrid * pixelH;
					w = 49.8984 * pixelGrid * pixelW;
					h = 12.1333 * pixelGrid * pixelH;
					text = "";
					colorBackground[] = {1, 1, 1, 0.1};
				};
				class OOP_Listbox_primaryweapon_110: OOP_Listbox {
					idc = 110;
					style = "0x30 + 0x800";
					x = 89.8172 * pixelGrid * pixelW;
					y = 20.8 * pixelGrid * pixelH;
					w = 33.9309 * pixelGrid * pixelW;
					h = 8.66667 * pixelGrid * pixelH;
					rowHeight = 0.14;
					onLBDragging = "['setDestination', _this] call VITEMS";
					onLBDrag = "['setSource', _this] call VITEMS";
				};
				class OOP_Listbox_secondaryweapon_111: OOP_Listbox {
					idc = 111;
					x = 89.8172 * pixelGrid * pixelW;
					y = 31.2 * pixelGrid * pixelH;
					w = 33.9309 * pixelGrid * pixelW;
					h = 8.66667 * pixelGrid * pixelH;
					rowHeight = 0.14;
					onLBDragging = "['setDestination', _this] call VITEMS";
					onLBDrag = "['setSource', _this] call VITEMS";
				};
			};
		};
	};
	class controls {};
};

/*
["Vitems",1000,[[[["35.9269 * pixelGrid * pixelW","17.3333 * pixelGrid * pixelH","89.8172 * pixelGrid * pixelW","52 * pixelGrid * pixelH"],"text","OOP_Text_Fond","","OOP_Text",true,[],[-1,-1,-1,-1],[0,0,0,0.7],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["37.9228 * pixelGrid * pixelW","20.8 * pixelGrid * pixelH","23.9513 * pixelGrid * pixelW","32.9333 * pixelGrid * pixelH"],"","OOP_Listbox_Proximity","","OOP_Listbox",true,["onLBSelChanged","onLBDragging","onLBDrag"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["63.87 * pixelGrid * pixelW","20.8 * pixelGrid * pixelH","23.9513 * pixelGrid * pixelW","32.9333 * pixelGrid * pixelH"],"","OOP_Listbox_Capacities","","OOP_Listbox",true,["onLBSelChanged","onLBDrag","onLBDragging"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["37.9228 * pixelGrid * pixelW","19.0667 * pixelGrid * pixelH","9.97969 * pixelGrid * pixelW","1.73333 * pixelGrid * pixelH"],"Proximity","OOP_Text_proximity","","OOP_Text",true,[],[1,1,1,1],[0,0,0,0],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["63.87 * pixelGrid * pixelW","19.0667 * pixelGrid * pixelH","9.97969 * pixelGrid * pixelW","1.73333 * pixelGrid * pixelH"],"Capacities","OOP_Text_Capacities","","OOP_Text",true,[],[1,1,1,1],[0,0,0,0],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["35.9269 * pixelGrid * pixelW","13.8667 * pixelGrid * pixelH","89.8172 * pixelGrid * pixelW","3.46667 * pixelGrid * pixelH"],"Inventory","OOP_Text_Inventory","","OOP_Text",true,[],[1,1,1,1],[0,0.3,0,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["37.9228 * pixelGrid * pixelW","55.4667 * pixelGrid * pixelH","49.8984 * pixelGrid * pixelW","12.1333 * pixelGrid * pixelH"],"Description","OOP_Text_Description","","OOP_StructuredText",true,[],[-1,-1,-1,-1],[1,1,1,0.1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["89.8172 * pixelGrid * pixelW","20.8 * pixelGrid * pixelH","33.9309 * pixelGrid * pixelW","8.66667 * pixelGrid * pixelH"],"","OOP_Listbox_primaryweapon","","OOP_Listbox",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["89.8172 * pixelGrid * pixelW","31.2 * pixelGrid * pixelH","33.9309 * pixelGrid * pixelW","8.66667 * pixelGrid * pixelH"],"","OOP_Listbox_secondaryweapon","","OOP_Listbox",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]]]]
*/
