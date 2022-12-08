#include "script_component.hpp"

/*
 * Author: johnb43
 * Toggles the lock on a turret.
 *
 * Arguments:
 * 0: Type of locking <NUMBER>
 *
 * Return Value:
 * If to override default keybind. <BOOLEAN>
 *
 * Example:
 * 0 call turret_lock_main_fnc_toggleLockTurret;
 *
 * Public: No
 */

params [["_type", LOCK_WHERE_LOOKING_AT, [0]]];

if (!isNull curatorCamera || {_type in [LOCK_WHERE_LOOKING_AT, LOCK_TRACKING] && {cameraView != "GUNNER"}}) exitWith {false};

private _player = call CBA_fnc_currentUnit;
private _vehicle = objectParent _player;

if (isNull _vehicle) exitWith {false};

private _vehicleType = typeOf _vehicle;
private _isLockTracking = _type == LOCK_TRACKING;

// If type is target tracking, see if vehicle is allowed to track targets
if (
    _isLockTracking && !((
    	(GVAR(whitelistVehicles) isNotEqualTo [] && {_vehicleType in GVAR(whitelistVehicles)}) ||
    	{GVAR(whitelistVehiclesInheritance) findIf {_vehicle isKindOf _x} != -1}
	) && {
		(GVAR(blacklistVehicles) isEqualTo [] || {!(_vehicleType in GVAR(blacklistVehicles))}) &&
		{GVAR(blacklistVehiclesInheritance) findIf {_vehicle isKindOf _x} == -1}
	})
) exitWith {false};

// Set what type was used the first time
if (isNil QGVAR(lastInput)) then {
    GVAR(lastInput) = _type;
};

private _turretPath = _vehicle unitTurret _player;
private _helperUnit = _player getVariable [QGVAR(helperUnit), objNull];

// This allows different type locking without having to toggle inbetween every time
if (_type != GVAR(lastInput)) then {
    if (!isNull _helperUnit) then {
        deleteVehicle _helperUnit;

        _player setVariable [QGVAR(helperUnit), nil];
    };

    _vehicle lockCameraTo [objNull, _turretPath, false];
};

GVAR(lastInput) = _type;
private _lockedTo = _vehicle lockedCameraTo _turretPath;

// If not locked
if (isNil "_lockedTo" || {isNull _lockedTo}) then {
    // In tracking mode
    if (_isLockTracking) exitWith {
        private _targets = lineIntersectsObjs [AGLToASL positionCameraToWorld [0, 0, 0], AGLToASL screenToWorld [0.5, 0.5], _vehicle, objNull, true, 32];

        _vehicle lockCameraTo [_targets param [_targets findIf {_x isKindOf "AllVehicles"}, cursorObject], _turretPath, false];
    };

    // In other locking modes
    _helperUnit = "C_man_1" createVehicleLocal [0, 0, 0];

    switch (_type) do {
        case LOCK_WHERE_LOOKING_AT: {
            // Find gun start position
            private _posGunStart = _vehicle modelToWorldWorld (_vehicle selectionPosition (getText ([_vehicle, _turretPath] call CBA_fnc_getTurret >> "gunBeg")));

            if (_posGunStart isNotEqualTo [0, 0, 0]) then {
                _helperUnit setPosASL ((AGLToASL positionCameraToWorld [0, 0, 5000]) vectorAdd (_posGunStart vectorDiff (AGLToASL positionCameraToWorld [0, 0, 0])));
            } else {
                // If no gun is found, just get where they are looking at (not as accurate)
                _helperUnit setPosASL (AGLToASL positionCameraToWorld [0, 0, 5000]);
            };
        };
        case LOCK_FACING_FRONT: {
            _helperUnit setPosASL (_vehicle modelToWorldWorld [0, 200, 0]);
        };
    };

    _helperUnit attachTo [_vehicle];

    // Do not allow the unit to move or interact with other objects; Make invisible and invincible
    _helperUnit enableSimulation false;
    _helperUnit disableAI "all";
    _helperUnit hideObject true;
    _helperUnit allowDamage false;

    removeUniform _helperUnit;
    removeGoggles _helperUnit;

    _vehicle lockCameraTo [_helperUnit, _turretPath, false];

    _player setVariable [QGVAR(helperUnit), _helperUnit];
} else {
    _vehicle lockCameraTo [objNull, _turretPath, false];

    if (!isNull _helperUnit) then {
        deleteVehicle _helperUnit;

        _player setVariable [QGVAR(helperUnit), nil];
    };
};

true
