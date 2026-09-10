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
            GVAR(whitelistVehiclesInheritanceSetting) = '[
				"AAA_System_01_base_F",
				"AFV_Wheeled_01_base_F",
				"APC_Tracked_01_base_F",
				"CUP_AH1Z_Base",
				"CUP_AH64_base",
				"CUP_Challenger2_base",
				"CUP_Leopard2_Base",
				"CUP_M163New_Base",
				"CUP_M1Abrams_Base",
				"CUP_M2Bradley_Base",
				"CUP_ZSU23_Base",
				"CUP_nM1097_Avenger_Base",
				"EF_AAV9_Base",
				"EF_Gyra_Antiair_Base",
				"EF_MRAP_01_FSV_base",
				"Heli_Attack_01_base_F",
				"Heli_Attack_02_base_F",
				"Heli_Attack_03_base_F",
				"LT_01_base_F",
				"MBT_01_base_F",
				"MBT_02_base_F",
				"MBT_03_base_F",
				"MBT_04_base_F",
				"O_APC_Tracked_02_AA_F",
				"UGV_01_rcws_base_F",
				"VTOL_01_armed_base_F"
			]';
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
            GVAR(blacklistVehiclesInheritanceSetting) = '[
				"CUP_ZSU23_Afghan_Base"
			]';
        };

        GVAR(blacklistVehiclesInheritance) = ((parseSimpleArray _this) apply {configName (_x call CBA_fnc_getObjectConfig)}) - [""];
    }
] call CBA_fnc_addSetting;
