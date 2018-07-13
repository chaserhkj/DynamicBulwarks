/**
*  bulwark/purchase
*
*  Actor for the "Purchase building" dialog button
*
*  Domain: Client
**/

_index = lbCurSel 1503;

_shopPrice = (BULWARK_VEHICLES select _index) select 0;
_shopName  = (BULWARK_VEHICLES select _index) select 1;
_shopClass = (BULWARK_VEHICLES select _index) select 2;

// Script was passed an invalid number
if(_shopClass == "") exitWith {};

if(player getVariable "killPoints" >= _shopPrice) then {
    [player, _shopPrice] remoteExec ["killPoints_fnc_spend", 2];

    sleep 0.1;
    placeActID = ShopCaller addAction [format ["<t color='#00ffff'>Place %1</t>", _shopName], "build\placeVehicle.sqf", _shopClass];
    [format ["<t size='0.6' color='#00ffff'>%1 purchased</t>", _shopName], -0, -0.02, 0.2] call BIS_fnc_dynamicText;
} else {
    [format ["<t size='0.6' color='#ff3300'>Not enough points for %1!</t>", _shopName], -0, -0.02, 0.2] call BIS_fnc_dynamicText;
};
