class RscText;
class RscTitles {
    class GVAR(droneInfo) {
        idd = -1;
        duration = 1000000;
        fadeIn = 0;
        fadeOut = 0;
        onLoad = QUOTE((_this select 0) call FUNC(onLoadDialog));
        onUnload = "";
        controls[] = {
            QGVAR(background),
            QGVAR(statusName),
            QGVAR(statusFuel),
            QGVAR(statusSpeed),
            QGVAR(statusAlt),
            QGVAR(statusDir),
            QGVAR(statusPos),
            QGVAR(statusAmmo)
        };

        // Background for Panel
        class GVAR(background): RscText {
            idc = IDC_BACKGROUND;
            style = 0;
            x = POS_X(54.8);
            y = POS_Y(10.2);
            w = POS_W(5.5);
            h = POS_H(0.75) * MAX_NUM_STATS;
            colorBackground[] = {0.09, 0.1, 0.13, 1};
            colorText[] = {1, 1, 1, 1};
            sizeEx = 0.025;
            font = "PuristaMedium";
            size = 2.3;
            shadow = 2;
            text = "";
        };

        // Info bars for panels
        class GVAR(statusName): GVAR(background) {
            idc = IDC_DRONENAME;
            colorBackground[] = {0, 0, 0, 0};
            h = POS_H(0.75);
        };

        class GVAR(statusFuel): GVAR(background) {
            idc = IDC_DRONEFUEL;
            colorBackground[] = {0, 0, 0, 0};
            y = POS_Y(10.2) + POS_H(0.75);
            h = POS_H(0.75);
        };

        class GVAR(statusSpeed): GVAR(background) {
            idc = IDC_DRONESPEED;
            colorBackground[] = {0, 0, 0, 0};
            y = POS_Y(10.2) + 2 * POS_H(0.75);
            h = POS_H(0.75);
        };

        class GVAR(statusAlt): GVAR(background) {
            idc = IDC_DRONEALT;
            colorBackground[] = {0, 0, 0, 0};
            y = POS_Y(10.2) + 3 * POS_H(0.75);
            h = POS_H(0.75);
        };

        class GVAR(statusDir): GVAR(background) {
            idc = IDC_DRONEDIR;
            colorBackground[] = {0, 0, 0, 0};
            y = POS_Y(10.2) + 4 * POS_H(0.75);
            h = POS_H(0.75);
        };

        class GVAR(statusPos): GVAR(background) {
            idc = IDC_DRONEPOS;
            colorBackground[] = {0, 0, 0, 0};
            y = POS_Y(10.2) + 5 * POS_H(0.75);
            h = POS_H(0.75);
        };

        class GVAR(statusAmmo): GVAR(background) {
            idc = IDC_DRONEAMMO;
            colorBackground[] = {0, 0, 0, 0};
            y = POS_Y(10.2) + 6 * POS_H(0.75);
            h = POS_H(0.75);
        };
    };
};
