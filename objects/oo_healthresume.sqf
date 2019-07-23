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
			private _result = "<t size='1.2'>Medical Statement</t><br/>";
			_result = _result + "<br/>" +  MEMBER("resumeLife", nil);
			_result = _result + "<br/>" +  MEMBER("resumeInjury", nil);
			_result = _result + "<br/>" +  MEMBER("resumeTemperature", nil);
			_result = _result + "<br/>" +  MEMBER("resumeFood", nil);
			_result = _result +  MEMBER("resumeBonusFood", nil);
			_result = _result + "<br/>" +  MEMBER("resumeDrink", nil);
			_result = _result +  MEMBER("resumeBonusDrink", nil);
			_result = _result + "<br/>" +  MEMBER("resumeNausea", nil);
			_result = _result + "<br/>" +  MEMBER("resumeZombie", nil);
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
					_result ="Vous avez la nausée";
				};
				default{
					_result ="Vous n'avez pas de nausée.";
				};
			};
			 _result;
		};

		PUBLIC FUNCTION("", "resumeZombie") {
			private _zombie = "getZombie" call health;
			private _result = "";
		
			switch (true) do {
				case (_zombie > 60) : {
					_result = "Vous ne vous vous sentez plus vous même.";
				};
				case (_zombie > 40) : {
					_result ="Vous avez des visions.";
				};
				case (_zombie > 0) : {
					_result ="Vous vous sentez bizarre.";
				};
				default{
					_result ="Vous vous sentez normal.";
				};
			};
			 _result;
		};
		
		PUBLIC FUNCTION("", "resumeBonusFood") {
			private _food = "getBonusFood" call health;
			private _result = "";

			//systemChat format ["food: %1", _food];
			
			switch (true) do {
				case (_food > 60) : {
					_result = "vous avez trop mangé.";
				};
				case (_food > 40) : {
					_result ="vous avez bien mangé.";
				};
				case (_food > 0) : {
					_result ="vous avez mangé un peu.";
				};
				default{
					_result ="vous n'avez pas mangé.";
				};
			};
			 _result;
		};

		PUBLIC FUNCTION("", "resumeBonusDrink") {
			private _drink = "getBonusDrink" call health;
			private _result = "";

			//systemChat format ["drink: %1", _drink];
			
			switch (true) do {
				case (_drink > 60) : {
					_result = "vous avez trop bu.";
				};
				case (_drink > 40) : {
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
				case (_drink > 60) : {
					_result = "Votre corps est hydraté et ";
				};
				case (_drink > 40) : {
					_result ="Votre corps est légèrement déshydraté et ";
				};
				case (_drink > 20) : {
					_result ="Votre corps est déshydraté et ";
				};
				default{
					_result ="Votre corps est complètement déshydraté et ";
				};
			};
			 _result;
		};

		PUBLIC FUNCTION("", "resumeFood") {
			private _food = "getFood" call health;
			private _result = "";
			
			switch (true) do {
				case (_food > 60) : {
					_result = "Vous êtes bien nourri et ";
				};
				case (_food > 40) : {
					_result ="Vous avez de légères carrences et ";
				};
				case (_food > 20) : {
					_result ="Vous souffrez d'une anémie sévère et ";
				};
				default{
					_result ="Vous souffrez d'une anémie extrême et ";
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
				case (_life > 90) : {
					_result = "Votre santé est excellente.";
				};
				case (_life > 70) : {
					_result ="Votre santé est bonne.";
				};
				case (_life > 50) : {
					_result ="Votre santé est fragile.";
				};
				case (_life > 25) : {
					_result ="Votre santé est mauvaise.";
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