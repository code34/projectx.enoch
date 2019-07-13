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

	CLASS("OO_HEALTHRESUME")
		PRIVATE VARIABLE("code","this");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_HEALTHRESUME::constructor")

		};

		PUBLIC FUNCTION("","resume") { 
			DEBUG(#, "OO_HEALTHRESUME::resume")
			private _result = "<t size='1.2'>Medical Statement</t>";
			_result = _result + "<br/>" +  MEMBER("resumeLife", nil);
			_result = _result + "<br/>" +  MEMBER("resumeInjury", nil);
			_result = _result + "<br/>" +  MEMBER("resumeTemperature", nil);
			_result = _result + "<br/>" +  MEMBER("resumeFood", nil);
			_result = _result +  MEMBER("resumeBonusFood", nil);
			_result = _result + "<br/>" +  MEMBER("resumeDrink", nil);
			_result = _result +  MEMBER("resumeBonusDrink", nil);
			_result = _result + "<br/>" +  MEMBER("resumeNausea", nil);
			parseText _result;
		};


		PUBLIC FUNCTION("", "resumeNausea") {
			private _nausea = "getNausea" call health;
			private _result = "";
			
			switch (true) do {
				case (_nausea > 15) : {
					_result = "Votre nausée est intense";
				};
				case (_nausea > 10) : {
					_result ="Votre nausée est forte";
				};
				case (_nausea > 0) : {
					_result ="Votre nausée est faible";
				};
				default{
					_result ="Vous n'avez pas de nausée.";
				};
			};
			 _result;
		};
		
		PUBLIC FUNCTION("", "resumeBonusFood") {
			private _food = "getBonusFood" call health;
			private _result = "";

			//systemChat format ["food: %1", _food];
			
			switch (true) do {
				case (_food > 70) : {
					_result = "votre estomac est tres lourd";
				};
				case (_food > 50) : {
					_result ="votre estomac est rempli";
				};
				case (_food > 0) : {
					_result ="votre estomac est un peu rempli";
				};
				default{
					_result ="votre estomac est vide.";
				};
			};
			 _result;
		};

		PUBLIC FUNCTION("", "resumeBonusDrink") {
			private _drink = "getBonusDrink" call health;
			private _result = "";

			//systemChat format ["drink: %1", _drink];
			
			switch (true) do {
				case (_drink > 70) : {
					_result = "vous avez trop bu.";
				};
				case (_drink > 50) : {
					_result ="vous avez bien bu.";
				};
				case (_drink > 0) : {
					_result ="vous avez bu un petit peu.";
				};
				default{
					_result ="vous n'avez pas bu.";
				};
			};
			 _result;
		};

		PUBLIC FUNCTION("", "resumeDrink") {
			private _drink = "getDrink" call health;
			private _result = "";
			
			switch (true) do {
				case (_drink > 70) : {
					_result = "Vous n'avez pas soif et ";
				};
				case (_drink > 50) : {
					_result ="Vous commencez à avoir soif et ";
				};
				case (_drink > 25) : {
					_result ="Vous avez très soif et ";
				};
				default{
					_result ="Vous êtes mort de soif et ";
				};
			};
			 _result;
		};

		PUBLIC FUNCTION("", "resumeFood") {
			private _food = "getFood" call health;
			private _result = "";
			
			switch (true) do {
				case (_food > 70) : {
					_result = "Vous n'avez pas faim et ";
				};
				case (_food > 50) : {
					_result ="Vous commencez à avoir faim et ";
				};
				case (_food > 25) : {
					_result ="Vous avez très faim et ";
				};
				default{
					_result ="Vous êtes affamé et ";
				};
			};
			 _result;
		};

		PUBLIC FUNCTION("", "resumeTemperature") {
			DEBUG(#, "OO_HEALTHRESUME::resumeTemperature")
			private _temperature = ("getTemperature" call health) - 37;
			private _result = "";
			
			switch (true) do {
				case (_temperature > 2) : {
					_result = "Vous avez une fievre terrible.";
				};
				case (_temperature > 1) : {
					_result ="Vous avez de la temperature.";
				};
				case (_temperature > -1 ) : {
					_result ="Vous n'avez pas de temperature.";
				};
				case (_temperature > -2) : {
					_result ="Votre temperature est basse.";
				};
				case (_temperature < -2) : {
					_result ="Vous etes en hypothermie";
				};
				default {_result = "None";};
			};	
			_result;
		};

		PUBLIC FUNCTION("", "resumeInjury") {
			DEBUG(#, "OO_HEALTHRESUME::resumeInjury")
			private _injury = 100 - (getDammage player * 100);
			private _result = "";
			
			switch (true) do {
				case (_injury > 95) : {
					_result = "Vous n'avez aucune blessure.";
				};
				case (_injury > 75) : {
					_result ="Vous avez quelques blessures mineures.";
				};
				case (_injury > 50) : {
					_result ="Vous avez des blessures majeures.";
				};
				default{
					_result ="Vos blessures sont critiques.";
				};
			};
			 _result;
		};

		PUBLIC FUNCTION("", "resumeLife") {
			private _life = "getLife" call health;
			private _result = "";
			
			switch (true) do {
				case (_life > 70) : {
					_result = "Vous êtes en bonne santé.";
				};
				case (_life > 50) : {
					_result ="Votre santé n'est pas très bonne.";
				};
				case (_life > 25) : {
					_result ="Votre santé est très mauvaise.";
				};
				case (_life > 0) : {
					_result ="Votre santé est très mauvaise.";
				};
				default{
					_result ="Vous êtes mort.";
				};
			};
			_result;
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_HEALTHRESUME::deconstructor")
			DELETE_VARIABLE("this");
		};
	ENDCLASS;