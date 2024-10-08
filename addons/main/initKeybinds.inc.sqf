[COMPONENT_NAME, QGVAR(toggleTurretLock), "Toggle Turret Lock", {
    LOCK_WHERE_LOOKING_AT call FUNC(toggleLockTurret)
}, {}, [DIK_U, [false, false, true]]] call CBA_fnc_addKeybind;

[COMPONENT_NAME, QGVAR(toggleTurretLockForward), "Toggle Turret Lock (Facing Forward)", {
    LOCK_FACING_FRONT call FUNC(toggleLockTurret)
}, {}, [DIK_U, [false, true, true]]] call CBA_fnc_addKeybind;

[COMPONENT_NAME, QGVAR(toggleTurretLockTracking), "Toggle Turret Lock (Tracking Mode)", {
    LOCK_TRACKING call FUNC(toggleLockTurret)
}, {}, [DIK_U, [true, false, false]]] call CBA_fnc_addKeybind;
