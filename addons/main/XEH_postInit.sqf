#include "script_component.hpp"

// When switching turrets, remove helper unit; Is triggered when dismounting and switching seats
["turret", {
    params ["_unit"];

    private _helperUnit = _unit getVariable [QGVAR(helperUnit), objNull];

    if (isNull _helperUnit) exitWith {};

    deleteVehicle _helperUnit;

    _unit setVariable [QGVAR(helperUnit), nil];
}] call CBA_fnc_addPlayerEventHandler;
