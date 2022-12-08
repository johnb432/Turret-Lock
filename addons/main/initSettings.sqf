[
    QGVAR(whitelistVehiclesSetting),
    "EDITBOX",
    ["Whitelist vehicles (no Inheritance)", "List of vehicles that can use the lock on and target tracking feature."],
    COMPONENT_NAME,
    '[]',
    1,
    {
        if (_this isEqualTo "") exitWith {
            GVAR(whitelistVehicles) = [];
            GVAR(whitelistVehiclesSetting) = '[]';
        };

        GVAR(whitelistVehicles) = ((parseSimpleArray _this) apply {configName (_x call CBA_fnc_getObjectConfig)}) - [""];
    }
] call CBA_fnc_addSetting;

[
    QGVAR(whitelistVehiclesInheritanceSetting),
    "EDITBOX",
    ["Whitelist vehicles (with Inheritance)", "List of vehicles and all of their children that can use the lock on and target tracking feature."],
    COMPONENT_NAME,
    '[]',
    1,
    {
        if (_this isEqualTo "") exitWith {
            GVAR(whitelistVehiclesInheritance) = [];
            GVAR(whitelistVehiclesInheritanceSetting) = '[]';
        };

        GVAR(whitelistVehiclesInheritance) = ((parseSimpleArray _this) apply {configName (_x call CBA_fnc_getObjectConfig)}) - [""];
    }
] call CBA_fnc_addSetting;

[
    QGVAR(blacklistVehiclesSetting),
    "EDITBOX",
    ["Blacklist vehicles (no Inheritance)", "List of vehicles that can't use the lock on and target tracking feature."],
    COMPONENT_NAME,
    '[]',
    1,
    {
        if (_this isEqualTo "") exitWith {
            GVAR(blacklistVehicles) = [];
            GVAR(blacklistVehiclesSetting) = '[]';
        };

        GVAR(blacklistVehicles) = ((parseSimpleArray _this) apply {configName (_x call CBA_fnc_getObjectConfig)}) - [""];
    }
] call CBA_fnc_addSetting;

[
    QGVAR(blacklistVehiclesInheritanceSetting),
    "EDITBOX",
    ["Blacklist vehicles (with Inheritance)", "List of vehicles and all of their children that can't use the lock on and target tracking feature."],
    COMPONENT_NAME,
    '[]',
    1,
    {
        if (_this isEqualTo "") exitWith {
            GVAR(blacklistVehiclesInheritance) = [];
            GVAR(blacklistVehiclesInheritanceSetting) = '[]';
        };

        GVAR(blacklistVehiclesInheritance) = ((parseSimpleArray _this) apply {configName (_x call CBA_fnc_getObjectConfig)}) - [""];
    }
] call CBA_fnc_addSetting;
