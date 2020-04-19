#include "oop.h"

CLASS("oo_Vitems")
	PRIVATE UI_VARIABLE("control", "OOP_fond");
	PRIVATE UI_VARIABLE("control", "OOP_Listbox_Capacities");
	PRIVATE UI_VARIABLE("control", "OOP_Listbox_Proximity");
	PRIVATE UI_VARIABLE("control", "OOP_Text_Capacities");
	PRIVATE UI_VARIABLE("control", "OOP_Text_Description");
	PRIVATE UI_VARIABLE("control", "OOP_Text_Inventory");
	PRIVATE UI_VARIABLE("control", "OOP_Text_proximity");
	PRIVATE UI_VARIABLE("control", "OOP_cap_menu");
	PRIVATE UI_VARIABLE("control", "OOP_inv_menu");
	PRIVATE UI_VARIABLE("control", "OOP_inv_target");
	PRIVATE UI_VARIABLE("control", "OOP_pic_primaryweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_secondaryweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_gunweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_binocular");
	PRIVATE UI_VARIABLE("control", "OOP_pic_magprimaryweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_maggunweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_magsecondaryweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_opticprimaryweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_optichandgunweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_opticsecondaryweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_flashprimaryweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_flashhandgunweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_flashsecondaryweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_head");
	PRIVATE UI_VARIABLE("control", "OOP_pic_uniform");
	PRIVATE UI_VARIABLE("control", "OOP_pic_vest");
	PRIVATE UI_VARIABLE("control", "OOP_pic_backpack");
	PRIVATE UI_VARIABLE("display", "Display");
	PRIVATE UI_VARIABLE("array", "destination");
	PRIVATE UI_VARIABLE("array", "source");
	PRIVATE VARIABLE("scalar", "selectindex");
	PRIVATE VARIABLE("array", "alreadyshow");

	PUBLIC FUNCTION("display", "constructor"){
		disableSerialization;
		MEMBER("Display", _this);
		MEMBER("OOP_fond", _this displayCtrl 99);
		MEMBER("OOP_Listbox_Proximity", _this displayCtrl 102);
		MEMBER("OOP_Listbox_Capacities", _this displayCtrl 103);
		MEMBER("OOP_Text_Capacities", _this displayCtrl 105);
		MEMBER("OOP_Text_Description", _this displayCtrl 107);
		MEMBER("OOP_Text_Inventory", _this displayCtrl 106);
		MEMBER("OOP_Text_proximity", _this displayCtrl 104);
		MEMBER("OOP_cap_menu", _this displayCtrl 108);
		MEMBER("OOP_inv_menu", _this displayCtrl 123);
		MEMBER("OOP_pic_primaryweapon", _this displayCtrl 109);
		MEMBER("OOP_pic_secondaryweapon", _this displayCtrl 110);
		MEMBER("OOP_pic_gunweapon", _this displayCtrl 111);
		MEMBER("OOP_pic_binocular", _this displayCtrl 112);
		MEMBER("OOP_pic_magprimaryweapon", _this displayCtrl 113);
		MEMBER("OOP_pic_maggunweapon", _this displayCtrl 114);
		MEMBER("OOP_pic_magsecondaryweapon", _this displayCtrl 115);
		MEMBER("OOP_pic_opticprimaryweapon", _this displayCtrl 116);
		MEMBER("OOP_pic_optichandgunweapon", _this displayCtrl 117);
		MEMBER("OOP_pic_opticsecondaryweapon", _this displayCtrl 118);
		MEMBER("OOP_pic_head", _this displayCtrl 119);
		MEMBER("OOP_pic_uniform", _this displayCtrl 120);
		MEMBER("OOP_pic_vest", _this displayCtrl 121);
		MEMBER("OOP_pic_backpack", _this displayCtrl 122);
		MEMBER("OOP_pic_flashprimaryweapon", _this displayCtrl 124);
		MEMBER("OOP_pic_flashhandgunweapon", _this displayCtrl 125);
		MEMBER("OOP_pic_flashsecondaryweapon", _this displayCtrl 126);

		MEMBER("selectindex", -1);
		private _array = [];
		MEMBER("source", _array);
		private _array = [];
		MEMBER("destination", _array);
		private _array = [];
		MEMBER("alreadyshow", _array);
		MEMBER("OOP_cap_menu", nil) ctrlShow false;
		MEMBER("OOP_inv_menu", nil) ctrlShow false;
		//MEMBER("OOP_Text_Description",nil) ctrlShow false;
		//MEMBER("OOP_Listbox_Capacities", nil) ctrlShow false;
		MEMBER("Init", nil);
	};

	PUBLIC FUNCTION("", "Init"){
		//MEMBER("Display", nil) displayAddEventHandler ["KeyDown", "if (_this select 1 isEqualTo 1) then {true} else {false};"];
		// print ground/object listbox
		MEMBER("refresh", nil);
	};

/*		uniformTab = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa";
		vestTab = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa";
		backpackTab = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa";
		headGearSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa";
		gogglesSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_glasses_gs.paa";
		hmdSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_nvg_gs.paa";
		binocSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa";
		primarySlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa";
		secondarySlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_secondary_gs.paa";
		handgunSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_hgun_gs.paa";
		muzzleSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
		opticsSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
		flashlightSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa";
		magazineSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
		magazineGLSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazineGL_gs.paa";
		underBarrelSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa";
		mapSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_map_gs.paa";
		compassSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_compass_gs.paa";
		watchSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_watch_gs.paa";
		radioSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_radio_gs.paa";
		gpsSlot = "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_gps_gs.paa";*/

	PUBLIC FUNCTION("array", "setItemPicture") {
		private _class = _this select 0;
		private _control = _this select 1;
		private _type = _this select 2;
		private _picture = _this select 3;
		
		if(_class isEqualTo "") then {
			MEMBER(_control, nil) ctrlSetText _picture;
		} else {
			private _picture = getText(configfile >> _type >> _class >> "picture");
			private _name = getText(configfile >> _type >> _class >> "displayName");
			MEMBER(_control, nil) ctrlSetText _picture;
			MEMBER(_control, nil) ctrlSetTooltip _name;
		};
	};

	// Rempli le centre de l'inventaire avec l'uniforme, les armes ,le casque etc.
	PUBLIC FUNCTION("", "refreshInventory") {
		private _gear = "new" call OO_ARMAGEAR;
		private _weaponsitems = "weaponsItems" call _gear;
    	private _primaryoptic = (_weaponsitems select 0) select 3;
    	private _secondaryoptic = (_weaponsitems select 1) select 3;
    	private _handgunoptic = (_weaponsitems select 2) select 3;
    	private _primarymag = ((_weaponsitems select 0) select 4) select 0;
    	private _secondarymag = ((_weaponsitems select 1) select 4) select 0;
    	private _handgunmag = ((_weaponsitems select 2) select 4) select 0;
    	
    	private _primaryflash = (_weaponsitems select 0) select 2;
    	private _secondaryflash = (_weaponsitems select 1) select 2;
    	private _handgunflash = (_weaponsitems select 2) select 2;

    	private _headgear = headgear player;
    	private _uniform = uniform player;
		private _vest = vest player;
		private _bag = backpack player;

		private _array = [[(primaryWeapon player), "OOP_pic_primaryweapon", "cfgWeapons", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa"],[(secondaryWeapon player), "OOP_pic_secondaryweapon", "cfgWeapons", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_secondary_gs.paa"],[(handgunWeapon player), "OOP_pic_gunweapon", "cfgWeapons", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_hgun_gs.paa"],[(binocular player), "OOP_pic_binocular", "cfgWeapons", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa"],[_primarymag, "OOP_pic_magprimaryweapon", "CfgMagazines", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa"],[_handgunmag, "OOP_pic_maggunweapon", "CfgMagazines", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa"],[_secondarymag, "OOP_pic_magsecondaryweapon", "CfgMagazines", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa"],[_primaryoptic, "OOP_pic_opticprimaryweapon", "CfgWeapons", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa"],[_handgunoptic, "OOP_pic_optichandgunweapon", "CfgWeapons", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa"],[_secondaryoptic, "OOP_pic_opticsecondaryweapon", "CfgWeapons", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa"],[_headgear, "OOP_pic_head", "CfgWeapons", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa"],[_uniform, "OOP_pic_uniform", "CfgWeapons", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa"],[_vest, "OOP_pic_vest", "CfgWeapons", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa"],[_bag, "OOP_pic_backpack", "CfgVehicles", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa"],[_primaryflash, "OOP_pic_flashprimaryweapon", "CfgWeapons", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa"],[_secondaryflash, "OOP_pic_flashsecondaryweapon", "CfgWeapons", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa"],[_handgunflash, "OOP_pic_flashhandgunweapon", "CfgWeapons", "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa"]];
		{MEMBER("setItemPicture", _x);} forEach _array;
		
		private _alreadyshow = [toLower(_headgear),toLower(_uniform), toLower(_vest), toLower(_bag),
		toLower(_primaryoptic), toLower(_secondaryoptic), toLower(_handgunoptic),
		toLower(_primarymag), toLower(_secondarymag), toLower(_handgunmag),
		toLower(_primaryflash), toLower(_secondaryflash),toLower(_handgunflash),
		toLower(primaryWeapon player), toLower(secondaryWeapon player),
		toLower(handgunWeapon player), toLower(binocular player)];
		MEMBER("alreadyshow", _alreadyshow);
	};

	PUBLIC FUNCTION("string", "removeItem") {
		switch (_this) do { 			
			case "head" : { removeHeadgear player; };
			case "backpack" : { removeBackpack player; };
			case "uniform" : {removeUniform player; };
			case "vest" : {removeVest player; };
			case "primaryweapon" : {player removeWeapon (primaryWeapon player);};
			case "secondaryweapon" : {player removeWeapon (secondaryWeapon player);};
			case "handgunweapon" : {player removeWeapon (handgunWeapon player);};
			case "binocular" : {player removeWeapon (binocular player);};
			case "primarymag" : {
				private _mags = (primaryWeaponMagazine player);
				if(count _mags > 0) then {	
					player removeMagazines (_mags select 0);
					player setAmmo [primaryWeapon player, 0];
				};
			};
			case "secondarymag" : {
				private _mags = (secondaryWeaponMagazine player);
				if(count _mags > 0) then {	
					player removeMagazines (_mags select 0); 
					player setAmmo [secondaryWeapon player, 0];
				};
			};
			case "gunmag" : {
				private _mags = (handgunMagazine player);
				if(count _mags > 0) then { 
					player removeMagazines (_mags select 0); 
					player setAmmo [handgunWeapon player, 0];
				};
			};
			default {}; 
		};
		MEMBER("refresh", nil);
	};

	PUBLIC FUNCTION("array", "setInvMenu") {
		if((_this select 1) isEqualTo 1) then {
			MEMBER("OOP_inv_target", _this select 0);
			private _pos = [(getMousePosition select 0) + (safezoneX * -1), (getMousePosition select 1) + (safezoneY * -1)];
			MEMBER("OOP_inv_menu", nil) ctrlShow true;
			MEMBER("OOP_inv_menu", nil) ctrlSetPosition _pos;
			MEMBER("OOP_inv_menu", nil) ctrlCommit 0;
			ctrlSetFocus MEMBER("OOP_inv_menu", nil);
		};
	};

	PUBLIC FUNCTION("array", "closeInvMenu") {
		//if((_this select 1) isEqualTo 0) then {
			MEMBER("OOP_inv_menu", nil) ctrlShow false;
			MEMBER("OOP_inv_menu", nil) ctrlCommit 0;
		//};
	};

	PUBLIC FUNCTION("string", "actionInvMenu") {
		private _target = MEMBER("OOP_inv_target", nil);
		switch(_this) do {
			case "loadout" : {
				switch(true) do {
					case (_target isEqualTo MEMBER("OOP_pic_head",nil)) : { MEMBER("removeItem","head");};
					case (_target isEqualTo MEMBER("OOP_pic_vest",nil)) : { MEMBER("removeItem","vest");};
					case (_target isEqualTo MEMBER("OOP_pic_uniform",nil)) : { MEMBER("removeItem","uniform");};
					case (_target isEqualTo MEMBER("OOP_pic_backpack",nil)) : { MEMBER("removeItem","backpack");};
					case (_target isEqualTo MEMBER("OOP_pic_primaryweapon",nil)) : { MEMBER("removeItem","primaryweapon");};
					case (_target isEqualTo MEMBER("OOP_pic_secondaryweapon",nil)) : { MEMBER("removeItem","secondaryweapon");};
					case (_target isEqualTo MEMBER("OOP_pic_gunweapon",nil)) : { MEMBER("removeItem","handgunweapon");};
					case (_target isEqualTo MEMBER("OOP_pic_binocular",nil)) : { MEMBER("removeItem","binocular");};
					case (_target isEqualTo MEMBER("OOP_pic_magprimaryweapon",nil)) : { MEMBER("removeItem","primarymag");};
					case (_target isEqualTo MEMBER("OOP_pic_magsecondaryweapon",nil)) : { MEMBER("removeItem","secondarymag");};
					case (_target isEqualTo MEMBER("OOP_pic_maggunweapon",nil)) : { MEMBER("removeItem","gunmag");};
					default {};
				};
			};
			case "drop" : {
				private _type = "";
				private _count = 1;
				switch (true) do {
					case (_target isEqualTo MEMBER("OOP_pic_head",nil)) : {
						_type = headgear player;
					};
					case (_target isEqualTo MEMBER("OOP_pic_vest",nil)) : {
						_type = vest player;
					};
					case (_target isEqualTo MEMBER("OOP_pic_uniform",nil)) : {
						_type = uniform player;
					};
					case (_target isEqualTo MEMBER("OOP_pic_backpack",nil)) : {
						_type = backpack player;
					};
					case (_target isEqualTo MEMBER("OOP_pic_primaryweapon",nil)) : {
						_type = primaryWeapon player;
					};
					case (_target isEqualTo MEMBER("OOP_pic_magprimaryweapon",nil)) : {
						_type = primaryWeapon player;
					};					
					case (_target isEqualTo MEMBER("OOP_pic_opticprimaryweapon",nil)) : {
						_type = primaryWeapon player;
					};
					case (_target isEqualTo MEMBER("OOP_pic_flashprimaryweapon",nil)) : {
						_type = primaryWeapon player;
					};					
					case (_target isEqualTo MEMBER("OOP_pic_secondaryweapon",nil)) : {
						_type = secondaryWeapon player;
					};
					case (_target isEqualTo MEMBER("OOP_pic_opticsecondaryweapon",nil)) : {
						_type = secondaryWeapon player;
					};
					case (_target isEqualTo MEMBER("OOP_pic_flashsecondaryweapon",nil)) : {
						_type = secondaryWeapon player;
					};
					case (_target isEqualTo MEMBER("OOP_pic_gunweapon",nil)) : {
						_type = handgunWeapon player;
					};
					case (_target isEqualTo MEMBER("OOP_pic_optichandgunweapon",nil)) : {
						_type = handgunWeapon player;
					};
					case (_target isEqualTo MEMBER("OOP_pic_flashhandgunweapon",nil)) : {
						_type = handgunWeapon player;
					};
					case (_target isEqualTo MEMBER("OOP_pic_binocular",nil)) : {
						_type = binocular player;
					};
					default {}; 
				};
				private _transfert = [capcontainer, proxcontainer, _type, _count];
				MEMBER("transfertItem2", _transfert);
			};
		};
	};

	// Transfert an Item and all its content from an other
	// L'objet item doit être entier (array de 7)
	PUBLIC FUNCTION("array", "transfertItem") {
		private _source = _this select 0;
		private _destination = _this select 1;
		private _item = _this select 3;

		private _gear = "new" call OO_ARMAGEAR;
		private _items = ["getCargoItems", _item] call _gear;
		_items pushBack _item;
		
		["removeToInventory", _item] call _gear;
		["removeItemsByLabel", _items] call _source;
		["addItemsByLabel", _items] call _destination;
		MEMBER("refresh", nil);
	};

	// Transfert an Item and all its content from an other
	// L'objet item doit être entier (array de 7)
	PUBLIC FUNCTION("array", "transfertItem2") {
		private _source = _this select 0;
		private _destination = _this select 1;
		private _type = _this select 2;
		private _count = _this select 3;
		private _items = [[_type, _count]];

		// De l'inventaire vers le sol
		if((_source isEqualTo capcontainer) and (_destination isEqualTo proxcontainer)) then {
			private _gear = "new" call OO_ARMAGEAR;
			//_items append (["getCargoItems2", _type] call _gear);
			["removeCargo", _type] call _gear;
		};

		// Du sol vers l'inventaire
		if((_source isEqualTo proxcontainer) and (_destination isEqualTo capcontainer)) then {
			["addToInventory2", [_type, _count]] call _gear;
		};

		["removeItemsByLabel", _items] call _source;
		["addItemsByLabel", _items] call _destination;
		MEMBER("refresh", nil);
	};


	PUBLIC FUNCTION("array", "setCapMenu") {
		if((_this select 1) isEqualTo 1) then {
			private _pos = [(getMousePosition select 0) + (safezoneX * -1), (getMousePosition select 1) + (safezoneY * -1)];
			MEMBER("OOP_cap_menu", nil) ctrlShow true;
			MEMBER("OOP_cap_menu", nil) ctrlSetPosition _pos;
			MEMBER("OOP_cap_menu", nil) ctrlCommit 0;
			ctrlSetFocus MEMBER("OOP_cap_menu", nil);
		};
	};

	PUBLIC FUNCTION("array", "closeCapMenu") {
		//if((_this select 1) isEqualTo 0) then {
			MEMBER("OOP_cap_menu", nil) ctrlShow false;
			MEMBER("OOP_cap_menu", nil) ctrlCommit 0;
		//};
	};

	PUBLIC FUNCTION("string", "actionCapMenu") {
		switch(_this) do {
			case "use" : {
				private _index = lbCurSel  MEMBER("OOP_Listbox_Capacities", nil);
				if(_index > -1) then {
					_index = ["useItem", _index] call capcontainer;
					MEMBER("selectindex", _index);
					MEMBER("refresh", nil);
				};
			};
			case "drop" : {
				private _index = lbCurSel  MEMBER("OOP_Listbox_Capacities", nil);
				if(_index > -1) then {
					private _array = [MEMBER("OOP_Listbox_Capacities", nil), _index];
					MEMBER("getDblClick", _array);
				};
			};

			case "shred" : {
				private _index = lbCurSel  MEMBER("OOP_Listbox_Capacities", nil);
				if(_index > -1) then {

				};
			};
		};
	};

	PUBLIC FUNCTION("", "refresh"){
		MEMBER("refreshInventory", nil);
		private _array = [MEMBER("OOP_Listbox_Proximity",nil), proxcontainer, []];
		MEMBER("refresh_LISTBOX", _array);
		private _array = [MEMBER("OOP_Listbox_Capacities",nil), capcontainer];
		MEMBER("refresh_LISTBOX", _array);
		MEMBER("OOP_Listbox_Capacities",nil) lbSetCurSel MEMBER("selectindex", nil);
		MEMBER("refresh_title", nil);
	};

	PUBLIC FUNCTION("array", "setDestination"){
		//systemChat str ['onLBDrag', _this]; 
		//private _control = MEMBER("Display", nil) displayCtrl (_this select 0);
		//systemChat format ["%1", _this];
		MEMBER("destination", _this);
	};

	PUBLIC FUNCTION("array", "setSource"){
		MEMBER("source", _this);
	};

	PUBLIC FUNCTION("array", "dragDrop") {
		private _gear = "new" call OO_ARMAGEAR;
		private _source = MEMBER("source", nil) select 0;
		private _destination = MEMBER("destination", nil) select 0;
		private _scontainer = "";
		private _dcontainer = "";

		if (_source isEqualTo MEMBER("OOP_Listbox_Capacities", nil)) then {
			_scontainer = capcontainer;
		} else {
			_scontainer = proxcontainer;
		};

		if((_destination isEqualTo MEMBER("OOP_Listbox_Capacities", nil)) or (_destination isEqualTo MEMBER("OOP_Listbox_Proximity", nil))) then {
			if (_destination isEqualTo MEMBER("OOP_Listbox_Capacities", nil)) then {
				_dcontainer = capcontainer;
			} else {
				_dcontainer = proxcontainer;
			};
			private _index = (((_this select 4) select 0) select 1);
			private _item = ["getItem", _index] call _scontainer;
			private _transfert = [_scontainer, _dcontainer, _item select 0, _item select 4];
			MEMBER("transfertItem2", _transfert);
		} else {
			switch (true) do {
				case (_destination isEqualTo MEMBER("OOP_pic_head", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _class = (("getContent" call _scontainer) select _index) select 0;
					private _gear = "new" call OO_ARMAGEAR;
					["addItem", ["head",_class]] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
				};

				case (_destination isEqualTo MEMBER("OOP_pic_vest", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _class = (("getContent" call _scontainer) select _index) select 0;
					private _gear = "new" call OO_ARMAGEAR;
					["addItem", ["vest",_class]] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
				};

				case (_destination isEqualTo MEMBER("OOP_pic_uniform", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _class = (("getContent" call _scontainer) select _index) select 0;
					private _gear = "new" call OO_ARMAGEAR;
					["addItem", ["uniform",_class]] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
				};

				case (_destination isEqualTo MEMBER("OOP_pic_backpack", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _class = (("getContent" call _scontainer) select _index) select 0;
					private _gear = "new" call OO_ARMAGEAR;
					["addItem", ["backpack",_class]] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
				};


				case (_destination isEqualTo MEMBER("OOP_pic_primaryweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addWeapon", _object] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
					player selectWeapon (_object select 0);
				};

				case (_destination isEqualTo MEMBER("OOP_pic_secondaryweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addWeapon", _object] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
					player selectWeapon (_object select 0);
				};

				case (_destination isEqualTo MEMBER("OOP_pic_gunweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addWeapon", _object] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
					player selectWeapon (_object select 0);
				};

				case (_destination isEqualTo MEMBER("OOP_pic_magprimaryweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addMagazines", ["primaryweapon", _object select 0]] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
				};

				case (_destination isEqualTo MEMBER("OOP_pic_magsecondaryweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addMagazines", ["secondaryweapon", _object select 0]] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
				};

				case (_destination isEqualTo MEMBER("OOP_pic_maggunweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addMagazines", ["handgunweapon", _object select 0]] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
				};

				case (_destination isEqualTo MEMBER("OOP_pic_opticprimaryweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addItem", ["primaryweapon", _object select 0]] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
				};

				case (_destination isEqualTo MEMBER("OOP_pic_optichandgunweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addItem", ["handgunweapon", _object select 0]] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
				};

				case (_destination isEqualTo MEMBER("OOP_pic_opticsecondaryweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addItem", ["secondaryweapon", _object select 0]] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
				};

				case (_destination isEqualTo MEMBER("OOP_pic_flashprimaryweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addItem", ["primaryweapon", _object select 0]] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
				};

				case (_destination isEqualTo MEMBER("OOP_pic_flashsecondaryweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addItem", ["secondaryweapon", _object select 0]] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
				};

				case (_destination isEqualTo MEMBER("OOP_pic_flashhandgunweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addItem", ["handgunweapon", _object select 0]] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["popItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
				};

				default { hint "other";	};
			};
		};
		MEMBER("refresh", nil);
	};

	PUBLIC FUNCTION("array", "getDblClick") {
		private _gear = "new" call OO_ARMAGEAR;
		private _control = _this select 0;
		private _index = _this select 1;
		private _scontainer = "";
		private _dcontainer = "";

		if(_control isEqualTo MEMBER("OOP_Listbox_Capacities", nil)) then {
			_scontainer = capcontainer;
			_dcontainer = proxcontainer;
		} else {
			_scontainer = proxcontainer;
			_dcontainer = capcontainer;
		};

		private _item = ["getItemUnitary", _index] call _scontainer;
		if(_item select 7) then {
			if((_scontainer isEqualTo capcontainer) and (_dcontainer isEqualTo proxcontainer)) then { 
				["removeToInventory", _item] call _gear;
			} else {
				if((_scontainer isEqualTo proxcontainer) and(_dcontainer isEqualTo capcontainer)) then {
					["addToInventory", _item] call _gear;
				};
			};
		};
		["addItem", _item] call _dcontainer;
		MEMBER("refresh", nil);
	};

	PUBLIC FUNCTION("", "refresh_title") {
		DEBUG(#, "OO_VITEMS::refresh_title")
		private _name = "getName" call capcontainer;
		private _weight = "countWeight" call capcontainer;
		private _size = "countSize" call capcontainer;
		private _limitsize = "getLimitSize" call capcontainer;
		private _limitweight = "getLimitWeight" call capcontainer;
		MEMBER("OOP_Text_Inventory", nil) ctrlSetText format["%1 inventory | Items: %2 | Total Weight: %4 Kg", _name, _size, _limitsize, _weight, _limitweight];
	};

	// filtre les equipements déjà montré au centre hormis les munitions
	PUBLIC FUNCTION("array", "filter_Content") {
		private _alreadyshow = MEMBER("alreadyshow", nil);
		private _content = _this;
		private _newcontent = [];

		{
			if!(toLower(_x select 0) in _alreadyshow) then {
				_newcontent pushBack _x;
			} else {
				if((_x select 4) > 1) then { _newcontent pushBack _x;};
			};
		} forEach _content;
		_newcontent;
	};

	PUBLIC FUNCTION("array", "refresh_LISTBOX") {
		DEBUG(#, "OO_VITEMS::refresh_LISTBOX")
		private _control = _this select 0;
		private _container = _this select 1;

		lbClear _control;
		
		private _name = "getName" call _container;
		private _weight = "countWeight" call _container;
		private _size = "countSize" call _container;
		private _limitsize = "getLimitSize" call _container;
		private _limitweight = "getLimitWeight" call _container;
		private _content = "getContent" call _container;
		
		//_content = MEMBER("filter_Content", _content);
		{
				if((_x select 4) > -1) then {
					_control lbAdd format["%1x %2",(_x select 4), (_x select 1)];
				} else {
					_control lbAdd format["%1",(_x select 1)];
				};
				_control lbSetPicture [_forEachIndex, (_x select 5)];
				_control lbSetValue[_forEachIndex, _forEachIndex];
		}foreach _content;

		private _indexlast =  ("countSize" call _container) - 1;
		private _indexselected = lbCurSel _control;

		if(_indexselected > _indexlast) then {
			_control lbSetCurSel _indexlast;
			_indexselected = _indexlast;
		};

		if((_indexselected isEqualTo -1) && (_indexlast > -1)) then {
			_control lbSetCurSel 0;
			_indexselected = 0;
		};
	};

	/*
	*	onLBSelChanged:
	*		The selection in a listbox is changed. The left mouse button has been released and the new selection is fully made.
	*		Returns the control and the selected element index.
	*/
	PUBLIC FUNCTION("array", "onLBSelChanged_OOP_Listbox_Proximity") {
		DEBUG(#, "OO_VITEMS::onLBSelChanged_OOP_Listbox_Proximity")
		private _control = _this select 0;
		private _index = _this select 1;
		if(_index >= ("countSize" call proxcontainer)) exitWith {};
		if(_index > -1) then {
			private _content = ("getContent" call proxcontainer) select _index;
			MEMBER("OOP_Listbox_Capacities",nil) lbSetCurSel -1;
			//"name", "description", "category", "price","weight", "owner", "life"
			MEMBER("OOP_Text_Description", nil) ctrlSetStructuredText parseText format ["%1<br/>", _content select 2];
		};
	};

	/*
	*	onLBDragging:
	*		Drag & drop operation is in progress.
	*		Returns the control and the x and y coordinates.
	*/
	PUBLIC FUNCTION("array", "onLBDragging_OOP_Listbox_Proximity") {
		DEBUG(#, "OO_VITEMS::onLBDragging_OOP_Listbox_Proximity")
		private _control = _this select 0;
		private _abs = _this select 1;
		private _ord = _this select 2;

	};

	/*
	*	onLBDrag:
	*		Drag & drop operation started.
	*		Returns the control and the selected element index.
	*/
	PUBLIC FUNCTION("array", "onLBDrag_OOP_Listbox_Proximity") {
		DEBUG(#, "OO_VITEMS::onLBDrag_OOP_Listbox_Proximity")
		private _control = _this select 0;
		private _index = _this select 1;

	};

	/*
	*	onLBSelChanged:
	*		The selection in a listbox is changed. The left mouse button has been released and the new selection is fully made.
	*		Returns the control and the selected element index.
	*/
	PUBLIC FUNCTION("array", "onLBSelChanged_OOP_Listbox_Capacities") {
		DEBUG(#, "OO_VITEMS::onLBSelChanged_OOP_Listbox_Capacities")
		private _control = _this select 0;
		private _index = _this select 1;
		if(_index >= ("countSize" call capcontainer)) exitWith {};
		if(_index > -1) then {
			private _content = ("getContent" call capcontainer) select _index;
			MEMBER("OOP_Listbox_Proximity",nil) lbSetCurSel -1;
			//"name", "description", "category", "price","weight", "owner", "life"
			MEMBER("OOP_Text_Description", nil) ctrlSetStructuredText parseText format ["%1<br/>", _content select 2];
		};
	};

	/*
	*	onLBDrag:
	*		Drag & drop operation started.
	*		Returns the control and the selected element index.
	*/
	PUBLIC FUNCTION("array", "onLBDrag_OOP_Listbox_Capacities") {
		DEBUG(#, "OO_VITEMS::onLBDrag_OOP_Listbox_Capacities")
		private _control = _this select 0;
		private _index = _this select 1;

	};

	/*
	*	onLBDragging:
	*		Drag & drop operation is in progress.
	*		Returns the control and the x and y coordinates.
	*/
	PUBLIC FUNCTION("array", "onLBDragging_OOP_Listbox_Capacities") {
		DEBUG(#, "OO_VITEMS::onLBDragging_OOP_Listbox_Capacities")
		private _control = _this select 0;
		private _abs = _this select 1;
		private _ord = _this select 2;

	};

	PUBLIC FUNCTION("", "deconstructor"){
		DEBUG(#, "OO_VITEMS::deconstructor")
		"save" call proxcontainer;
		"save" call capcontainer;
		invcam cameraEffect ["terminate","back"];
		camDestroy invcam;
		if(("getModel" call proxcontainer) isEqualTo "box_uav_06_f.p3d") then {
			private _size = "countSize" call proxcontainer;
			if (_size isEqualTo 0) then {
				deleteVehicle (objectFromNetId ("getNetId" call proxcontainer));
			} else {
				private _netid = "getNetId" call proxcontainer;
				private _position = player getRelPos [2,0];
				(objectFromNetId _netid) setPosATL _position;
			};
		};
		//["delete", capcontainer] call OO_CONTAINER;
		["delete", proxcontainer] call OO_CONTAINER;
		DELETE_UI_VARIABLE("OOP_Listbox_Capacities");
		DELETE_UI_VARIABLE("OOP_Listbox_Proximity");
		DELETE_UI_VARIABLE("OOP_Text_Capacities");
		DELETE_UI_VARIABLE("OOP_Text_Description");
		DELETE_UI_VARIABLE("OOP_Text_Inventory");
		DELETE_UI_VARIABLE("OOP_Text_proximity");
		DELETE_UI_VARIABLE("OOP_cap_menu");
		DELETE_UI_VARIABLE("OOP_inv_menu");
		DELETE_UI_VARIABLE("OOP_inv_target");
		DELETE_UI_VARIABLE("OOP_pic_primaryweapon");		
		DELETE_UI_VARIABLE("OOP_pic_secondaryweapon");
		DELETE_UI_VARIABLE("OOP_pic_gunweapon");
		DELETE_UI_VARIABLE("OOP_pic_binocular");
		DELETE_UI_VARIABLE("OOP_pic_magprimaryweapon");
		DELETE_UI_VARIABLE("OOP_pic_maggunweapon");
		DELETE_UI_VARIABLE("OOP_pic_magsecondaryweapon");
		DELETE_UI_VARIABLE("OOP_pic_opticprimaryweapon");
		DELETE_UI_VARIABLE("OOP_pic_optichandgunweapon");
		DELETE_UI_VARIABLE("OOP_pic_opticsecondaryweapon");
		DELETE_UI_VARIABLE("OOP_pic_flashprimaryweapon");
		DELETE_UI_VARIABLE("OOP_pic_flashhandgunweapon");
		DELETE_UI_VARIABLE("OOP_pic_flashsecondaryweapon");
		DELETE_UI_VARIABLE("OOP_pic_head");
		DELETE_UI_VARIABLE("OOP_pic_uniform");
		DELETE_UI_VARIABLE("OOP_pic_vest");
		DELETE_UI_VARIABLE("OOP_pic_backpack");
		DELETE_UI_VARIABLE("Display");
		DELETE_VARIABLE("source");
		DELETE_VARIABLE("destination");
		DELETE_VARIABLE("selectindex");
		DELETE_VARIABLE("alreadyshow");
	};
ENDCLASS;
