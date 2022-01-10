#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main",
            "cba_xeh",
            "A3_Data_F_AoW_Loadorder"
        };
        author = "johnb43";
        url = "https://github.com/johnb432/Drone-Info";
        VERSION_CONFIG;
    };
};

class CfgMods {
    class PREFIX {
        name = "Drone Info";
        author = "johnb43";
        tooltipOwned = "Drone Info";
        hideName = 0;
        hidePicture = 0;
        actionName = "Github";
        action = "https://github.com/johnb432/Drone-Info";
        description = "Adds a info panel that shows drone information.";
        overview = "Adds a info panel that shows drone information.";
        picture = "\x\drone_info\addons\main\ui\logo_drone_info.paa"; // https://www.onlinewebfonts.com/icon/536439 is licensed by CC BY 3.0
        logo = "\x\drone_info\addons\main\ui\logo_drone_info.paa";
        overviewPicture = "\x\drone_info\addons\main\ui\logo_drone_info.paa";
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgRsc.hpp"
#include "CfgUIGrids.hpp"
