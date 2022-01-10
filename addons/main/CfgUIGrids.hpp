class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    grid_drone_info[] = {
                        {
                            QUOTE(POS_X(54.8)), // x
                            QUOTE(POS_Y(10.2)), // y
                            QUOTE(POS_W(5.5)), // w
                            QUOTE(POS_H(0.75) * MAX_NUM_STATS) // h
                        },
                        QUOTE(pixelW), // steps for changing width
                        QUOTE(pixelH) // steps for changing height
                    };
                };
            };
        };

        class Variables {
            class grid_drone_info {
                canResize = 0;
                description = "Drone Info panel. Shows you drone information to which you are connected to.";
                displayName = COMPONENT_NAME;
                preview = "#(argb,8,8,3)color(0.2,0.2,0.2,0.5)";
                saveToProfile[] = {0, 1, 2, 3};
            };
        };
    };
};
