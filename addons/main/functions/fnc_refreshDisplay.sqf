#include "script_component.hpp"
/*
 * Author: johnb43
 * Open and closes the drone info panel to refresh the interface.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call drone_info_main_fnc_refreshDisplay;
 *
 * Public: No
 */

call FUNC(toggleDisplay);

// Best wait 2 frames
{
    {
        call FUNC(toggleDisplay);
    } call CBA_fnc_execNextFrame;
} call CBA_fnc_execNextFrame;
