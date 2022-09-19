#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (hasInterface) then {
    [COMPONENT_NAME, QGVAR(toggleTurretLock), "Toggle Turret Lock", {
        LOCK_WHERE_LOOKING_AT call FUNC(toggleLockTurret);
    }, {}, [DIK_U, [false, false, true]]] call CBA_fnc_addKeybind;

    [COMPONENT_NAME, QGVAR(toggleTurretLockForward), "Toggle Turret Lock (Facing Forward)", {
        LOCK_FACING_FRONT call FUNC(toggleLockTurret);
    }, {}, [DIK_U, [false, true, true]]] call CBA_fnc_addKeybind;
};

ADDON = true;
