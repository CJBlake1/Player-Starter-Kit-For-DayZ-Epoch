private ["_claim","_player","_playerID","_clientID","_able","_result","_return","_class","_price","_type","_query1","_query2","_query","_key","_playername","_playerUID"];

_player = _this select 0;
_playername = _this select 1;
_claim = _this select 2;
_clientID = owner _player;
_playerUID = getPlayerUID _player;

diag_log format["Start Kit : Player %2 - [%1] HAS JUST CLAIMED THEIR STARTER CRATE!",_playerUID,_playername];

_query = format["INSERT INTO startkit (PlayerUID, Name, Claimed, CharacterID) VALUES ('%1', '%2', '%3', '%1')",_playerUID,_playername,_claim];

_result = [_query, 1, true] call fn_async;

//waitUntil{!isNil "_result"};

PVDZE_ClaimStartKitResult = 1;
	
if(!isNull _player) then {
	_clientID publicVariableClient "PVDZE_ClaimStartKitResult";
};


