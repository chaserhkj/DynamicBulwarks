/**
*  fn_killed
*
*  Event handler for unit death.
*
*  Domain: Event
**/

if (isServer) then {
    _instigator = _this select 2;
    if (isPlayer _instigator) then {
        [_instigator, SCORE_KILL] call killPoints_fnc_add;
    } else {
        if (side _instigator == west) then {
            _allHCs = entities "HeadlessClient_F";
            _allHPs = allPlayers - _allHCs;
            _score_split = floor (SCORE_KILL * SCORE_SPLIT_FACTOR / (count _allHPs));
            {
                [_x, _score_split] call killPoints_fnc_add;
            }forEach _allHPs;
        };
    };
};
