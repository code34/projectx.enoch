class uirequirement {
    idd = 1480;
    name= "uirequirement";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "with missionNamespace do{uirequirement = ['new', _this select 0] call oo_uirequirement;};";
    onUnload = "with missionNamespace do{['delete',uirequirement] call oo_uirequirement;};";
    class controlsBackground {
        class OOP_MainLayer_100_100 : OOP_MainLayer {
            idc = 100;
            x = -38 * pixelGrid * pixelW;
            y = -13 * pixelGrid * pixelH;
            w = 160 * pixelGrid * pixelW;
            h = 86.6667 * pixelGrid * pixelH;
            class controls{
                class OOP_Text_fond_103: OOP_Text {
                    idc = 103;
                    x = 126 * pixelGrid * pixelW;
                    y = 19.0667 * pixelGrid * pixelH;
                    w = 26 * pixelGrid * pixelW;
                    h = 45.0667 * pixelGrid * pixelH;
                    text = "";
                    colorBackground[] = {0.2, 0.2, 0.2, 0.8};
                };
                class OOP_Listbox_requirement_104: OOP_Listbox {
                    idc = 104;
                    x = 128 * pixelGrid * pixelW;
                    y = 20.8 * pixelGrid * pixelH;
                    w = 22 * pixelGrid * pixelW;
                    h = 41.6 * pixelGrid * pixelH;
                };
                class OOP_Text_fond_requirement_105: OOP_Text {
                    idc = 105;
                    x = 126 * pixelGrid * pixelW;
                    y = 15.6 * pixelGrid * pixelH;
                    w = 22 * pixelGrid * pixelW;
                    h = 3.46667 * pixelGrid * pixelH;
                    text = "Requirements";
                    colorText[] = {1, 1, 1, 1};
                    colorBackground[] = {0.1, 0.1, 0.1, 1};
                    tooltipColorText[] = {1, 1, 1, 1};
                };
                class OOP_Button_close_requirement_107: OOP_Button {
                    idc = 107;
                    x = 148 * pixelGrid * pixelW;
                    y = 15.6 * pixelGrid * pixelH;
                    w = 4 * pixelGrid * pixelW;
                    h = 3.46667 * pixelGrid * pixelH;
                    text = "X";
                    colorText[] = {1, 1, 1, 1};
                    colorBackground[] = {0.1, 0.1, 0.1, 1};
                    tooltipColorText[] = {1, 1, 1, 1};
                    action = "'btnAction_OOP_Button_close_requirement' call uirequirement;";
                };
            };
        };
    };
    class controls {};
};

/*
["uirequirement",1480,[[[["126 * pixelGrid * pixelW","19.0667 * pixelGrid * pixelH","26 * pixelGrid * pixelW","45.0667 * pixelGrid * pixelH"],"","OOP_Text_fond","","OOP_Text",true,[],[-1,-1,-1,-1],[0.2,0.2,0.2,0.8],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["128 * pixelGrid * pixelW","20.8 * pixelGrid * pixelH","22 * pixelGrid * pixelW","41.6 * pixelGrid * pixelH"],"","OOP_Listbox_requirement","","OOP_Listbox",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["126 * pixelGrid * pixelW","15.6 * pixelGrid * pixelH","22 * pixelGrid * pixelW","3.46667 * pixelGrid * pixelH"],"Requirements","OOP_Text_fond_requirement","","OOP_Text",true,[],[1,1,1,1],[0.1,0.1,0.1,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]],[[["148 * pixelGrid * pixelW","15.6 * pixelGrid * pixelH","4 * pixelGrid * pixelW","3.46667 * pixelGrid * pixelH"],"X","OOP_Button_close_requirement","","OOP_Button",true,[],[1,1,1,1],[0.1,0.1,0.1,1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]]]]
*/
