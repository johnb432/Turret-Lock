#include "script_component.hpp"

// Get a rsc layer from the BI system
GVAR(droneInfoRscLayer) = [QGVAR(layer)] call BIS_fnc_rscLayer;

GVAR(isOpen) = false;

// Move old data to new position name; To be deleted after a while
if (!isNil {GETPRVAR(GVAR(displayPosX),nil)}) then {
    private _posX = GETPRVAR(GVAR(displayPosX),nil);
    SETPRVAR(igui_grid_drone_info_x,_posX);
    SETPRVAR(GVAR(displayPosX),nil);
};

if (!isNil {GETPRVAR(GVAR(displayPosY),nil)}) then {
    private _posY = GETPRVAR(GVAR(displayPosY),nil);
    SETPRVAR(igui_grid_drone_info_y,_posY);
    SETPRVAR(GVAR(displayPosY),nil);
};
// Old data finished

// Make sure data exists, sometimes it fails
if (GETPRVAR(igui_grid_drone_info_x,0) isEqualTo 0) then {
    SETPRVAR(igui_grid_drone_info_x,POS_X(54.8));
};
if (GETPRVAR(igui_grid_drone_info_y,0) isEqualTo 0) then {
    SETPRVAR(igui_grid_drone_info_y,POS_Y(10.2));
};
if (GETPRVAR(igui_grid_drone_info_w,0) isEqualTo 0) then {
    SETPRVAR(igui_grid_drone_info_w,POS_W(5.5));
};
if (GETPRVAR(igui_grid_drone_info_h,0) isEqualTo 0) then {
    SETPRVAR(igui_grid_drone_info_h,POS_H(0.75) * MAX_NUM_STATS);
};

// Refresh UI after layout has been changed
["CBA_layoutEditorSaved", {
    if (!isNil QGVAR(isRefreshing)) exitWith {};

    GVAR(isRefreshing) = true;

    [{
        // Wait until the pause menu has been closed
        !((findDisplay IDD_INTERRUPT) in allDisplays);
    }, {
        if (GVAR(isOpen)) then {
            call FUNC(refreshDisplay);
        };

        GVAR(isRefreshing) = nil;
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

// Refresh UI if any CBA settings of this mod have been changed
["CBA_SettingChanged", {
    params ["_setting"];

    if !((QUOTE(ADDON) in _setting) && {isNil QGVAR(isRefreshing)}) exitWith {};

    GVAR(isRefreshing) = true;

    [{
        // Wait until the pause menu has been closed
        !((findDisplay IDD_INTERRUPT) in allDisplays);
    }, {
        if (GVAR(isOpen)) then {
            call FUNC(refreshDisplay);
        };

        GVAR(isRefreshing) = nil;
    }] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
