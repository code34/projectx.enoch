	class failurehelicopterengine {
		type[] = {"mission"};
		title = "Failure helicopter engine";
		description = "An old failure Lycoming 235 Series Four-Cylinder Engine.";
		weight = 400;
		nbusage = 1;
		picture = "paa\helicopterengine.paa";
		requirement[] = {"wrench", "helicoptergears", "helicoptercandle", "helicopterhose"};
	};
	class helicopterengine {
		type[] = {"mission"};
		title = "Helicopter engine";
		description = "The Lycoming 235 Series Four-Cylinder Engine is a Popular Choice for Homebuilt and Original Aircraft";
		weight = 400;
		nbusage = 1;
		picture = "paa\helicopterengine.paa";
		requirement[] = {};
	};
	class armyradio {
		type[] = {"mission"};
		title = "Army radio";
		description = "The versatile radio enables users to send information up and down the chain of command as well as across the battlefield network backbone";
		weight = 1;
		nbusage = -1;
		picture = "paa\armyradio.paa";
		requirement[] = {};
	};
	class radioamplifier {
		type[] = {"mission"};
		title = "Radio amplifier";
		description = "A working military amplifier";
		weight = 10;
		nbusage = -1;
		picture = "paa\radioamplifier.paa";
		requirement[] = {"wrench", "screwdriver"};
	};
	class missionplan {
		type[] = {"mission"};
		title = "Mission #Transparence";
		description = "Secret Defense - This information should not be disclosed to the enemy - Bring in sector c124535 the contents of this briefcase. Ask for colonel Jackson Bro";
		weight = 0.05;
		nbusage = 1;
		picture = "paa\classified_red.paa";
		requirement[] = {};
	};
	class medal {
		type[] = {"mission"};
		title = "Bravery medal";
		description = "A military medal of bravery";
		weight = 0.05;
		nbusage = -1;
		picture = "paa\medal.paa";
		requirement[] = {};
	};
	class helicoptergears {
		type[] = {"mission"};
		title = "Helicopter gears";
		description = "Two accurately manufactured gears in mesh behave like the two circular wheels.";
		weight = 2;
		nbusage = 1;
		picture = "paa\helicoptergears.paa";
		requirement[] = {};
	};
	class helicoptercandle {
		type[] = {"mission"};
		title = "Helicopter spark plug";
		description = "Internal combustion engine spark plug.";
		weight = 0.1;
		nbusage = 1;
		picture = "paa\helicoptercandle.paa";
		requirement[] = {};
	};
	class helicopterhose {
		type[] = {"mission"};
		title = "Helicopter engine hose";
		description = "A hose for the Lycoming 235 Series Four-Cylinder Engine";
		weight = 0.1;
		nbusage = 1;
		picture = "paa\helicopterhose.paa";
		requirement[] = {};
	};
	class bk18 {
		type[] = {"mission"};
		title = "BK18 syringe";
		description = "BK18 is a nuclear serum single dose product. This product should be administrated by the patient himself.";
		weight = 0.1;
		nbusage = 1;
		picture = "paa\bk18.paa";
		requirement[] = {};
	};
	class medicalnote {
		type[] = {"mission"};
		title = "Medical note";
		description = "A synthesis medical note that has been produce during Z pandemia.";
		weight = 0.1;
		nbusage = 1;
		picture = "paa\classified_green.paa";
		requirement[] = {};
	};
	class bk18researchreport {
		type[] = {"mission"};
		title = "BK18 Research report";
		description = "A research report about the BK18 medecine.";
		weight = 0.1;
		nbusage = 1;
		picture = "paa\classified_green.paa";
		requirement[] = {};
	};
	class am212 {
		type[] = {"mission"};
		title = "AM212";
		description = "Am212 Isotop product";
		weight = 100;
		nbusage = 1;
		picture = "paa\am212.paa";
		requirement[] = {};
	};
	class shippingnote {
		type[] = {"mission"};
		title = "Am212 Shipping note";
		description = "A shipping note with the address of the supplier";
		weight = 0.1;
		nbusage = 1;
		picture = "paa\xsitereport.paa";
		requirement[] = {};
	};
	class xsitereport {
		type[] = {"mission"};
		title = "X Site Report";
		description = "A top secret X Site Report";
		weight = 0.1;
		nbusage = 1;
		picture = "paa\classified_red.paa";
		requirement[] = {};
	};
	class computetab {
		type[] = {"mission"};
		title = "Military Tab";
		description = "Your military mission tab";
		weight = 0.5;
		nbusage = -1;
		picture = "paa\computetab2.paa";
		requirement[] = {};
	};
	class failureengine {
		type[] = {"mission"};
		title = "Failure engine";
		description = "An old failure Engine.";
		weight = 400;
		nbusage = 1;
		picture = "paa\helicopterengine.paa";
		requirement[] = {"wrench", "gears", "hose"};
	};
	class engine {
		type[] = {"mission"};
		title = "Engine";
		description = "This Engine is a Popular Choice";
		weight = 400;
		nbusage = 1;
		picture = "paa\engine.paa";
		requirement[] = {};
	};
	class gears {
		type[] = {"mission"};
		title = "Gears";
		description = "Two accurately manufactured gears in mesh behave like the two circular wheels.";
		weight = 2;
		nbusage = 1;
		picture = "paa\helicoptergears.paa";
		requirement[] = {};
	};
	class classified_green {
		type[] = {"mission"};
		title = "Classified Green Data";
		description = "Information relating to your mission with summary importance.";
		weight = 2;
		nbusage = 1;
		picture = "paa\classified_green.paa";
		requirement[] = {};
	};
	class classified_orange {
		type[] = {"mission"};
		title = "Classified Orange Data";
		description = "Important information relating to your mission difficult to collect.";
		weight = 2;
		nbusage = 1;
		picture = "paa\classified_orange.paa";
		requirement[] = {};
	};
	class classified_red {
		type[] = {"mission"};
		title = "Classified Red Data";
		description = "Information that should not fall into any hand, very difficult to collect.";
		weight = 2;
		nbusage = 1;
		picture = "paa\classified_red.paa";
		requirement[] = {};
	};