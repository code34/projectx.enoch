#include "oop.h"

CLASS("oo_Vitems")
	PRIVATE UI_VARIABLE("control", "MainLayer");
	PRIVATE UI_VARIABLE("control", "OOP_camera");
	PRIVATE UI_VARIABLE("control", "OOP_Listbox_Capacities");
	PRIVATE UI_VARIABLE("control", "OOP_Listbox_Proximity");
	PRIVATE UI_VARIABLE("control", "OOP_MainLayer_100");
	PRIVATE UI_VARIABLE("control", "OOP_Text_Capacities");
	PRIVATE UI_VARIABLE("control", "OOP_Text_Description");
	PRIVATE UI_VARIABLE("control", "OOP_Text_Fond");
	PRIVATE UI_VARIABLE("control", "OOP_Text_Inventory");
	PRIVATE UI_VARIABLE("control", "OOP_Text_proximity");
	PRIVATE UI_VARIABLE("control", "OOP_pic_primaryweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_secondaryweapon");
	PRIVATE UI_VARIABLE("control", "OOP_pic_gunweapon");
	PRIVATE UI_VARIABLE("control", "OOP_btn_menu");
	PRIVATE UI_VARIABLE("display", "Display");
	PRIVATE UI_VARIABLE("array", "destination");
	PRIVATE UI_VARIABLE("array", "source");
	PRIVATE VARIABLE("scalar", "selectindex");

	PUBLIC FUNCTION("display", "constructor"){
		disableSerialization;
		MEMBER("Display", _this);
		MEMBER("MainLayer", _this displayCtrl 100);
		MEMBER("OOP_Listbox_Capacities", _this displayCtrl 103);
		MEMBER("OOP_Listbox_Proximity", _this displayCtrl 102);
		MEMBER("OOP_MainLayer_100", _this displayCtrl 100);
		MEMBER("OOP_Text_Capacities", _this displayCtrl 105);
		MEMBER("OOP_Text_Description", _this displayCtrl 107);
		MEMBER("OOP_Text_Fond", _this displayCtrl 101);
		MEMBER("OOP_Text_Inventory", _this displayCtrl 106);
		MEMBER("OOP_Text_proximity", _this displayCtrl 104);
		MEMBER("OOP_btn_menu", _this displayCtrl 108);
		MEMBER("OOP_pic_primaryweapon", _this displayCtrl 109);
		MEMBER("OOP_pic_secondaryweapon", _this displayCtrl 110);
		MEMBER("OOP_pic_gunweapon", _this displayCtrl 111);
		MEMBER("OOP_camera", _this displayCtrl 99);

		MEMBER("selectindex", -1);
		private _array = [];
		MEMBER("source", _array);
		private _array = [];
		MEMBER("destination", _array);
		MEMBER("OOP_btn_menu", nil) ctrlShow false;
		//MEMBER("OOP_Text_Description",nil) ctrlShow false;
		//MEMBER("OOP_Listbox_Capacities", nil) ctrlShow false;
		MEMBER("initWeapons", nil);
		MEMBER("Init", nil);
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

	PUBLIC FUNCTION("", "initWeapons") {
		private _ctrl = MEMBER("Display", nil) displayCtrl 109;
		private _pw = primaryWeapon player;
		if(_pw isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa";
		} else {
			private _picture = getText(configfile >> "cfgWeapons" >> _pw >> "picture");
			private _name = getText(configfile >> "cfgWeapons" >> _pw >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

		private _ctrl = MEMBER("Display", nil) displayCtrl 110;
		private _pw = secondaryWeapon player;
		if(_pw isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_secondary_gs.paa";
		} else {
			private _picture = getText(configfile >> "cfgWeapons" >> _pw >> "picture");
			private _name = getText(configfile >> "cfgWeapons" >> _pw >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

		private _ctrl = MEMBER("Display", nil) displayCtrl 111;
		private _pw = handgunWeapon player;
		if(_pw isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_hgun_gs.paa";
		} else {
			private _picture = getText(configfile >> "cfgWeapons" >> _pw >> "picture");
			private _name = getText(configfile >> "cfgWeapons" >> _pw >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

		private _ctrl = MEMBER("Display", nil) displayCtrl 112;
		private _pw = binocular player;
		if(_pw isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa";
		} else {
			private _picture = getText(configfile >> "cfgWeapons" >> _pw >> "picture");
			private _name = getText(configfile >> "cfgWeapons" >> _pw >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

		private _gear = "new" call OO_ARMAGEAR;
		private _weaponsitems = "weaponsItems" call _gear;

    	private _primaryoptic = (_weaponsitems select 0) select 3;
    	private _secondaryoptic = (_weaponsitems select 1) select 3;
    	private _gunoptic = (_weaponsitems select 2) select 3;
    	private _primarymag = ((_weaponsitems select 0) select 4) select 0;
    	private _secondarymag = ((_weaponsitems select 1) select 4) select 0;
    	private _gunmag = ((_weaponsitems select 2) select 4) select 0;
		private _ctrl = MEMBER("Display", nil) displayCtrl 113;

		if(_primarymag isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
		} else {
			private _picture = getText(configfile >> "CfgMagazines" >> _primarymag >> "picture");
			private _name = getText(configfile >> "CfgMagazines" >> _primarymag >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

		private _ctrl = MEMBER("Display", nil) displayCtrl 114;
		if(_gunmag isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
		} else {
			private _picture = getText(configfile >> "CfgMagazines" >> _gunmag >> "picture");
			private _name = getText(configfile >> "CfgMagazines" >> _gunmag >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

		private _ctrl = MEMBER("Display", nil) displayCtrl 115;
		if(_secondarymag isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
		} else {
			private _picture = getText(configfile >> "CfgMagazines" >> _secondarymag >> "picture");
			private _name = getText(configfile >> "CfgMagazines" >> _secondarymag >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

		private _ctrl = MEMBER("Display", nil) displayCtrl 116;
		if(_primaryoptic isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
		} else {
			private _picture = getText(configfile >> "CfgWeapons" >> _primaryoptic >> "picture");
			private _name = getText(configfile >> "CfgWeapons" >> _primaryoptic >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

		private _ctrl = MEMBER("Display", nil) displayCtrl 117;
		if(_gunoptic isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
		} else {
			private _picture = getText(configfile >> "CfgWeapons" >> _gunoptic >> "picture");
			private _name = getText(configfile >> "CfgWeapons" >> _gunoptic >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

		private _ctrl = MEMBER("Display", nil) displayCtrl 118;
		if(_secondaryoptic isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
		} else {
			private _picture = getText(configfile >> "CfgWeapons" >> _secondaryoptic >> "picture");
			private _name = getText(configfile >> "CfgWeapons" >> _secondaryoptic >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

		_headgear = headgear player;
		private _ctrl = MEMBER("Display", nil) displayCtrl 119;
		if(_headgear isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa";
		} else {
			private _picture = getText(configfile >> "CfgWeapons" >> _headgear >> "picture");
			private _name = getText(configfile >> "CfgWeapons" >> _headgear >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

		_uniform = uniform player;
		private _ctrl = MEMBER("Display", nil) displayCtrl 120;
		if(_uniform isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa";
		} else {
			private _picture = getText(configfile >> "CfgWeapons" >> _uniform >> "picture");
			private _name = getText(configfile >> "CfgWeapons" >> _uniform >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

		_vest = vest player;
		private _ctrl = MEMBER("Display", nil) displayCtrl 121;
		if(_vest isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa";
		} else {
			private _picture = getText(configfile >> "CfgWeapons" >> _vest >> "picture");
			private _name = getText(configfile >> "CfgWeapons" >> _vest >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

		_bag = backpack player;
		private _ctrl = MEMBER("Display", nil) displayCtrl 122;
		if(_bag isEqualTo "") then {
			_ctrl ctrlSetText "A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa";
		} else {
			private _picture = getText(configfile >> "CfgVehicles" >> _bag >> "picture");
			private _name = getText(configfile >> "CfgVehicles" >> _bag >> "displayName");
			_ctrl ctrlSetText _picture;
			_ctrl ctrlSetTooltip _name;
		};

	};

/*	PUBLIC FUNCTION("", "createGrid") {
		private _newx = 0.75;
		private _newy = 0.04;
		for "_z" from 0 to 18 step 1 do {
			for "_i" from 0 to 7 step 1 do {
				private _ctrl = MEMBER("Display",nil) ctrlCreate ["RscPicture", -1, MEMBER("Display",nil)  displayCtrl 100];
				_myx = (safezoneW * _newx);
				_myy = (safezoneH * _newy);
				_myw = (safezoneW * 0.03);
				_myh = (safezoneH * 0.05);
				_ctrl ctrlSetPosition [_myx,_myy,_myw,_myh];
				_ctrl ctrlSetBackgroundColor [0, 0, 0, 1];
				if(random 1 > 0.5) then {
					_ctrl ctrlSetText "pictures\cannedravioli.jpg";
				};
				_ctrl ctrlCommit 0;
				_newx = _newx + 0.03;
			};
			_newy = _newy + 0.05;
			_newx = 0.75;
		};
	};*/

	PUBLIC FUNCTION("array", "setMenu") {
		if((_this select 1) isEqualTo 1) then {
			private _pos = [(getMousePosition select 0) + (safezoneX * -1), (getMousePosition select 1) + (safezoneY * -1)];
			MEMBER("OOP_btn_menu", nil) ctrlShow true;
			MEMBER("OOP_btn_menu", nil) ctrlSetPosition _pos;
			MEMBER("OOP_btn_menu", nil) ctrlCommit 0;
			ctrlSetFocus MEMBER("OOP_btn_menu", nil);
		};
	};

	PUBLIC FUNCTION("array", "closeMenu") {
		if((_this select 1) isEqualTo 0) then {
			MEMBER("OOP_btn_menu", nil) ctrlShow false;
			MEMBER("OOP_btn_menu", nil) ctrlCommit 0;
		};
	};

	PUBLIC FUNCTION("string", "actionMenu") {
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

			case "view" : {
				private _index = lbCurSel  MEMBER("OOP_Listbox_Capacities", nil);
				if(_index > -1) then {

				};
			};
		};
	};

	PUBLIC FUNCTION("", "Init"){
		//MEMBER("Display", nil) displayAddEventHandler ["KeyDown", "if (_this select 1 isEqualTo 1) then {true} else {false};"];
		// print ground/object listbox
		MEMBER("refresh", nil);
	};

	PUBLIC FUNCTION("", "refresh"){
		private _array = [MEMBER("OOP_Listbox_Proximity",nil), proxcontainer];
		MEMBER("refresh_LISTBOX", _array);

		private _array = [MEMBER("OOP_Listbox_Capacities",nil), capcontainer];
		MEMBER("refresh_LISTBOX", _array);
		MEMBER("OOP_Listbox_Capacities",nil) lbSetCurSel MEMBER("selectindex", nil);
		MEMBER("refresh_title", nil);
		MEMBER("initWeapons", nil);
	};

	PUBLIC FUNCTION("array", "setDestination"){
		//systemChat str ['onLBDrag', _this]; 
		//private _control = MEMBER("Display", nil) displayCtrl (_this select 0);
		systemChat format ["%1", _this];
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
		} else {
			switch (true) do {
				case (_destination isEqualTo MEMBER("OOP_pic_primaryweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addToInventory", _object] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["getItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
					player selectWeapon (_object select 0);
				};

				case (_destination isEqualTo MEMBER("OOP_pic_secondaryweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addToInventory", _object] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["getItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
					player selectWeapon (_object select 0);
				};

				case (_destination isEqualTo MEMBER("OOP_pic_gunweapon", nil)) : {
					private _index = (((_this select 4) select 0) select 1);
					private _object = ("getContent" call _scontainer) select _index;
					private _gear = "new" call OO_ARMAGEAR;
					["addToInventory", _object] call _gear;
					if(_scontainer isEqualTo proxcontainer) then {
						private _item = ["getItem", _index] call proxcontainer;
						["addItem", _item] call capcontainer;
					};
					player selectWeapon (_object select 0);
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


	PUBLIC FUNCTION("", "getDisplay") FUNC_GETVAR("Display");
	PUBLIC FUNCTION("", "getMainLayer") FUNC_GETVAR("MainLayer");
	PUBLIC FUNCTION("", "getOOP_Listbox_Capacities") FUNC_GETVAR("OOP_Listbox_Capacities");
	PUBLIC FUNCTION("", "getOOP_Listbox_Proximity") FUNC_GETVAR("OOP_Listbox_Proximity");
	PUBLIC FUNCTION("", "getOOP_MainLayer_100") FUNC_GETVAR("OOP_MainLayer_100");
	PUBLIC FUNCTION("", "getOOP_Text_Capacities") FUNC_GETVAR("OOP_Text_Capacities");
	PUBLIC FUNCTION("", "getOOP_Text_Description") FUNC_GETVAR("OOP_Text_Description");
	PUBLIC FUNCTION("", "getOOP_Text_Fond") FUNC_GETVAR("OOP_Text_Fond");
	PUBLIC FUNCTION("", "getOOP_Text_Inventory") FUNC_GETVAR("OOP_Text_Inventory");
	PUBLIC FUNCTION("", "getOOP_Text_proximity") FUNC_GETVAR("OOP_Text_proximity");
	PUBLIC FUNCTION("", "getOOP_pic_primaryweapon") FUNC_GETVAR("OOP_pic_primaryweapon");
	PUBLIC FUNCTION("", "getOOP_pic_secondaryweapon") FUNC_GETVAR("OOP_pic_secondaryweapon");
	PUBLIC FUNCTION("", "getOOP_pic_gunweapon") FUNC_GETVAR("OOP_pic_gunweapon");
	PUBLIC FUNCTION("", "getOOP_btn_menu") FUNC_GETVAR("OOP_btn_menu");
	PUBLIC FUNCTION("control", "setMainLayer"){ MEMBER("MainLayer", _this); };
	PUBLIC FUNCTION("control", "setOOP_Listbox_Capacities"){ MEMBER("OOP_Listbox_Capacities", _this); };
	PUBLIC FUNCTION("control", "setOOP_Listbox_Proximity"){ MEMBER("OOP_Listbox_Proximity", _this); };
	PUBLIC FUNCTION("control", "setOOP_MainLayer_100"){ MEMBER("OOP_MainLayer_100", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_Capacities"){ MEMBER("OOP_Text_Capacities", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_Description"){ MEMBER("OOP_Text_Description", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_Fond"){ MEMBER("OOP_Text_Fond", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_Inventory"){ MEMBER("OOP_Text_Inventory", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_proximity"){ MEMBER("OOP_Text_proximity", _this); };
	PUBLIC FUNCTION("control", "setOOP_pic_primaryweapon"){ MEMBER("OOP_pic_primaryweapon", _this); };
	PUBLIC FUNCTION("control", "setOOP_pic_secondaryweapon"){ MEMBER("OOP_pic_secondaryweapon", _this); };
	PUBLIC FUNCTION("control", "setOOP_pic_gunweapon"){ MEMBER("OOP_pic_gunweapon", _this); };
	PUBLIC FUNCTION("control", "setOOP_btn_menu"){ MEMBER("OOP_btn_menu", _this); };
	PUBLIC FUNCTION("display", "setDisplay"){ MEMBER("Display", _this); };
	
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
		DELETE_UI_VARIABLE("MainLayer");
		DELETE_UI_VARIABLE("OOP_Listbox_Capacities");
		DELETE_UI_VARIABLE("OOP_Listbox_Proximity");
		DELETE_UI_VARIABLE("OOP_MainLayer_100");
		DELETE_UI_VARIABLE("OOP_Text_Capacities");
		DELETE_UI_VARIABLE("OOP_Text_Description");
		DELETE_UI_VARIABLE("OOP_Text_Fond");
		DELETE_UI_VARIABLE("OOP_Text_Inventory");
		DELETE_UI_VARIABLE("OOP_Text_proximity");
		DELETE_UI_VARIABLE("OOP_pic_primaryweapon");		
		DELETE_UI_VARIABLE("OOP_pic_secondaryweapon");
		DELETE_UI_VARIABLE("OOP_pic_gunweapon");
		DELETE_UI_VARIABLE("OOP_btn_menu");
		DELETE_UI_VARIABLE("Display");
		DELETE_VARIABLE("source");
		DELETE_VARIABLE("destination");
		DELETE_VARIABLE("selectindex");
	};
ENDCLASS;
