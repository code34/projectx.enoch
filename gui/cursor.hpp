class cursor {
    idd = 5000;
    name= "cursor";
    movingEnable = false;
    enableSimulation = true;
    duration = 1000000;
    onLoad = "";
    onUnload = "";
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
                    tooltip = "";
                };
            };
        };
    };
    class controls {};
};


class cursorpump {
    idd = 5010;
    name= "cursorpump";
    movingEnable = false;
    enableSimulation = true;
    duration = 1000000;
    onLoad = "";
    onUnload = "";
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
                    w = 6 * pixelGrid * pixelW;
                    h = 6 * pixelGrid * pixelH;
                    text = "paa\waterpump.paa";
                    tooltip = "";
                };
            };
        };
    };
    class controls {};
};