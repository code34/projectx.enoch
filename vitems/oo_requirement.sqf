	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2018 Nicolas BOITEUX

	CLASS OO_REQUIREMENT

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	#include "oop.h"

	CLASS("OO_REQUIREMENT")
		PRIVATE VARIABLE("code","this");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_REQUIREMENT::constructor")
		};

		PUBLIC FUNCTION("array", "checkStuffRequirement") {
			DEBUG(#, "OO_REQUIREMENT::checkRequirement")
			private _content = "getContent" call capcontainer;
			private _list = [];
			private _requirement = _this;
			private _result = [];

			{_list pushBack (_x select 0);} foreach _content;

			{
				private _searchindex = _list find _x;
				if(_searchindex > -1) then {
					_content deleteAt _searchindex;
					_result pushBack [_x,1];
				}else{
					_result pushBack [_x, -1];
				};
			} foreach _requirement;
			_result;
		};

		PUBLIC FUNCTION("", "checkKnowledgeRequirement") {
			true;
		};


		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_REQUIREMENT::deconstructor")
			DELETE_VARIABLE("this");
		};
	ENDCLASS;