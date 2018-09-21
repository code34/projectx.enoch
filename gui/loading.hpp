class loadingscreen {
	idd = 12300;
	name= "loadingscreen";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "with missionNamespace do{loadingscreen = ['new', _this select 0] call oo_loadingscreen;};";
	onUnload = "with missionNamespace do{['delete',loadingscreen] call oo_loadingscreen;};";
	class controlsBackground {
		class OOP_MainLayer_100_100 : OOP_MainLayer {
			idc = 100;
			x = -37.9208 * pixelGrid * pixelW;
			y = -13 * pixelGrid * pixelH;
			w = 159.675 * pixelGrid * pixelW;
			h = 86.6667 * pixelGrid * pixelH;
			class controls{
				class OOP_SubLayer_101_101 : OOP_SubLayer {
					idc = 101;
					x = 57.8822 * pixelGrid * pixelW;
					y = 34.6667 * pixelGrid * pixelH;
					w = 43.9106 * pixelGrid * pixelW;
					h = 17.3333 * pixelGrid * pixelH;
					class controls{
						class OOP_Text_Fond_102: OOP_Text {
							idc = 102;
							x = 0.2515 * pixelGrid * pixelW;
							y = 0.182 * pixelGrid * pixelH;
							w = 43.6591 * pixelGrid * pixelW;
							h = 17.1513 * pixelGrid * pixelH;
							text = "";
							colorBackground[] = {0, 0, 0, 0.41};
						};
						class OOP_Progress_Bar_103: OOP_Progress {
							idc = 103;
							x = 3.99188 * pixelGrid * pixelW;
							y = 8.66667 * pixelGrid * pixelH;
							w = 35.9269 * pixelGrid * pixelW;
							h = 5.2 * pixelGrid * pixelH;
						};
						class OOP_Text_Loading_104: OOP_Text {
							idc = 104;
							x = 17.9634 * pixelGrid * pixelW;
							y = 0.182 * pixelGrid * pixelH;
							w = 15.9675 * pixelGrid * pixelW;
							h = 8.66667 * pixelGrid * pixelH;
							text = "Search";
							colorText[] = {1, 1, 1, 1};
						};
					};
				};
			};
		};
	};
	class controls {};
};

/*
["loadingscreen",12300,[[[["57.8822 * pixelGrid * pixelW","34.6667 * pixelGrid * pixelH","43.9106 * pixelGrid * pixelW","17.3333 * pixelGrid * pixelH"],"","OOP_SubLayer_101","","OOP_SubLayer",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]],[[[["0.2515 * pixelGrid * pixelW","0.182 * pixelGrid * pixelH","43.6591 * pixelGrid * pixelW","17.1513 * pixelGrid * pixelH"],"Fond","OOP_Text_Fond","","OOP_Text",true,[],[-1,-1,-1,-1],[0,0.13,0,0.41],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["3.99188 * pixelGrid * pixelW","8.66667 * pixelGrid * pixelH","35.9269 * pixelGrid * pixelW","5.2 * pixelGrid * pixelH"],"","OOP_Progress_Bar","","OOP_Progress",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["17.9634 * pixelGrid * pixelW","0.182 * pixelGrid * pixelH","15.9675 * pixelGrid * pixelW","8.66667 * pixelGrid * pixelH"],"Loading","OOP_Text_Loading","","OOP_Text",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]]]]]]
*/
