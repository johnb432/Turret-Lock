#include "script_component.hpp"

if (!hasInterface) exitWith {};

// CBA keybinds
#include "initKeybinds.inc.sqf"

// When switching turrets, remove turret lock; Is triggered when dismounting and switching seats
["turret", {
    params ["_unit", "", "_oldTurretPath"];

    private _helperUnit = _unit getVariable [QGVAR(helperUnit), objNull];

    // Handle front and where looking at
    if (!isNull _helperUnit) exitWith {
        deleteVehicle _helperUnit;

        _unit setVariable [QGVAR(helperUnit), nil];

        [[LLSTRING(unlockedTurret)], true] call CBA_fnc_notify;
        playSoundUI ["click"];
    };

    // Handle tracking mode
    private _vehicle = objectParent _unit;
    private _lockedTo = _vehicle lockedCameraTo _oldTurretPath;

    if (isNil "_lockedTo" || {isNull _lockedTo} || {isNil QGVAR(lastInput)} || {GVAR(lastInput) != LOCK_TRACKING}) exitWith {};

    _vehicle lockCameraTo [objNull, _oldTurretPath, false];

    [[LLSTRING(unlockedTracking)], true] call CBA_fnc_notify;
    playSoundUI ["click"];
}] call CBA_fnc_addPlayerEventHandler;
