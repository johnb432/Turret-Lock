#include "script_component.hpp"

ADDON = false;

if (hasInterface) then {
    [COMPONENT_NAME, GVAR(toggleTurretLock), "Toggle Turret Lock", {
        if (!isNull curatorCamera) exitWith {};

        private _player = call CBA_fnc_currentUnit;
        private _vehicle = objectParent _player;

        if (isNull _vehicle) exitWith {};

        private _turretPath = _vehicle unitTurret _player;

        // If not locked
        if (isNull (_player getVariable [QGVAR(helperUnit), objNull])) then {
            // Find turret and gunner view; Get positions of view and start of gun
            private _turretConfig = [_vehicle, _turretPath] call CBA_fnc_getTurret;
            private _posGunStart = _vehicle modelToWorldWorld (_vehicle selectionPosition (getText (_turretConfig >> "gunBeg")));
            private _dirGun = vectorNormalized (_posGunStart vectorDiff (_vehicle modelToWorldWorld (_vehicle selectionPosition (getText (_turretConfig >> "gunEnd")))));

            // If gun hasn't been properly detected, lock looking forwards
            if (_dirGun isEqualTo [0, 0, 0]) then {
                _dirGun = [0, 1, 0];
            };

            // Spawn in helper unit, 1200m away from vehicle;
            private _helperUnit = "C_man_1" createVehicleLocal [0, 0, 0];
            _helperUnit setPosASL (_posGunStart vectorAdd (_dirGun vectorMultiply 1200));
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
};

ADDON = true;
