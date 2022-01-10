[
    QGVAR(enableDroneInfo),
    "CHECKBOX",
    ["Enable Addon", "Enables the addon. Makes it easy to disable instead of unloading the mod."],
    [COMPONENT_NAME, "Locks"],
    true,
    0,
    {
        if (GVAR(isOpen)) then {
            GVAR(doShow) = false;
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(showName),
    "CHECKBOX",
    ["Display Name", "Displays the name of the drone."],
    [COMPONENT_NAME, "Locks"],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(showFuel),
    "CHECKBOX",
    ["Display Fuel", "Displays the fuel level of the drone in percent."],
    [COMPONENT_NAME, "Locks"],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(showSpeed),
    "CHECKBOX",
    ["Display Speed", "Displays the speed of the drone in km/h."],
    [COMPONENT_NAME, "Locks"],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(showAltitude),
    "CHECKBOX",
    ["Display Altitude", "Displays the altitude of the drone in meters."],
    [COMPONENT_NAME, "Locks"],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(showDirection),
    "CHECKBOX",
    ["Display Direction", "Displays the direction the drone is facing in degrees."],
    [COMPONENT_NAME, "Locks"],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(showPosition),
    "CHECKBOX",
    ["Display Position", "Displays the position of the drone as a grid reference."],
    [COMPONENT_NAME, "Locks"],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(showAmmo),
    "CHECKBOX",
    ["Display Ammunition count", "Displays the amount of ammunition remaining in percent."],
    [COMPONENT_NAME, "Locks"],
    true
] call CBA_fnc_addSetting;
