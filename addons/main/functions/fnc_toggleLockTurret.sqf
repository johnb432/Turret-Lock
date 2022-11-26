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

if (!isNull curatorCamera || {_type == LOCK_WHERE_LOOKING_AT && {cameraView != "GUNNER"}}) exitWith {false};

private _player = call CBA_fnc_currentUnit;
private _vehicle = objectParent _player;

if (isNull _vehicle) exitWith {false};

private _turretPath = _vehicle unitTurret _player;
private _helperUnit = _player getVariable [QGVAR(helperUnit), objNull];

// If not locked
if (isNull _helperUnit) then {
    _helperUnit = "C_man_1" createVehicleLocal [0, 0, 0];

    if (_type == LOCK_WHERE_LOOKING_AT) then {
        // Find gun start position
        private _posGunStart = _vehicle modelToWorldWorld (_vehicle selectionPosition (getText ([_vehicle, _turretPath] call CBA_fnc_getTurret >> "gunBeg")));

        if (_posGunStart isNotEqualTo [0, 0, 0]) then {
            _helperUnit setPosASL ((AGLToASL positionCameraToWorld [0, 0, 5000]) vectorAdd (_posGunStart vectorDiff (AGLToASL positionCameraToWorld [0, 0, 0])));
        } else {
            // If no gun is found, just get where they are looking at (not as accurate)
            _helperUnit setPosASL (AGLToASL positionCameraToWorld [0, 0, 5000]);
        };
    } else {
         _helperUnit setPosASL (_vehicle modelToWorldWorld [0, 200, 0]);
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

    true
} else {
    _vehicle lockCameraTo [objNull, _turretPath, false];
    deleteVehicle _helperUnit;

    _player setVariable [QGVAR(helperUnit), nil];

    true
};
