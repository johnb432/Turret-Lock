[b]Turret Lock[/b] is a client side mod that allows users to lock turret stabilisation as well as to make the turret face forward along the hull.
This mod can lock the user's turret onto a target, but it must be enabled by the server via CBA settings. Nothing is configured by default; you have to add it yourself!

[h2]CBA Settings[/h2]
[list]
[*] [b]Vehicle Blacklist (no Inheritance):[/b] Any vehicle in this list will not have target tracking enabled. It will only disable the vehicle itself and not its children (which means any classes that inherit from that class).
[*] [b]Vehicle Blacklist (with Inheritance):[/b] Any vehicle and their children in this list will not have target tracking enabled. You can use this setting to more easily blacklist a family of vehicles.
[*] [b]Vehicle Whitelist (no Inheritance):[/b] Any vehicle in this list will have target tracking enabled, if the setting below has added the interaction to that class (see whitelist examples). It will only enable the vehicle itself and not its children.
[*] [b]Vehicle Whitelist (with Inheritance):[/b] Any vehicle and their children in this list will have target tracking enabled. You can use this setting to more easily whitelist a family of vehicles.
[/list]

[h2]Whitelist Examples[/h2]
If you want to just whitelist e.g. [code]"B_APC_Wheeled_01_cannon_F"[/code]
[list]
[*] Set "no Inheritance" to [code]["B_APC_Wheeled_01_cannon_F"][/code]
[*] Don't change "with Inheritance"
[/list]

If you want to just whitelist multiple vehicles e.g. [code]["B_APC_Wheeled_01_cannon_F","B_MBT_01_TUSK_F"][/code]
[list]
[*] Set "no Inheritance" to [code]["B_APC_Wheeled_01_cannon_F","B_MBT_01_TUSK_F"][/code]
[*] Don't change "with Inheritance"
[/list]

If you want to whitelist all vehicles:
[list]
[*] Don't change "no Inheritance"
[*] Set "with Inheritance" to [code]["AllVehicles"][/code]
[/list]

Here is an example of an elaborate whitelist:
[list]
[*] Set the "with Inheritance" whitelist to  [code]["AAA_System_01_base_F","AFV_Wheeled_01_base_F","APC_Tracked_01_base_F","CUP_AH1Z_Base","CUP_AH64_base","CUP_Challenger2_base","CUP_Leopard2_Base","CUP_M163New_Base","CUP_M1Abrams_Base","CUP_M2Bradley_Base","CUP_ZSU23_Base","CUP_nM1097_Avenger_Base","EF_AAV9_Base","EF_Gyra_Antiair_Base","EF_MRAP_01_FSV_base","Heli_Attack_01_base_F","Heli_Attack_02_base_F","Heli_Attack_03_base_F","LT_01_base_F","MBT_01_base_F","MBT_02_base_F","MBT_03_base_F","MBT_04_base_F","O_APC_Tracked_02_AA_F","UGV_01_rcws_base_F","VTOL_01_armed_base_F"][/code]
[*] Set the "with Inheritance" blacklist to [code]["CUP_ZSU23_Afghan_Base"][/code]
[/list]

[h2]CBA Keybinds[/h2]
[list]
[*] Press [b]Alt-U[/b] to lock the turret stabilisation. Only works if player is in the "Gunner" view (using the sights).
[*] Press [b]Ctrl-Alt-U[/b] to lock the turret facing forward along hull. Works in any view (1st person, 3rd person, etc.).
[*] Press [b]Shift-U[/b] to lock the turret onto a target. Only works if player is in the "Gunner" view (using the sights).
[/list]

[h2]Links[/h2]
[list]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2777111000]Steam Workshop[/url]
[*] [url=https://github.com/johnb432/Turret-Lock]GitHub[/url]
[/list]

[h2]Credit[/h2]
[list]
[*] [url=http://getdrawings.com/get-drawing#army-tank-drawing-61.jpg]Mod Icon[/url] from [url=http://www.onlinewebfonts.com/icon]Icon Fonts[/url] which is licensed by CC BY-NC 4.0
[*] Mod by johnb43
[/list]

[h2]License[/h2]
See LICENSE.
