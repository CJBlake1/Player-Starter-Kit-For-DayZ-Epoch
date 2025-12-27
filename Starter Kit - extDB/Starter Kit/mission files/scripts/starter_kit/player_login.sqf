	disableSerialization;
	
		waitUntil {uiSleep 1; !isNil ("Dayz_loginCompleted")};
		waitUntil {uiSleep 2; !isNull findDisplay 46};


		PVDZE_queryStartKit = [player,name player];
		publicVariableServer "PVDZE_queryStartKit";
		waitUntil {!isNil "PVDZE_queryStartKitResult"};
		if (PVDZE_queryStartKitResult==0) then {
			player_start_kit =true;
			systemChat format["Welcome %1, You can claim a start kit by r/clicking your Smartphone",name player];
		} else {
			player_start_kit =false;
		};
		
/*		
//Brighter colours.

		p_hndl = ppEffectCreate ["colorCorrections", 1501]; 	
		p_hndl ppEffectEnable true;  	
		p_hndl ppEffectAdjust [ 1, 1, 0, [0.2, 0.2, 0.2, 0.0],[1.2, 1.0, 0.6, 1.40],[0.1, 0.59, 0.21, 0.0]];  	
		p_hndl ppEffectCommit 0; 		
*/		