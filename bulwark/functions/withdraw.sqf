//params ["_target", "_caller", "_actionId", "_arguments"];
_bulwark = _this select 0;
_player = _this select 1;

_shopPrice = 1000;

_deposit = _bulwark getVariable "BankDeposit";

if(_deposit >= _shopPrice) then {
    [_player, _shopPrice] remoteExec ["killPoints_fnc_add", 2];
    _deposit = _bulwark getVariable "BankDeposit";
    _deposit = _deposit - _shopPrice;
    _bulwark setVariable ["BankDeposit", _deposit, true];
} else {
    [format ["<t size='0.6' color='#ff3300'>Minimum withdraw value is %1!</t>", _shopPrice], -0, -0.02, 0.2] remoteExec ["BIS_fnc_dynamicText", _player];
};
