#include "\x\cba\addons\main\script_macros_common.hpp"

//This part includes parts of the CBA and ACE3 macro libraries
#define GETUVAR(var1,var2) (uiNamespace getVariable [ARR_2(QUOTE(var1),var2)])
#define GETPRVAR(var1,var2) (profileNamespace getVariable [ARR_2(QUOTE(var1),var2)])

#define SETUVAR(var1,var2) (uiNamespace setVariable [ARR_2(QUOTE(var1),var2)])
#define SETPRVAR(var1,var2) (profileNamespace setVariable [ARR_2(QUOTE(var1),var2)])

#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)

#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

// Position getters
#define DISPLAY_XPOS (GETPRVAR(igui_grid_drone_info_x,POS_X(54.8)))
#define DISPLAY_YPOS (GETPRVAR(igui_grid_drone_info_y,POS_Y(10.2)))

// Display control ID defines
#define IDD_INTERRUPT 49

#define IDC_GROUP 28
#define IDC_BACKGROUND 29
#define IDC_DRONENAME 30
#define IDC_DRONEFUEL 31
#define IDC_DRONESPEED 32
#define IDC_DRONEALT 33
#define IDC_DRONEDIR 34
#define IDC_DRONEPOS 35
#define IDC_DRONEAMMO 36

#define MAX_NUM_STATS 7

#define POS_CALC ((safezoneW / safezoneH) min 1.2)
#define X_OFF (safezoneX + (safezoneW - POS_CALC) / 2)
#define Y_OFF (safezoneY + (safezoneH - (POS_CALC / 1.2)) / 2)
#define W_OFF (POS_CALC / 40)
#define H_OFF (POS_CALC / 30) // (POS_CALC / 1.2) / 25

#define POS_W(var1) (var1 * W_OFF)
#define POS_H(var1) (var1 * H_OFF)
#define POS_X(var1) (POS_W(var1) + X_OFF)
#define POS_Y(var1) (POS_H(var1) + Y_OFF)
