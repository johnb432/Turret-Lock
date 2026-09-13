[COMPONENT_NAME, QGVAR(toggleTurretLock), LSTRING(keyBindLock), {
    LOCK_WHERE_LOOKING_AT call FUNC(toggleLockTurret)
}, {}, [DIK_U, [false, false, true]]] call CBA_fnc_addKeybind;

[COMPONENT_NAME, QGVAR(toggleTurretLockForward), LSTRING(keyBindLockForward), {
    LOCK_FACING_FRONT call FUNC(toggleLockTurret)
}, {}, [DIK_U, [false, true, true]]] call CBA_fnc_addKeybind;

[COMPONENT_NAME, QGVAR(toggleTurretLockTracking), LSTRING(keyBindLockTracking), {
    LOCK_TRACKING call FUNC(toggleLockTurret)
}, {}, [DIK_U, [true, false, false]]] call CBA_fnc_addKeybind;
