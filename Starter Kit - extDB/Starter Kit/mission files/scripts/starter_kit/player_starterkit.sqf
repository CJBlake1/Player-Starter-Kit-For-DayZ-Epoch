

private ["_titleColour","_titleCancelColour","_CancelTimeout","_ctPlyrPos","_done","_ctTL","_ctExitW","_warning","_display","_ctWMsg","_msg"];
	disableSerialization;
			
	if (!player_start_kit) exitWith {			systemChat "You've already claimed a starter kit."; };
	
	if (vehicle player != player) exitWith {
			systemChat "You are not allow to do this while in a vehicle!";
		};
		if !(count (nearestObjects [player, (DZE_maintainClasses), 10]) == 0) exitWith {
			_msg = 'You must be in a clear open area to claim a starter kit!';
			systemChat format["CAR]: %1",_msg]; //systemChat format["CAR]: %1",_msg];
		};
			
	_startercrate = {
		
		PVDZE_ClaimStartKit = [player,name player,1];
		publicVariableServer "PVDZE_ClaimStartKit";
		waitUntil {!isNil "PVDZE_ClaimStartKitResult"};
		profileNameSpace setVariable ['chx_start',true];

	private ["_crateType","_crateWpns","_crateMags","_crateBags","_spawnCrate","_pos","_dir"];
		_crateType = "USOrdnanceBox";
		_crateWpns = [
		["ItemEtool",1],["ItemToolbox",1]
		];
		_crateMags = [
		["plot_pole_kit",1],["ItemComboLock",2],["ItemVault",1],["ItemPole",3],["helipad_civil_kit",1],
		["Half_Cinder_wall_kit",6],["cinder_door_kit",2],["metal_floor_kit",4],
		["MortarBucket",6],["CinderBlocks",24],["workbench_kit",1]
		];
		_crateBags = [["DZ_Backpack_EP1",1]];
		_dir = getdir player;
		_pos = getposATL player;
		_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];
		_spawnCrate = createVehicle [_crateType, _pos, [], 0, "CAN_COLLIDE"];
		_spawnCrate setDir _dir;
		_spawnCrate setposATL _pos;
		clearWeaponCargoGlobal _spawnCrate;
		clearMagazineCargoGlobal _spawnCrate;
		clearBackpackCargoGlobal _spawnCrate;
		{_spawnCrate addWeaponCargoGlobal _x;}forEach _crateWpns;
		{_spawnCrate addMagazineCargoGlobal _x;}forEach _crateMags;
		{_spawnCrate addBackpackCargoGlobal _x;}forEach _crateBags;
		systemChat "Crate will delete if you move more than 300m!";
		systemChat "If you loose your crate you will not be refunded!";
		systemChat "Crate will delete if you move more than 300m!";
		systemChat "If you loose your crate you will not be refunded!";

		player_start_kit =false;
		uisleep 1;
		waitUntil {(player distance _spawnCrate) > 300};
		deleteVehicle _spawnCrate;
	};
			_titleColour = [(153/255),(204/255),0,1];		
			_titleCancelColour  = [1,(68/255),(68/255),1];
			_CancelTimeout = 5;
			_ctExitW = "nil"; 
			_done     = false;
			_ctPlyrPos = position player;
			_ctTL = _CancelTimeout;
			_ctWMsg  = "Spawning crate in %1 seconds. Move to cancel!";
			_display = findDisplay 106;
		if(!(isNull _display)) then {_display closeDisplay 0;	};
		if(_ctTL > 0) then {
				taskHint [format[_ctWMsg,_ctTL], _titleCancelColour, "taskNew"];
			};
		while{!_done} do {
			if(_ctTL > 0) then {
				cutText [format[_ctWMsg,_ctTL], "PLAIN DOWN"];
				sleep 1;
				_ctTL = _ctTL - 1;    };
		if((player distance _ctPlyrPos) > 1) exitWith {_ctExitW = "Start Crate Cancelled!";    };	
			_done = _ctTL <= 0;	
		};
		if (_ctExitW == "nil") then {_ctExitW = "Start Crate Spawned!";
			call _startercrate;
			cutText["","PLAIN DOWN"];	
		} else {
			taskHint[_ctExitW, _titleCancelColour, "taskFailed"];
			cutText[_ctExitW,"PLAIN DOWN"];	
		};
