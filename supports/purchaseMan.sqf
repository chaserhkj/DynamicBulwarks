/**
*  bulwark/purchase
*
*  Actor for the "Purchase man" dialog button
*
*  Domain: Client
**/

_index = lbCurSel 1502;
shopMan = objNull;

_shopPrice = (BULWARK_MANPOWER select _index) select 0;
_shopName  = (BULWARK_MANPOWER select _index) select 1;
_shopClass = (BULWARK_MANPOWER select _index) select 2;

// Script was passed an invalid number
if(_shopClass == "") exitWith {};

if(player getVariable "killPoints" >= _shopPrice) then {
    [player, _shopPrice] remoteExec ["killPoints_fnc_spend", 2];

    coreGroup = group player;
    [group player, player] remoteExec ["selectLeader", groupOwner group player];
    _unit = coreGroup createUnit [_shopClass, coreGroup, [], 1, "FORM"];
    mainZeus addCuratorEditableObjects [[_unit], true];
    sleep 0.3;
    waitUntil {!isNull _unit};
    _unit setSkill ["aimingAccuracy", 0.8];
    _unit setSkill ["aimingSpeed", 0.7];
    _unit setSkill ["aimingShake", 0.8];
    _unit setSkill ["spotTime", 1];
    _unit addEventHandler ["Killed", {
    _self = _this select 0;
    removeVest _self;
    removeBackpack _self;
    removeAllWeapons _self:
    removeAllAssignedItems _self;
    }];
} else {
    [format ["<t size='0.6' color='#ff3300'>Not enough points for %1!</t>", _shopName], -0, -0.02, 0.2] call BIS_fnc_dynamicText;
};
