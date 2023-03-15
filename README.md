Advanced Wesnoth Wars
=======================

About
-----------

It's a mod  for "Battle for Wesnoth" open-source videogame.

* Author :  [Ruvaak](http://thomas.bondois.info)
* Mantainer : [Toranks](http://toranks.blogspot.com/)
* Version : see [lua/aww_status.lua:9](lua/aww_status.lua)
* Changelog : see [CHANGELOG.md](CHANGELOG.md)
* License : [GNU-GPL](LICENSE.md)
* Code Repository [on GitHub](https://github.com/Toranks/Advance_Wesnoth_Wars)
* Dedicated [forum thread](https://forums.wesnoth.org/viewtopic.php?f=15&t=49454)


DISCLAIMER FOR MODDERS
----------------------

You can reuse the code of this mod in your own creations, without asking my authorization, only if you share it with the same License, freely.
But I will really appreciate to know my code is used on your project, and that you credit my work somewhere in your code.


Description
-----------

Last Wesnoth version tested : 1.17.12

A collection of the most-requested options to make the mechanics more realistic and tactic, for people curious to experiment a new gameplay.
All theses features works for mainline Campaigns & Scenarios, Single or Multiplayer, for all sides including AI (except for special cases).

The features which keep the campaigns balanced are enabled by default. The others features are more aimed for PvP multiplayer, or to try greater challenges.


Features list
-----------

- No Random Combats: attacks never miss, terrain bonus is instead used as damage reducer. You will be able to change the base damage by a percentage to balance if necessary.

- Squad Mode (HP-related strikes) : Units do proportionally less attack strikes the less HP they have (or less damage for single-strike attacks). Swarm is a worse ratio (-1 strike if you miss just 1 HP), than native, but taken in account by AI. In both cases, minimum strikes will be 1, and will not apply for berserk.

- *Updated* Level-Up : Increase Level Number : The unit level will continue growing with the AMLA level-ups. This affect to some abilities as leadership, upkeep cost, and experience the enemies get fighting or killing the unit. You can change the maximum level of leadership and inspire abilities with this feature active.

- Level-Up : Floating Notifications : Floating text on the unit currently leveling-up. Can be helpful to know which unit is concerned by an advancement.

- Level-Up : Relative Healing : When an unit advance a level, instead of a full healing and being cured, it keep the missing HP, but statuses are cured. The special case when post-advancement Max-HP is smaller than pre-advanced is also handled.

- *Updated* Level-Up After Max Level Advancement - Manual or Random Bonuses : Units already AMLA (purple XP bar) gain an extra random ability or increased stat each time they level-up again. To identify them, they will have a new bracelet icon. Possible rewards: Melee damage +3, Melee strikes +1, Ranged damage +2, Ranged strikes +1, Movement points +1, First strike, Poison, Leadership, Distract, Regenerates, Adrenaline, Backstab, Marskman, Loyal, Fearless, Slows or Camouflage.

- Level-Up After Max Level Advancement - Promoted Leaders : Standard units reaching their first AMLA level-up will be able to recruit the same units as the original leader, recall, and be prefixed 'Chief' with a bronze crown icon (keeping the Loyal icon in case). You can set the minimum level to be promoted. Excluded for special Heroes.

- Epic Heroes : The Leaders and Heroes (gold & silver crowns) gain an increase of 20% of their attributes, and a small regeneration ability, making them harder to kill. They also get the distraction ability, that excludes Zone of Control around for allies, but not for themselves. Excluded for Promoted Leaders.

- *Updated* Learning from battlefield (Passive XP) : Extra XP for all player units each turn (except for the ones not recalled). You can choose Passive XP for low level units, for AI and for AI leaders separately.

- Learning from healing (Max XP/turn for Healing) : Each turn, Healers will earn 1 XP for each adjacent wounded or poisoned ally, but you can limit the max/turn.

- Berserk tweak - Fury : Replace 'berserk' by a new 'Fury' weapon special, way more interesting. A warcry related to the fury level with also be displayed. You can gain ability 'Bloodthirsty' by killing a certain number of enemies.

- *New* Berserk rounds: Change the combat rounds of standard berserk ability, making it less risky.

- *Updated* Ambushed tweak - Surprise Attacks : An ambush will trigger a quick combat in which the ambushed unit can't counter-attack. A new eye icon indicates if the surprise attack is prepared.

- *Updated* Ninja Wars! (Stealthy units) : Most of units will get melee back-stabs, poison arrows, diversion, skirmisher, be faster and invisible/ambushers in villages, forests, deep water, or everywhere at night. For funny PvP with fog-of-war focused on ambushes / hide&seek.

- *New* Villages line of sight : Villages can have a line of sight for the owner side, with configurable distance.

- *New* Recall cost of units : Choose the cost to recall units with chosen level or lower. Cost of higher level units remains unchanged. You can select free cost, 10, recruit cost + 1, percentage of recruit cost, or no changes.

- *New* Back to reserve : Allows you to send normal units back to the recall list with right click on keeps. Also set the cost for performing this action.

- *New* Desertions : One unit desertion will occur per turn when a human player side has less gold than a value you can specify.

- *New* Help menu : Contextual help accesible with right-click anywhere, with detailed explanation of the features, and the status or configured value for each, with options to activate, deactivate, or change values.

- *New* Tools : Utility to setup an AI controller for sides and leaders, activate Fast AI, create labels with custom color, category and tooltip, change poison HP damage, HP recovered by resting, default recall cost, base gold income, village income, village support and experience gained fighting or killing units.

- *New* Import and export units anywhere: Contextual menu accesible with right-click, with capability of import and export units from and to any campaign or scenario.

- Also includes a PvPvE scenario : '4p - Ruvaak Mirage Atoll' optimized to be combined with all features.

Feel free to contribute !
If you experiment a bug, please report it to me on the forum, then try to disable the feature (see next section).


How To Enable/Disable Mod Options during a Scenario/Campaign (for developers)
-----------------------------------------------

Note: This guide is kept for developers, but for normal users it is no longer necessary due to the new Help Menu, which covers almost all these functions.

When you disable an option, *MOST* of the changes made on units by the features are removed. But it's experimental.

1) During a game, type :
```
:debug
``` 
(except if you launched the game with --debug argument)

2) Then open Lua Console(default : `, but you can see it in Menu > Settings > Shortcuts > Display lua console)

3) Copy/paste/execute one of the following lines related to mod features. 

    - Change the number in parentheses : 0 (zero) means disabled, 1 enabled.
	
    - When specified, you can replace it by another number. (like in feature 02, 04, 05, 08...)
	
    - Most of the changes will be operational immediately, or next turn, or next scenario. But units already modified will keep theirs changes.
	
The commands to edit each feature and remove/re-enable changes on units :
```lua
aww_status.update_feature_01(0) -- NoRandomCombats
aww_status.update_feature_02(0) -- Squad Mode 1 = custom, 2 = swarm
aww_status.update_feature_03(0) -- L-Up AMLA Promoted Leader
aww_status.update_feature_04(0) -- passive xp, 0 to 6
aww_status.update_feature_05(0) -- healing xp 0 to 6
aww_status.update_feature_06(0) -- L-Up  relative healing
aww_status.update_feature_07(0) -- verbose debug messages
aww_status.update_feature_08(0) -- NoRandomCombats Damages Adjustment, to -20 to 40
aww_status.update_feature_09(0) -- AMLA Random Bonuses
aww_status.update_feature_10(0) -- Epic Leaders
aww_status.update_feature_11(0) -- Ninja Wars
aww_status.update_feature_12(0) -- Berserk tweak
aww_status.update_feature_13(0) -- Ambush tweak
aww_status.update_feature_14(0) -- L-Up Notif
aww_status.update_feature_15(0) -- L-Up AMLA number
```
If you want to display all currently enabled features (and the associated number), copy/paste/execute this line the lua console :
```lua
aww_status.message_info_all()
```
To display only activates features on a compact format, use :
```lua
aww_status.message_info()
```

You can set fury kills needed to gain bloodthirsty on any moment writing this with debug mode activated:
```lua
:set_var aww_12_fury_kills=X
```
To change Passive XP for AI:
```lua
:set_var aww_04_passive_xp_ai=X
```
A similar method can be used to edit any of the variables used by this addon.


How To Migrate a Savegame from a previous version of the mod
-------------------------------

It will do it automatically on next scenario. If you want to try to migrate the current scenario, copy/paste in lua console the following line :
```lua
wesnoth.fire_event('aww_event_reload_lua')
```
If you see some bugs on a feature,  (see previous section) disable it on re-enable it (replace XX by feature number):
```lua
aww_status.update_feature_XX(0)
aww_status.update_feature_XX(1)
```
See previous section to know how to open console or when the changes will applies.


Developer Mode
--------------

This is useful only for development/test purpose on the addon lua scripts. 

- Do not do that play a big campaign, as it can create issue with your savegame when you update the addon.
- Effect : the LUA scripts will be loaded externally (means you can edit them, and the effect will apply when you reload a savegame, no need to re-create a game or a scenario like for WML scripts).
- To enable it, just place a empty file named :
```
aww.dev
```
in the addon base directory (where the _main.cfg is).

- To disable it, just remove the file, and restart the game.


Thanks
-----------
Some of theses features are inspired from existing code, saving me lot of times.

A big thanks particularly to Eagle 11, Ravana, Bob_The_Mighty, Dugi, for their creation.

And a huge thanks for all developers and Wesnoth WML wiki contributors !

(Toranks): I say the same and add thanks to CelticMinstrel, Octalot and Pentarctagon without whom the code would not have improved as much as it has in recent versions.
