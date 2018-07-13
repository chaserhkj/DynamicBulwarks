//params ["_buildObject", "_player", "_actionId", "_arguments"];
_buildObject = _this select 0; // is actually player because action was added to player not the object they are carrying
_player = _this select 1;
_actionID = _this select 2;


detach shopVehic;
{[shopVehic, _x] remoteExec ["enableCollisionWith", 0];} forEach playableUnits;
_player removeAction _actionId; // dropActID may need to be _player
shopVehic setVehiclePosition [shopVehic, [], 0, "CAN_COLLIDE"];

[shopVehic, ["<t color='#ff0000'>" + "Remove Object", "deleteVehicle (_this select 0)","",1,false,false,"true","true",5]] remoteExec ["addAction", 0];
