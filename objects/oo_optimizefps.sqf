    /*
    Author: code34 nicolas_boiteux@yahoo.fr
    Copyright (C) 2020 Nicolas BOITEUX

    CLASS OO_OPTIMIZEFPS

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

	CLASS("OO_OPTIMIZEFPS")
		PRIVATE VARIABLE("code","this");
		PRIVATE VARIABLE("string","path");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_OPTIMIZEFPS::constructor")
			SPAWN_MEMBER("checkVisible", nil);
		};

		PUBLIC FUNCTION("","checkVisible") {
			DEBUG(#, "OO_OPTIMIZEFPS::checkVisible")
			private _visible = true;
			private _count = 0;
			private _viewdistance = 300;
			private _list = nearestObjects [player, [], 12000];
			sleep 1;
			{_x hideObject true;true;}count _list;

			while { true } do {
				private _list = nearestObjects [player, [], 800];
				sleep 2;
				{
					if(player distance _x > _viewdistance) then {
						_x hideObject true;
					} else {
						_x hideObject false;
					};
					true;
				} count _list;
			};
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_OPTIMIZEFPS::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("path");
		};
	ENDCLASS;