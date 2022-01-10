#include "script_component.hpp"
/*
 * Author: johnb43
 * onLoad function for drone info dialog.
 *
 * Arguments:
 * 0: Display
 *
 * Return Value:
 * None
 *
 * Example:
 * call drone_info_main_fnc_onLoadDialog;
 *
 * Public: No
 */

// Set main control
SETUVAR(GVAR(droneInfo),_this);

// Filter out which stats should be shown
private _actuallyShow = [];

{
    if (_x select 0) then {
        _actuallyShow pushBack _x;
    } else {
        (_this displayCtrl (_x select 1)) ctrlShow false;
    };
} forEach [[GVAR(showName), IDC_DRONENAME], [GVAR(showFuel), IDC_DRONEFUEL], [GVAR(showSpeed), IDC_DRONESPEED], [GVAR(showAltitude), IDC_DRONEALT], [GVAR(showDirection), IDC_DRONEDIR], [GVAR(showPosition), IDC_DRONEPOS], [GVAR(showAmmo), IDC_DRONEAMMO]];

private _num = count _actuallyShow;

// If nothing should be shown, exit
if (_num isEqualTo 0) exitWith {};

private _posX = DISPLAY_XPOS;
private _posY = DISPLAY_YPOS;

(_this displayCtrl IDC_BACKGROUND) ctrlSetPosition [_posX, _posY, POS_W(5.5), POS_H(0.75) * _num];
(_this displayCtrl IDC_BACKGROUND) ctrlCommit 0;

// Set controls in right positions
private _ctrl = controlNull;

{
    _ctrl = _this displayCtrl (_x select 1);
    _ctrl ctrlSetPosition [_posX, _posY + POS_H(0.75) * _forEachIndex];
    _ctrl ctrlCommit 0;
} forEach _actuallyShow;
