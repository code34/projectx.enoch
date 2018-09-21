class hud {
	idd = 1000;
	name= "hud";
	movingEnable = false;
	enableSimulation = true;
	duration = 9999999;
	onLoad = "with missionNamespace do{hud = ['new', _this select 0] call oo_hud;};";
	onUnload = "with missionNamespace do{['delete',hud] call oo_hud;};";
	class controlsBackground {
		class OOP_MainLayer_100_100 : OOP_MainLayer {
			idc = 100;
			x = -37.9208 * pixelGrid * pixelW;
			y = -13 * pixelGrid * pixelH;
			w = 159.675 * pixelGrid * pixelW;
			h = 86.6667 * pixelGrid * pixelH;
			class controls{
				class OOP_life_picture_103: OOP_Picture {
					idc = 103;
					x = 117.76 * pixelGrid * pixelW;
					y = 78 * pixelGrid * pixelH;
					w = 5.98781 * pixelGrid * pixelW;
					h = 5.2 * pixelGrid * pixelH;
					text = "paa\life.paa";
				};
				class OOP_food_picture_104: OOP_Picture {
					idc = 104;
					x = 125.744 * pixelGrid * pixelW;
					y = 78 * pixelGrid * pixelH;
					w = 5.98781 * pixelGrid * pixelW;
					h = 5.2 * pixelGrid * pixelH;
					text = "paa\food.paa";
				};
				class OOP_virus_picture_105: OOP_Picture {
					idc = 105;
					x = 133.728 * pixelGrid * pixelW;
					y = 78 * pixelGrid * pixelH;
					w = 5.98781 * pixelGrid * pixelW;
					h = 5.2 * pixelGrid * pixelH;
					text = "paa\virus.paa";
				};
				class OOP_temperature_picture_106: OOP_Picture {
					idc = 106;
					x = 141.712 * pixelGrid * pixelW;
					y = 78 * pixelGrid * pixelH;
					w = 5.98781 * pixelGrid * pixelW;
					h = 5.2 * pixelGrid * pixelH;
					text = "paa\temperature.paa";
				};
			};
		};
	};
	class controls {};
};

/*
["hud",1000,[[[["117.76 * pixelGrid * pixelW","78 * pixelGrid * pixelH","5.98781 * pixelGrid * pixelW","5.2 * pixelGrid * pixelH"],"paa\life.paa","OOP_life_picture","","OOP_Picture",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["125.744 * pixelGrid * pixelW","78 * pixelGrid * pixelH","5.98781 * pixelGrid * pixelW","5.2 * pixelGrid * pixelH"],"paa\food.paa","OOP_food_picture","","OOP_Picture",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["133.728 * pixelGrid * pixelW","78 * pixelGrid * pixelH","5.98781 * pixelGrid * pixelW","5.2 * pixelGrid * pixelH"],"paa\virus.paa","OOP_virus_picture","","OOP_Picture",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["141.712 * pixelGrid * pixelW","78 * pixelGrid * pixelH","5.98781 * pixelGrid * pixelW","5.2 * pixelGrid * pixelH"],"paa\temperature.paa","OOP_temperature_picture","","OOP_Picture",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]]]]
*/
