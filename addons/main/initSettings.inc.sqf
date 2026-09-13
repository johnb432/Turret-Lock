[
    QGVAR(whitelistVehiclesSetting),
    "EDITBOX",
    [LSTRING(settingWhitelistNoInheritance), LSTRING(settingWhitelistNoInheritanceDesc)],
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
    [LSTRING(settingWhitelistInheritance), LSTRING(settingWhitelistInheritanceDesc)],
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
    [LSTRING(settingBlacklistNoInheritance), LSTRING(settingBlacklistNoInheritanceDesc)],
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
    [LSTRING(settingBlacklistInheritance), LSTRING(settingBlacklistInheritanceDesc)],
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
