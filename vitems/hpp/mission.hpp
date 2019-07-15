	class failurehelicopterengine {
        type[] = {"mission"};
        title = "Failure helicopter engine";
        description = "An old failure Lycoming 235 Series Four-Cylinder Engine.";
        weight = 110;
        nbusage = 1;
        picture = "pictures\helicopterengine.jpg";
        requirement[] = {"wrench", "helicoptergears", "helicoptercandle", "helicopterhose"};
    };
 	class helicopterengine {
        type[] = {"mission"};
        title = "Helicopter engine";
        description = "The Lycoming 235 Series Four-Cylinder Engine is a Popular Choice for Homebuilt and Original Aircraft";
        weight = 110;
        nbusage = 1;
        picture = "pictures\helicopterengine.jpg";
        requirement[] = {};
    };
    class armyradio {
        type[] = {"mission"};
        title = "Army radio";
        description = "The versatile radio enables users to send information up and down the chain of command as well as across the battlefield network backbone";
        weight = 1;
        nbusage = -1;
        picture = "pictures\armyradio.jpg";
        requirement[] = {};
    };
    class radioamplifier {
        type[] = {"mission"};
        title = "Radio amplifier";
        description = "A working military amplifier";
        weight = 10;
        nbusage = -1;
        picture = "pictures\radioamplifier.jpg";
        requirement[] = {"wrench", "screwdriver"};
    };
    class missionplan {
        type[] = {"mission"};
        title = "Mission #Transparence";
        description = "Secret Defense - This information should not be disclosed to the enemy - Bring in sector c124535 the contents of this briefcase. Ask for colonel Jackson Bro";
        weight = 0.05;
        nbusage = 1;
		picture = "pictures\missionplan.jpg";
		requirement[] = {};
	};
    class medal {
        type[] = {"mission"};
        title = "Bravery medal";
        description = "A military medal of bravery";
        weight = 0.05;
        nbusage = 1;
        picture = "pictures\medal.jpg";
        requirement[] = {};
    };
    class helicoptergears {
        type[] = {"mission"};
        title = "Helicopter gears";
        description = "Two accurately manufactured gears in mesh behave like the two circular wheels.";
        weight = 2;
        nbusage = 1;
        picture = "pictures\helicoptergears.jpg";
        requirement[] = {};
    };
    class helicoptercandle {
        type[] = {"mission"};
        title = "Helicopter engine candle";
        description = "Internal combustion engine candle.";
        weight = 0.1;
        nbusage = 1;
        picture = "pictures\helicoptercandle.jpg";
        requirement[] = {};
    };
    class helicopterhose {
        type[] = {"mission"};
        title = "Helicopter engine hose";
        description = "A hose for the Lycoming 235 Series Four-Cylinder Engine";
        weight = 0.1;
        nbusage = 1;
        picture = "pictures\helicopterhose.jpg";
        requirement[] = {};
    };