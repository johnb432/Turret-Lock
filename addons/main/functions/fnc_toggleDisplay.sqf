#include "script_component.hpp"
/*
 * Author: johnb43
 * Toggle the drone info panel.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call drone_info_main_fnc_toggleDisplay;
 *
 * Public: No
 */

if (!GVAR(isOpen)) then {
    private _player = call CBA_fnc_currentUnit;

    // Exit if in an invalid state for display to open
    if !(GVAR(enableDroneInfo) && {alive getConnectedUAV _player} && {alive _player}) exitWith {};

    call FUNC(openDroneInfo);
} else {
    GVAR(doShow) = false;
};
