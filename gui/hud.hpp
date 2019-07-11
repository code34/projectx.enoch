class hud {
	idd = 1000;
	name= "hud";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "with missionNamespace do{ hud = ['new', _this select 0] call oo_hud;};";
	onUnload = "with missionNamespace do{['delete',hud] call oo_hud;};";
	duration = 10000000;
	class controlsBackground {
		class OOP_MainLayer_100_100 : OOP_MainLayer {
			idc = 100;
			x = -38 * pixelGrid * pixelW;
			y = -13 * pixelGrid * pixelH;
			w = 160 * pixelGrid * pixelW;
			h = 86.6667 * pixelGrid * pixelH;
			class controls{
				class OOP_SubLayer_101_101 : OOP_SubLayer {
					idc = 101;
					x = 142 * pixelGrid * pixelW;
					y = 22 * pixelGrid * pixelH;
					w = 16 * pixelGrid * pixelW;
					h = 43 * pixelGrid * pixelH;
					class controls{				
						class OOP_Picture_drink_102: OOP_Picture {
							idc = 102;
							x = 8 * pixelGrid * pixelW;
							y = 1.73333 * pixelGrid * pixelH;
							w = 6 * pixelGrid * pixelW;
							h = 5.2 * pixelGrid * pixelH;
							text = "paa\drink.paa";
						};
						class OOP_Picture_food_103: OOP_Picture {
							idc = 103;
							x = 8 * pixelGrid * pixelW;
							y = 8.66667 * pixelGrid * pixelH;
							w = 6 * pixelGrid * pixelW;
							h = 5.2 * pixelGrid * pixelH;
							text = "paa\food.paa";
						};
						class OOP_Picture_life_104: OOP_Picture {
							idc = 104;
							x = 8 * pixelGrid * pixelW;
							y = 15.6 * pixelGrid * pixelH;
							w = 6 * pixelGrid * pixelW;
							h = 5.2 * pixelGrid * pixelH;
							text = "paa\life.paa";
						};
						class OOP_Picture_virus_105: OOP_Picture {
							idc = 105;
							x = 8 * pixelGrid * pixelW;
							y = 22.5333 * pixelGrid * pixelH;
							w = 6 * pixelGrid * pixelW;
							h = 5.2 * pixelGrid * pixelH;
							text = "paa\virus.paa";
						};
						class OOP_Picture_blood_110: OOP_Picture {
							idc = 111;
							x = 8 * pixelGrid * pixelW;
							y = 29.4 * pixelGrid * pixelH;
							w = 6 * pixelGrid * pixelW;
							h = 5.2 * pixelGrid * pixelH;
							text = "paa\blood.paa";
						};	
						class OOP_Picture_file_110: OOP_Picture {
							idc = 110;
							x = 8 * pixelGrid * pixelW;
							y = 36.4 * pixelGrid * pixelH;
							w = 6 * pixelGrid * pixelW;
							h = 5.2 * pixelGrid * pixelH;
							text = "paa\file.paa";
						};						
						class OOP_Text_drink_106: OOP_Text {
							idc = 106;
							x = 2 * pixelGrid * pixelW;
							y = 3.46667 * pixelGrid * pixelH;
							w = 5.748 * pixelGrid * pixelW;
							h = 3.46667 * pixelGrid * pixelH;
							text = "100%";
							colorText[] = {1, 1, 1, 1};
							tooltipColorText[] = {1, 1, 1, 1};
						};
						class OOP_Text_food_107: OOP_Text {
							idc = 107;
							x = 2 * pixelGrid * pixelW;
							y = 10.4 * pixelGrid * pixelH;
							w = 5.748 * pixelGrid * pixelW;
							h = 3.46667 * pixelGrid * pixelH;
							text = "100%";
							colorText[] = {1, 1, 1, 1};
							tooltipColorText[] = {1, 1, 1, 1};
						};
						class OOP_Text_life_108: OOP_Text {
							idc = 108;
							x = 2 * pixelGrid * pixelW;
							y = 17.3333 * pixelGrid * pixelH;
							w = 6 * pixelGrid * pixelW;
							h = 3.46667 * pixelGrid * pixelH;
							text = "100%";
							colorText[] = {1, 1, 1, 1};
							tooltipColorText[] = {1, 1, 1, 1};
						};
						class OOP_Text_virus_109: OOP_Text {
							idc = 109;
							x = 2 * pixelGrid * pixelW;
							y = 24.2667 * pixelGrid * pixelH;
							w = 6 * pixelGrid * pixelW;
							h = 3.46667 * pixelGrid * pixelH;
							text = "100%";
							colorText[] = {1, 1, 1, 1};
							tooltipColorText[] = {1, 1, 1, 1};
						};
					};
				};
			};
		};
	};
	class controls {};
};

/*
["hud",1000,[[[["142 * pixelGrid * pixelW","31.2 * pixelGrid * pixelH","16 * pixelGrid * pixelW","29.4667 * pixelGrid * pixelH"],"","OOP_SubLayer_101","","OOP_SubLayer",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]],[[[["8 * pixelGrid * pixelW","1.73333 * pixelGrid * pixelH","6 * pixelGrid * pixelW","5.2 * pixelGrid * pixelH"],"paa\drink.paa","OOP_Picture_drink","","OOP_Picture",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["8 * pixelGrid * pixelW","8.66667 * pixelGrid * pixelH","6 * pixelGrid * pixelW","5.2 * pixelGrid * pixelH"],"paa\food.paa","OOP_Picture_food","","OOP_Picture",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["8 * pixelGrid * pixelW","15.6 * pixelGrid * pixelH","6 * pixelGrid * pixelW","5.2 * pixelGrid * pixelH"],"paa\life.paa","OOP_Picture_life","","OOP_Picture",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["8 * pixelGrid * pixelW","22.5333 * pixelGrid * pixelH","6 * pixelGrid * pixelW","5.2 * pixelGrid * pixelH"],"paa\virus.paa","OOP_Picture_virus","","OOP_Picture",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["2 * pixelGrid * pixelW","3.46667 * pixelGrid * pixelH","5.748 * pixelGrid * pixelW","3.46667 * pixelGrid * pixelH"],"100%","OOP_Text_drink","","OOP_Text",true,[],[1,1,1,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["2 * pixelGrid * pixelW","10.4 * pixelGrid * pixelH","5.748 * pixelGrid * pixelW","3.46667 * pixelGrid * pixelH"],"100%","OOP_Text_food","","OOP_Text",true,[],[1,1,1,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["2 * pixelGrid * pixelW","17.3333 * pixelGrid * pixelH","6 * pixelGrid * pixelW","3.46667 * pixelGrid * pixelH"],"100%","OOP_Text_life","","OOP_Text",true,[],[1,1,1,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["2 * pixelGrid * pixelW","24.2667 * pixelGrid * pixelH","6 * pixelGrid * pixelW","3.46667 * pixelGrid * pixelH"],"100%","OOP_Text_virus","","OOP_Text",true,[],[1,1,1,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]]]]]]
*/
