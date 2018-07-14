/**
*  fn_hit
*
*  Event handler for unit hit.
*
*  Domain: Event
**/

if (isServer) then {
    _unit = _this select 0;
    _dmg = _this select 2;
    _instigator = _this select 3;
    if (isPlayer _instigator) then {
        [_instigator, SCORE_HIT + (SCORE_DAMAGE_BASE * _dmg)] call killPoints_fnc_add;
    } else {
        if (side _instigator == west) then {
            _allHCs = entities "HeadlessClient_F";
            _allHPs = allPlayers - _allHCs;
            _score_split = floor ((SCORE_HIT + (SCORE_DAMAGE_BASE * _dmg)) * SCORE_SPLIT_FACTOR / (count _allHPs));
            {
                [_x, _score_split] call killPoints_fnc_add;
            }forEach _allHPs;
        };
    };
};
