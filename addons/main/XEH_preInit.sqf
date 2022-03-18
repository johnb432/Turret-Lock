#include "script_component.hpp"

ADDON = false;

if (hasInterface) then {
    [COMPONENT_NAME, QGVAR(toggleTurretLock), "Toggle Turret Lock", {
        if !(isNull curatorCamera && {cameraView isEqualTo "GUNNER"}) exitWith {};

        private _player = call CBA_fnc_currentUnit;
        private _vehicle = objectParent _player;

        if (isNull _vehicle) exitWith {};

        private _turretPath = _vehicle unitTurret _player;

        // If not locked
        if (isNull (_player getVariable [QGVAR(helperUnit), objNull])) then {
            private _helperUnit = "C_man_1" createVehicleLocal [0, 0, 0];

            // Find gun start position
            private _posGunStart = _vehicle modelToWorldWorld (_vehicle selectionPosition (getText ([_vehicle, _turretPath] call CBA_fnc_getTurret >> "gunBeg")));

            if (_posGunStart isNotEqualTo [0, 0, 0]) then {
                _helperUnit setPosASL ((AGLToASL positionCameraToWorld [0, 0, 1200]) vectorAdd (_posGunStart vectorDiff (AGLToASL positionCameraToWorld [0, 0, 0])));
            } else {
                // If no gun is found, just get where they are looking at (not as accurate)
                _helperUnit setPosASL (AGLToASL positionCameraToWorld [0, 0, 1200]);
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

            true;
        } else {
            private _helperUnit = _player getVariable [QGVAR(helperUnit), objNull];

            if (isNull _helperUnit) exitWith {false};

            _vehicle lockCameraTo [objNull, _turretPath, false];
            deleteVehicle _helperUnit;

            _player setVariable [QGVAR(helperUnit), nil];

            true;
        };
    }, {}, [DIK_U, [false, false, true]]] call CBA_fnc_addKeybind;

    [COMPONENT_NAME, QGVAR(toggleTurretLockForward), "Toggle Turret Lock (Facing Forward)", {
        if (!isNull curatorCamera) exitWith {};

        private _player = call CBA_fnc_currentUnit;
        private _vehicle = objectParent _player;

        if (isNull _vehicle) exitWith {};

        private _turretPath = _vehicle unitTurret _player;

        // If not locked
        if (isNull (_player getVariable [QGVAR(helperUnit), objNull])) then {
            // Spawn in helper unit, 200m in front of vehicle;
            private _helperUnit = "C_man_1" createVehicleLocal [0, 0, 0];
            _helperUnit setPosASL (_vehicle modelToWorldWorld [0, 200, 0]);
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

            true;
        } else {
            private _helperUnit = _player getVariable [QGVAR(helperUnit), objNull];

            if (isNull _helperUnit) exitWith {false};

            _vehicle lockCameraTo [objNull, _turretPath, false];
            deleteVehicle _helperUnit;

            _player setVariable [QGVAR(helperUnit), nil];

            true;
        };
    }, {}, [DIK_U, [false, true, true]]] call CBA_fnc_addKeybind;
};

ADDON = true;
