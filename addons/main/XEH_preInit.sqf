#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

[COMPONENT_NAME, GVAR(toggleDisplay), "Toggle Info Panel", {
    call FUNC(toggleDisplay);
    true
}, {}, [DIK_U, [false, false, true]]] call CBA_fnc_addKeybind;

ADDON = true;
