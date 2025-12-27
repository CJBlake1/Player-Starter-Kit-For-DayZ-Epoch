private ["_player","_clientID","_playerUID","_query","_result","_total","_query1","_claim"];

_player = _this select 0;
_playername = _this select 1;
_clientID = owner _player;
_playerUID = getPlayerUID _player;
	
_query = format["SELECT Claimed FROM startkit WHERE PlayerUID ='%1'",_playerUID];
_result = [_query, 2, true] call fn_async;

waitUntil{!isNil "_result"};

diag_log format ["%1",_result];

if (count _result == 0) then {
	PVDZE_queryStartKitResult = 0;
	diag_log format["Start Kit : Player %2 - [%1] has not yet claimed their starter crate!",_playerUID,_playername];
} else {
	PVDZE_queryStartKitResult = 1;
	diag_log format["Start Kit : Player %2 - [%1] has already claimed their starter crate!",_playerUID,_playername];
};

	
if(!isNull _player) then {
	_clientID publicVariableClient "PVDZE_queryStartKitResult";
};


