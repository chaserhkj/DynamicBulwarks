//params ["_buildObject", "_player", "_actionId", "_arguments"];
_buildObject = _this select 0; // is actually player because action was added to player not the object they are carrying
_player = _this select 1;
_actionID = _this select 2;
_vehiClass = _this select 3;

shopVehic = _vehiClass createVehicle (_player getPos [10, direction _player]); 

// If it's a container, make sure it's empty
clearItemCargoGlobal shopVehic;
clearWeaponCargoGlobal shopVehic;
clearMagazineCargoGlobal shopVehic;
clearBackpackCargoGlobal shopVehic;

mainZeus addCuratorEditableObjects [[shopVehic], true];


_player removeAction _actionId; // dropActID may need to be _player

[shopVehic, ["<t color='#ff0000'>" + "Remove Object", "deleteVehicle (_this select 0)","",1,false,false,"true","true",5]] remoteExec ["addAction", 0];
