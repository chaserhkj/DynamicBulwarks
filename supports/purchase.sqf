/**
*  supports/purchase
*
*  Actor for the "Purchase support" dialog button
*
*  Domain: Client
**/

_index = lbCurSel 1501;
shopVehic = objNull;

_shopItem = BULWARK_SUPPORTITEMS select _index;
_shopPrice = (_shopItem) select 0;
_shopName  = (_shopItem) select 1;
_shopClass = (_shopItem) select 2;

// Script was passed an invalid number
if(_shopClass == "") exitWith {};

if(player getVariable "killPoints" >= _shopPrice) then {
    [player, _shopPrice] remoteExec ["killPoints_fnc_spend", 2];
	if (_shopName == "Fill Ammo") then {
		_ammoPlayer = player;
		_pWeap = primaryWeapon _ammoPlayer;
		if (_pWeap != "") then {
		  _ammoArray = getArray (configFile >> "CfgWeapons" >> _pWeap >> "magazines");
		  _ammoToAdd = selectRandom _ammoArray;
		  _ammoPlayer addMagazines [_ammoToAdd, 3];
		};
		_sWeap = secondaryWeapon _ammoPlayer;
		if (_sWeap != "") then {
		  _ammoArray = getArray (configFile >> "CfgWeapons" >> _sWeap >> "magazines");
		  _ammoToAdd = selectRandom _ammoArray;
		  _ammoPlayer addMagazines [_ammoToAdd, 3];
		};
		_hWeap = handgunWeapon _ammoPlayer;
		if (_hWeap != "") then {
		  _ammoArray = getArray (configFile >> "CfgWeapons" >> _hWeap >> "magazines");
		  _ammoToAdd = selectRandom _ammoArray;
		  _ammoPlayer addMagazines [_ammoToAdd, 3];
		};
	} else {
		if (_shopName == "Medikit") then {
			player addItem "Medikit";
		} else {
			[player, _shopClass] call BIS_fnc_addCommMenuItem;
		};
	};
} else {
    [format ["<t size='0.6' color='#ff3300'>Not enough points for %1!</t>", _shopName], -0, -0.02, 0.2] call BIS_fnc_dynamicText;
    objPurchase = false;
};
