	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2018 Nicolas BOITEUX

	CLASS OO_HEALTHRESUME

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
	#undef DEBUGHEALTHRESUME

	CLASS("OO_HEALTHRESUME")
		PRIVATE VARIABLE("code","this");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_HEALTHRESUME::constructor")

		};

		PUBLIC FUNCTION("","resume") { 
			DEBUG(#, "OO_HEALTHRESUME::resume")
			private _result = "<img image='paa\caduceus.paa'/><t size='1.2'>Medical Statement</t><br/>";
			_result = _result + "<br/>" +  MEMBER("resumeLife", nil);
			_result = _result + "<br/>" +  MEMBER("resumeInjury", nil);
			_result = _result + "<br/>" +  MEMBER("resumeTemperature", nil);
			_result = _result + "<br/>" +  MEMBER("resumeFood", nil);
			_result = _result +  MEMBER("resumeBonusFood", nil);
			_result = _result + "<br/>" +  MEMBER("resumeDrink", nil);
			_result = _result +  MEMBER("resumeBonusDrink", nil);
			_result = _result + "<br/>" +  MEMBER("resumeNausea", nil);
			_result = _result + "<br/>" +  MEMBER("resumeVirus", nil);
			_result = _result + "<br/>" +  MEMBER("resumeZombie", nil);
			parseText _result;
		};


		PUBLIC FUNCTION("", "resumeNausea") {
			private _nausea = "getNausea" call health;
			private _result = "";
			#ifdef DEBUGHEALTHRESUME
			systemChat format ["Nausea: %1", _nausea];
			#endif
			switch (true) do {
				case (_nausea > 15) : {
					_result = localize "Str_nauseaintense";
				};
				case (_nausea > 10) : {
					_result = localize "Str_nauseaforte";
				};
				case (_nausea > 0) : {
					_result = localize "Str_nauseasimple";
				};
				default{
					_result = localize "Str_nonausea";
				};
			};
			 _result;
		};

		PUBLIC FUNCTION("", "resumeVirus") {
			private _virus = "getVirus" call health;
			private _result = "";
			#ifdef DEBUGHEALTHRESUME
			systemChat format ["Virus: %1", _virus];
			#endif
			switch (true) do {
				case (_virus > 15) : {
					_result = localize "Str_septicemie";
				};
				case (_virus > 10) : {
					_result = localize "Str_biginfection";
				};
				case (_virus > 0) : {
					_result = localize "Str_smallinfection";
				};
				default{
					_result = localize "Str_noinfection";
				};
			};
			 _result;
		};


		PUBLIC FUNCTION("", "resumeZombie") {
			private _zombie = "getZombie" call health;
			private _result = "";
			#ifdef DEBUGHEALTHRESUME
			systemChat format ["Zombie infection : %1", _zombie];
			#endif
			switch (true) do {
				case (_zombie > 60) : {
					_result = localize "Str_becomezombie";
				};
				case (_zombie > 40) : {
					_result = localize "Str_havevision"
				};
				case (_zombie > 0) : {
					_result = localize "Str_feelweird";
				};
				default{
					_result = localize "Str_feelnormal";
				};
			};
			 _result;
		};
		
		PUBLIC FUNCTION("", "resumeBonusFood") {
			private _food = "getBonusFood" call health;
			private _result = "";
			#ifdef DEBUGHEALTHRESUME
			systemChat format ["Bonus food: %1", _food];
			#endif
			switch (true) do {
				case (_food > 60) : {
					_result = localize "Str_eattoomuch";
				};
				case (_food > 40) : {
					_result = localize "Str_eatwell";
				};
				case (_food > 0) : {
					_result = localize "Str_eatabit";
				};
				default{
					_result = localize "Str_noteat";
				};
			};
			 _result;
		};

		PUBLIC FUNCTION("", "resumeBonusDrink") {
			private _drink = "getBonusDrink" call health;
			private _result = "";
			#ifdef DEBUGHEALTHRESUME
			systemChat format ["Bonus drink: %1", _drink];
			#endif
			switch (true) do {
				case (_drink > 60) : {
					_result = localize "Str_drinktoomuch";
				};
				case (_drink > 40) : {
					_result = localize "Str_drinkwell";
				};
				case (_drink > 0) : {
					_result = localize "Str_drinkalittle";
				};
				default{
					_result = localize "Str_notdrink";
				};
			};
			 _result;
		};

		PUBLIC FUNCTION("", "resumeDrink") {
			private _drink = "getDrink" call health;
			private _result = "";
			#ifdef DEBUGHEALTHRESUME
			systemChat format ["Drink: %1", _drink];
			#endif
			switch (true) do {
				case (_drink > 60) : {
					_result = localize "Str_deshydrate";
				};
				case (_drink > 40) : {
					_result = localize "Str_slightydeshydrate";
				};
				case (_drink > 20) : {
					_result = localize "Str_underdeshydrate";
				};
				default{
					_result = localize "Str_totalydeshydrate";
				};
			};
			 _result;
		};

		PUBLIC FUNCTION("", "resumeFood") {
			private _food = "getFood" call health;
			private _result = "";
			#ifdef DEBUGHEALTHRESUME
			systemChat format ["Food: %1", _food];
			#endif
			switch (true) do {
				case (_food > 60) : {
					_result = localize "Str_wellfed";
				};
				case (_food > 40) : {
					_result = localize "Str_milddeficiences";
				};
				case (_food > 20) : {
					_result = localize "Str_severeanemia";
				};
				default{
					_result = localize "Str_extremeanemia";
				};
			};
			_result;
		};

		PUBLIC FUNCTION("", "resumeTemperature") {
			DEBUG(#, "OO_HEALTHRESUME::resumeTemperature")
			private _temperature = ("getTemperature" call health) - 37;
			private _result = "";
			#ifdef DEBUGHEALTHRESUME
			systemChat format ["Temperature: %1", _temperature];
			#endif
			switch (true) do {
				case (_temperature > 2) : {
					_result = localize "Str_terriblefever";
				};
				case (_temperature > 1) : {
					_result = localize "Str_havetemperature";
				};
				case (_temperature > -1 ) : {
					_result = localize "Str_notemperature";
				};
				case (_temperature > -2) : {
					_result = localize "Str_temperaturelow";
				};
				case (_temperature < -2) : {
					_result = localize "Str_hypothermie";
				};
				default {_result = "None";};
			};	
			_result;
		};

		PUBLIC FUNCTION("", "resumeInjury") {
			DEBUG(#, "OO_HEALTHRESUME::resumeInjury")
			private _injury = 100 - (getDammage player * 100);
			private _result = "";
			#ifdef DEBUGHEALTHRESUME
			systemChat format ["Injury: %1", _injury];
			#endif
			switch (true) do {
				case (_injury > 95) : {
					_result = localize "Str_noinjuries";
				};
				case (_injury > 75) : {
					_result = localize "Str_minorinjuries";
				};
				case (_injury > 50) : {
					_result = localize "Str_majorinjuries";
				};
				default{
					_result = localize "Str_criticalinjuries";
				};
			};
			 _result;
		};

		PUBLIC FUNCTION("", "resumeLife") {
			private _life = "getLife" call health;
			private _result = "";
			#ifdef DEBUGHEALTHRESUME
			systemChat format ["Life: %1", _life];
			#endif
			switch (true) do {
				case (_life > 90) : {
					_result = localize "Str_excellenthealth";
				};
				case (_life > 70) : {
					_result = localize "Str_goodhealth";
				};
				case (_life > 50) : {
					_result = localize "Str_fragilehealth";
				};
				case (_life > 25) : {
					_result = localize "Str_badhealth";
				};
				case (_life > 0) : {
					_result = localize "Str_verybadhealth";
				};
				default{
					_result = localize "Str_dead";
				};
			};
			_result;
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_HEALTHRESUME::deconstructor")
			DELETE_VARIABLE("this");
		};
	ENDCLASS;