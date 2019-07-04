class missionnote {                              
    idd = 20000;
    movingEnable = 0;
    objects[] = { };
    controlsBackground[] = { };
    onload = "uiNamespace setVariable ['missionnote', _this select 0]";
    class Controls {
        class mapage : RscFeedback {
            idc = 20001;
            x = 0; 
            y = 0; 
            w = 1; 
            h = 1;
            colorBackground[] = {1,1,1,1};
            colorText[] = {0,0,0,1};
        };
    };
};