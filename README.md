**Turret Lock** is a client side mod that allows users to lock turret stabilisation as well as to make the turret face forward along the hull.
This mod can lock the user's turret onto a target, but it must be enabled by the server via CBA settings.

<h2>CBA Settings</h2>

* **Vehicle Blacklist (no Inheritance):** Any vehicle in this list will not have target tracking enabled. It will only disable the vehicle itself and not its children (which means any classes that inherit from that class).
* **Vehicle Blacklist (with Inheritance):** Any vehicle and their children in this list will not have target tracking enabled. You can use this setting to more easily blacklist a family of vehicles.
* **Vehicle Whitelist (no Inheritance):** Any vehicle in this list will have target tracking enabled, if the setting below has added the interaction to that class (see whitelist examples). It will only enable the vehicle itself and not its children.
* **Vehicle Whitelist (with Inheritance):** Any vehicle and their children in this list will have target tracking enabled. You can use this setting to more easily whitelist a family of vehicles.

<h2>Whitelist Examples</h2>

If you want to just whitelist e.g. `["B_APC_Wheeled_01_cannon_F"]`
* Set "no Inheritance" to `["B_APC_Wheeled_01_cannon_F"]`
* Don't change "with Inheritance"

If you want to just whitelist multiple vehicles e.g. `["B_APC_Wheeled_01_cannon_F","B_MBT_01_TUSK_F"]`
* Set "no Inheritance" to `["B_APC_Wheeled_01_cannon_F","B_MBT_01_TUSK_F"]`
* Don't change "with Inheritance"

If you want to whitelist all vehicles:
* Don't change "no Inheritance"
* Set "with Inheritance" to `["AllVehicles"]`

<h2>CBA Keybinds</h2>

* Press **Alt-U** to lock the turret stabilisation. Only works if player is in the "Gunner" view (using the sights).
* Press **Ctrl-Alt-U** to lock the turret facing forward along hull. Works in any view (1st person, 3rd person, etc.).
* Press **Shift-U** to lock the turret onto a target. Only works if player is in the "Gunner" view (using the sights).

<h2>Links</h2>

* [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=2777111000)
* [GitHub](https://github.com/johnb432/Turret-Lock)

<h2>Credit</h2>

Mod by johnb43

[Mod Icon](http://getdrawings.com/get-drawing#army-tank-drawing-61.jpg) from [Icon Fonts](http://www.onlinewebfonts.com/icon) which is licensed by CC BY-NC 4.0.
