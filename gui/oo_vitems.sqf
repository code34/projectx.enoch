#include "oop.h"

CLASS("oo_Vitems")
	PRIVATE UI_VARIABLE("control", "MainLayer");
	PRIVATE UI_VARIABLE("control", "OOP_Listbox_Capacities");
	PRIVATE UI_VARIABLE("control", "OOP_Listbox_Proximity");
	PRIVATE UI_VARIABLE("control", "OOP_MainLayer_100");
	PRIVATE UI_VARIABLE("control", "OOP_Text_Capacities");
	PRIVATE UI_VARIABLE("control", "OOP_Text_Description");
	PRIVATE UI_VARIABLE("control", "OOP_Text_Fond");
	PRIVATE UI_VARIABLE("control", "OOP_Text_Inventory");
	PRIVATE UI_VARIABLE("control", "OOP_Text_proximity");
	PRIVATE UI_VARIABLE("control", "OOP_btn_use");
	PRIVATE UI_VARIABLE("control", "OOP_btn_weapons");
	PRIVATE UI_VARIABLE("display", "Display");
	PRIVATE UI_VARIABLE("array", "destination");
	PRIVATE UI_VARIABLE("array", "source");
	PRIVATE VARIABLE("string", "mode");

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
		MEMBER("OOP_btn_use", _this displayCtrl 110);
		MEMBER("OOP_btn_weapons", _this displayCtrl 111);
		MEMBER("Init", nil);
	};

	PUBLIC FUNCTION("", "btnAction_OOP_btn_use") {
		private _index = lbCurSel  MEMBER("OOP_Listbox_Capacities", nil);
		if(_index > -1) then {
			["useItem", _index] call capcontainer;
			MEMBER("refresh", nil);
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
		MEMBER("refresh_title", nil);
	};

	PUBLIC FUNCTION("array", "setDestination"){
		//systemChat str ['onLBDrag', _this]; 
		//private _control = MEMBER("Display", nil) displayCtrl (_this select 0);
		MEMBER("destination", _this);
	};

	PUBLIC FUNCTION("array", "setSource"){
		MEMBER("source", _this);
	};

	PUBLIC FUNCTION("array", "dragDrop") {
		private _source = MEMBER("source", nil) select 0;
		private _destination = MEMBER("destination", nil) select 0;
		private _scontainer = "";
		private _dcontainer = "";

		if (_source isEqualTo MEMBER("OOP_Listbox_Capacities", nil)) then {
			_scontainer = capcontainer;
		} else {
			_scontainer = proxcontainer;
		};

		if (_destination isEqualTo MEMBER("OOP_Listbox_Capacities", nil)) then {
			_dcontainer = capcontainer;
		} else {
			_dcontainer = proxcontainer;
		};

		private _index = (((_this select 4) select 0) select 1);
		private _item = ["getItem", _index] call _scontainer;
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
			_control lbAdd (_x select 0);
			_control lbSetPicture [_forEachIndex, (_x select 6)];
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
		private _control = _this select 0;
		private _index = _this select 1;
		if(_index >= ("countSize" call proxcontainer)) exitWith {};
		if(_index > -1) then {
			private _content = ("getContent" call proxcontainer) select _index;
			MEMBER("OOP_Listbox_Capacities",nil) lbSetCurSel -1;
			//"name", "description", "category", "price","weight", "owner", "life"
			//MEMBER("OOP_Text_Description", nil) ctrlSetStructuredText parseText format ["Type: %1 Weight: %2Kg <br/>Durability: %3%<br/>Description: %4<br/>", _content select 2,_content select 3,_content select 4,_content select 1];
			MEMBER("OOP_Text_Description", nil) ctrlSetStructuredText parseText format ["%1<br/>", _content select 1];
		};
	};

	/*
	*	onLBDragging:
	*		Drag & drop operation is in progress.
	*		Returns the control and the x and y coordinates.
	*/
	PUBLIC FUNCTION("array", "onLBDragging_OOP_Listbox_Proximity") {
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
		private _control = _this select 0;
		private _index = _this select 1;

	};

	/*
	*	onLBSelChanged:
	*		The selection in a listbox is changed. The left mouse button has been released and the new selection is fully made.
	*		Returns the control and the selected element index.
	*/
	PUBLIC FUNCTION("array", "onLBSelChanged_OOP_Listbox_Capacities") {
		private _control = _this select 0;
		private _index = _this select 1;
		if(_index >= ("countSize" call capcontainer)) exitWith {};
		if(_index > -1) then {
			private _content = ("getContent" call capcontainer) select _index;
			MEMBER("OOP_Listbox_Proximity",nil) lbSetCurSel -1;
			//"name", "description", "category", "price","weight", "owner", "life"
			MEMBER("OOP_Text_Description", nil) ctrlSetStructuredText parseText format ["%1<br/>", _content select 1];
			//MEMBER("OOP_Text_Description", nil) ctrlSetStructuredText parseText format ["Type: %1 Weight: %2Kg <br/>Durability: %3%<br/>Description: %4<br/>", _content select 2,_content select 3,_content select 4,_content select 1];
		};
	};

	/*
	*	onLBDrag:
	*		Drag & drop operation started.
	*		Returns the control and the selected element index.
	*/
	PUBLIC FUNCTION("array", "onLBDrag_OOP_Listbox_Capacities") {
		private _control = _this select 0;
		private _index = _this select 1;

	};

	/*
	*	onLBDragging:
	*		Drag & drop operation is in progress.
	*		Returns the control and the x and y coordinates.
	*/
	PUBLIC FUNCTION("array", "onLBDragging_OOP_Listbox_Capacities") {
		private _control = _this select 0;
		private _abs = _this select 1;
		private _ord = _this select 2;

	};

	PUBLIC FUNCTION("", "btnAction_OOP_btn_weapons") {
		player removeAllEventHandlers "InventoryOpened";
		player action ["Gear", player];
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
	PUBLIC FUNCTION("", "getOOP_btn_use") FUNC_GETVAR("OOP_btn_use");
	PUBLIC FUNCTION("", "getOOP_btn_weapons") FUNC_GETVAR("OOP_btn_weapons");
	PUBLIC FUNCTION("control", "setMainLayer"){ MEMBER("MainLayer", _this); };
	PUBLIC FUNCTION("control", "setOOP_Listbox_Capacities"){ MEMBER("OOP_Listbox_Capacities", _this); };
	PUBLIC FUNCTION("control", "setOOP_Listbox_Proximity"){ MEMBER("OOP_Listbox_Proximity", _this); };
	PUBLIC FUNCTION("control", "setOOP_MainLayer_100"){ MEMBER("OOP_MainLayer_100", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_Capacities"){ MEMBER("OOP_Text_Capacities", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_Description"){ MEMBER("OOP_Text_Description", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_Fond"){ MEMBER("OOP_Text_Fond", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_Inventory"){ MEMBER("OOP_Text_Inventory", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_proximity"){ MEMBER("OOP_Text_proximity", _this); };
	PUBLIC FUNCTION("control", "setOOP_btn_use"){ MEMBER("OOP_btn_use", _this); };
	PUBLIC FUNCTION("control", "setOOP_btn_weapons"){ MEMBER("OOP_btn_weapons", _this); };
	PUBLIC FUNCTION("display", "setDisplay"){ MEMBER("Display", _this); };
	
	PUBLIC FUNCTION("", "deconstructor"){
		"save" call proxcontainer;
		"save" call capcontainer;
		private _size = "countSize" call proxcontainer;
		if (_size isEqualTo 0) then {
			if(("getModel" call proxcontainer) isEqualTo "box_uav_06_f.p3d") then {
				deleteVehicle (objectFromNetId ("getNetId" call proxcontainer));
				systemChat "delete box";
			};
		};
		["delete", capcontainer] call OO_CONTAINER;
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
		DELETE_UI_VARIABLE("OOP_btn_use");
		DELETE_UI_VARIABLE("OOP_btn_weapons");
		DELETE_UI_VARIABLE("Display");
		DELETE_VARIABLE("source");
		DELETE_VARIABLE("destination");
	};
ENDCLASS;
