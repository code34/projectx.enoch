class cursor {
    idd = 1000;
    name= "cursor";
    movingEnable = false;
    enableSimulation = true;
    duration = 1000000;
    onLoad = "with missionNamespace do{cursor = ['new', _this select 0] call oo_cursor;};";
    onUnload = "with missionNamespace do{['delete',cursor] call oo_cursor;};";
    class controlsBackground {
        class OOP_MainLayer_100_100 : OOP_MainLayer {
            idc = 100;
            x = -38 * pixelGrid * pixelW;
            y = -13.5 * pixelGrid * pixelH;
            w = 160 * pixelGrid * pixelW;
            h = 90 * pixelGrid * pixelH;
            class controls{
                class look_101: OOP_Picture {
                    idc = 101;
                    x = 78 * pixelGrid * pixelW;
                    y = 37.8 * pixelGrid * pixelH;
                    w = 4 * pixelGrid * pixelW;
                    h = 3.6 * pixelGrid * pixelH;
                    text = "paa\look.paa";
                    tooltip = "inventory";
                };
            };
        };
    };
    class controls {};
};

/*
["cursor",1000,[[[["78 * pixelGrid * pixelW","37.8 * pixelGrid * pixelH","4 * pixelGrid * pixelW","3.6 * pixelGrid * pixelH"],"""png\look.png""","look","inventory","OOP_Picture",true,[],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1]]]]]
*/
