// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp
#define MAINPREFIX x
#define PREFIX drone_info

#include "script_version.hpp"

#define VERSION     MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_STR MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR  MAJOR,MINOR,PATCHLVL,BUILD

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 2.06

#define COMPONENT_NAME QUOTE(Drone Info)
