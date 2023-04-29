# Changelog

For more clarity about compatibility, first 2 version numbers will follow base game version.

So 1.14.X.Y means game was checked compatible with Wesnoth 1.14. X is incremented for new features; Y is increment for fixes/optimisations.


## [1.17.16] - 2023-4-XX

# Added
- Arrow icon for all options without icon, now is more readable

### Changed
- New and better scaled icons on contextual menu
- Unit Controller can have the same side on controller and controlled, as the other AI Controllers, just for special cases.
- Double max XP increase on loyal Manual Bonus, and melee and ranged strike +1 on units with 1 strike on the base attack.
- Reduced loyal probability with Random Bonuses

### Fixed
- Now "Send to reserve" can be activated (and deactivated) on any moment instead of the next scenario.
- Unit controller menu properly cleaned between scenarios.
- Fixed icon collision with Non Fatal Wounds (harmless)
- Fixed #undef warnings of AI Controller.
- Fixed status of Leader AI (keep or engage) between scenarios


## [1.17.15] - 2023-4-26

### Added
- New Tool: Experience modifier, similar to experience_modifier key of [scenario], but can be changed at any moment.

### Changed
- Disable "move" menu on frozen leaders, forcing to clear the frozen state manually (same as Unit AI Controller). This also can reduce the number of menu options.
- Regeneration and distraction for Epic Heroes defaults to no.
- Changed [effect] apply_to=level to native support on 1.17.15 and higher.

### Fixed
- Delete new menu items (engage-disengage) on Leader AI Controller between scenarios.
- Fixes on AI Controller menu text.


## [1.17.14.4] - 2023-4-9

### Added
- New Tool: Unit AI Controller, to control individual units.
- Option to move Setup AI Controller to the Main menu or Tools menu, for comfort.
- New Event: LOTI P1C2S8, choose to give Epic trait to all Heroes or only a selection of the best.

### Changed
- Reorganized AI Controller menu, with better explanation of all features, step by step.

### Fixed
- Non Random Combat, Fixed wrong display of strikes on estimations when a [attacks] special is applied to opponent and not to himself. This doesn't affect to real attacks, only to estimations display.
- Fixed wrong portrait of leader on Side AI Controller on certain situations.
- More reliable detection of leader on Leader AI Controller, taking into account if a side does not have any leader or unit capable of recruiting, displaying an error message.
- Deleted retreat_factor AI aspect too when side behavior is cleared.


## [1.17.14.3] - 2023-4-3

### Added
- New Feature: Reload items on Legends of the Invincibles. (Only available on this campaign)
- New Tool option: Change controller to AI for only one turn.

### Fixed
- French translation rebuilt and ordered, 28%
- Minor fixes with texts and variables.


## [1.17.14.2] - 2023-4-2

### Fixed
- Better warning about Side Controller and how to regain control of sides if all sides belong to AI.
- Fixed Ambush Tweak on LOTI, that on some situations still need to re-equip items or attack at least once to rebuild the item effects. Better and cleaner code to that.


## [1.17.14.1] - 2023-4-1

### Added
- New Tool: Random Color. All units will receive a random tint of color, completely configurable in ranges of red, green, blue and opacity.
- New Leader AI tool options: Engage combat or take refuge on a keep.

### Fixed
- Make Beelzebub compatible with Epic Heroes before receives any attack.
- Ambush icon on multiplayer is now less efficient, but can't give OOS.
- Reduced remove-putting of ambush icon object.
- Fixed hidden units filter, more specific to units the current side can't see.
- Filtered adjacent enemies to prevent ambushes when a unit separates and returns where there is a unit capable of ambush.
- Fixed error on Leader AI controller with different side controllers than 1.


## [1.17.14] - 2023-3-28

### Added
- New Tool: Change Side Color. Allows players to change the color of any side.
- Some warning messages on help menu when LOTI is active, on features not fully compatible with LOTI.

### Fixed
- Ratio of Squad feature changed from float to integer with 2 decimals.
- Make ambush icon compatible with LOTI.
- Texdomain of Storm Trident fixed, now is translated to all languages.
- Filtered units with some [heals] ability but with negative value, to not receive experience for healing. (Need to filter more [heals] abilities from other UMC if exists)
- Safer unstoring of units to not interfere with advances (advance=no)
- Added checking to poisoned status on Learning for Healing, to check the unlikely event where the unit have full HP but is poisoned.
- Extra checking for epic trait for units that lose their variables but not their trait (LOTI for example)


## [1.17.13.5] - 2023-3-15

### Fixed
- Non Random Combats now doesn't interfere with Increase Level Number and potentially with other features or addons that uses "unit placed" event.
- Ambush icon displays active or inactive correctly when a unit that already have the icon is placed.
- Wmllint fixes


## [1.17.13.4] - 2023-3-8

### Added
- New Tool: Custom Labels. Allows players to create labels with custom color, tooltip and category anywhere with right click.

### Changed
- Excluded Deorien of ANO from promotable units.
- Import/Export unit moved to Tools section and removed from initial Options menu (So, Help Menu is mandatory).


## [1.17.13.3] - 2023-3-4

### Changed
- Better main icon, using original image of Battle of Agincourt.
- Help and Tools menu with option icons.
- Some fixes on Help Menu text.


## [1.17.13.2] - 2023-3-3

### Added
- New option: Passive XP for low level units. You can set a maximum level to receive a different amount of experience than the other units, for balance.

### Changed
- Leader AI orders now only appears when the leader is selected (instead of on every free hexagon), except for "move here".
- "Choose human side" option now is selected by default on Setup AI.
- Moved Non-Fatal Wounds option to a subsection, only visible with the addon installed.

### Fixed
- Simplified regeneration macro.
- More confiable behavior between scenarios. AI is always removed on victory/next prestart events because is linked to side numbers and leaders id, and this can change. Setup again the AI every scenario, this is impossible to do automatically and compatible with all possible scenarios.
- Fixed false positives of camouflage bonus if is present a ghost from Non-Fatal Wounds.
- Fixed error when loyal or fearless is applied multiple times with manual AMLA bonus.


## [1.17.13.1] - 2023-2-24

### Added
- New Tool: Side AI Controller (adapted deprecated mainline MACRO) and Leader AI Controller (from Beetlenaut https://forums.wesnoth.org/viewtopic.php?t=54533)
- New contextual menu option: Give advancements. Activable only via Help Menu. This is useful to manually give or update advancements for certain situations when the units change from AI to human, or changes his abilities, etc.

### Fixed
- Dominant leaders of WoF S03 doesn't receive AMLA icon
- One more check to ambush icon (preload event). Now only remains 1 use case to solve, when ability_type_active=hide is active, variable preambush=yes is active, but status uncovered=yes. Reported on https://github.com/wesnoth/wesnoth/issues/7400


## [1.17.13] - 2023-2-20

### Added
- New option of Recall cost: Recruit cost percentage. Now you can set the unit recall cost as a percentage of the recruit cost.
- Message on screen when any option is changed, if doesn't exist a lua message already.

### Changed
- Level Up Notification now has 3 variants ("Level up", "AMLA", and "Advance")

### Fixed
- Fixed error with recall cost of Captured units (non fatal wounds) when Recruit cost is changed on mid of a scenario.
- Removed regeneration or distraction of epic heroes if gains the same or better ability on advancements or events.
- Removed unrecall menu option when is deactivated on mid of a scenario.
- Excluded leadership changes to EoMa units with custom leadership abilities.
- Fixed berserk rounds number change doesn't working with units recruited or spawned on mid of a scenario.


## [1.17.12.2] - 2023-2-15

### Added
- Changed/Added option: Random Bonuses are now simply Bonuses. You can choose if you want them random or manual and the % of max exp increased. All of them have icons.
- New option: optional Random Bonuses on wound healing. Only with Non Fatal Wounds extended active.
- New option: Experience to IA leaders. Only available on Help Menu.
- New AMLA Bonuses: Slows on cold type attacks, camouflage (all hides abilities together on one) on units that have any hidden ability or ghosts.

### Changed
- Berserk rounds on options menu changed to 1-30. On help menu still can be changed to 0 or higher numbers.
- Learning from Battlefield and Healing now is received at the end of every turn for the current side (part of multiplayer fix).
- [aww_remove_object] changed to list separated by commas, less code and more readable.

### Fixed
- Fixed bug when in some situations a unit with ambush icon would lose its status.
- Fix leadership with Increase Level Number doesn't applies correctly on NR S06a and other similar situations.
- Ro'Sothian now is an Epic hero when is a enemy too (NR S07)
- Prevent regeneration of Starlag on NR S07 if becomes Epic.
- Best compatibility with multiplayer for AMLA Bonus and Passive XP.


## [1.17.12.1] - 2023-1-30

### Added
- New option: Back to reserve.
- Eloh and Yechnagoth can be epic now too. Note that Eloh will regenerates after Kaleh attack.
- Added support to define, to allow other mods detect AWW. Symbol: ADVANCED_WESNOTH_WARS
- Animation (recruit) and float text on deserters.

### Changed
- Better translation of leadership and inspire to other languages
- Animation (levelin) and float text for Promoted Leaders. Removed "Chief" addition on name.
- On 1.17, changed method of upload addon. Reset downloads: 83

### Fixed
- Restored old support for addon "Heroes: The Iron Bulwark", available on 1.16
- Verbose option moved from start menu to help menu, and fixed (before, apparently doesn't work).


## [1.17.12] - 2023-1-25

### Added
- Animation (healing) and float text when experience is gaining by healing. Can be changed on help menu.

### Changed
- Adrenaline as AMLA bonus only for units with 4 or more strikes on melee attacks.
- Epic! trait is now granted on start or later, so the player allways can see which units receive the trait

### Fixed
- Fixed AI units on recall list getting passive XP, and they shouldn't (only on single player)
- Chief + name string to translate
- Delete duplication of floating notifications, and more foolproof functioning


## [1.17.11.4] - 2023-1-16

### Added
- Scroll when any float text is displayed in a visible place (without fog), for example Floating Notifications feature. Only exception is "Rampage!" and screams of Fury ability.

### Changed
- AMLA Bonus probabilities adjusted.
- Restored better ambush icon for 1.16.7 and last 1.17 version. Old method will be used on older versions. This works dinamically, the player don't need to do anything, but is preferable to update the game to the last version.

### Fixed
- Some events are more foolproof.
- Fixed error when try to activate and deactivate some features on 1.16 because a lua command for 1.17 only.
- Fixed ambush doesn't do surprise attack if the unit has been ambushed the same turn or other situations when loses his remaining attacks.
- Some fixes to 4p Ruvaak scenario: Better translation, avoid duplicated and not working traits to 'Best friends', mermaids with excess of experience.


## [1.17.11.3] - 2023-1-8

### Added
- New Tools: Base income, Village income and Village support. Base income applies inmediately, the others on next scenario.

### Changed
- First strike as AMLA Bonus now is given only to units with few attacks (1-2)
- Melee and Ranged Strikes +1 as AMLA Bonus now is given only to units with 3 or less strikes.
- Melee and Ranged Damage +2/+3 as AMLA Bonus now is given only to units with 3 or more strikes.

### Fixed
- Surprise Attack now doesn't reload on unit placed or advance. Preserves the previous status correctly.
- Surprise Attack now doesn't reload when do a normal attack, instead the cooldown turns is added to the previous accumulated.
- Removed Regeneration on Ras-Tabahn on SotA S16
- Fixed acumulation of ambush icon object, no real effect.
- Now Tools reflect the changed values inmediately, not on the next scenario.


## [1.17.11.1] - 2023-1-3

### Fixed
- Submerge ability is now fully compatible with Surprise Attack icon.
- Cleaner code for ambush icon.
- Fixed recall cost when a unit level up AMLA with Increase Level Number active, exceeding the maximum level to cost reduction, that the following scenario still maintains the previous reduced recall cost.


## [1.17.11] - 2023-1-2

### Added
- New Option: Move units between campaigns, by Dugi. Translated, with some fixes, and the possibility to remove incompatible units.
- New Option: Change combat rounds of standard berserk ability.
- New Feature: Tools on Help Menu. Utility to activate Fast AI, change poison HP damage, change HP recovered by resting, change default recall cost, and change experience gained fighting or killing units.
- Icons on Help Menu. On AMLA Bonus, Promoted Leaders and Surprise Attacks, the icon is the same used on the unit, for reference.
- New AMLA Bonus: Marksman

### Changed
- Reorganized help menu.
- Reorganized options menu. All options except Floating Notifications and Help Menu defaults to deactivated or standard values.
- Removed Bloodthirsty kills from Options menu, but still can be changed via Help Menu. Defaults to 5 kills.
- New Surprise Attack method. Now the ambusher do all his corresponding strikes with the probability, damage, and status effects that corresponds with all modifiers and abilities applied, without the victim being able to defend himself as before.
- Surprise attack availability is indicated by an eye icon. Thanks to Jeremias for the icon. Nightstalk, ninja, some custom abilities based on hides, and doing undo may causes show the icon on wrong places. The next BoW update, 1.17.12, will fix a crash caused by a more efficient method, which will be incorporated in the future.
- Cooldown turns of Surprise Attacks can be changed via help menu. Defaults to 2 surprise attack / 1 normal attack.
- Amount of experience gained per healed unit with Learning from healing can be changed on Help Menu. Defaults to 1.
- Recall cost "Half" now is true half of recall cost, instead of allways 10 (wesnoth.game_config.recall_cost / 2)

### Fixed
- Help menu character error, fixed on 1.17 to avoid having two separate releases.
- Better Heroes filter.
- Swarm fixed, and better code and description for Squad and Swarm. Now Swarm ignores attacks that already have swarm, as Squad does, and it is reflected in the descriptions.
- Slightly reduced loyal AMLA bonus probability.
- Remove accumulation of leadership objects. It only saves lines of code, has no real effect.


## [1.17.10] - 2022-12-17

### Added
- New Option: Epic Heroes for Promoted Leaders now is optional.
- New Option: Desertions

### Changed
- Help Menu visually improved.
- Increase Level Number can be restored.
- Better damage calculation on Surprise Attacks. All damage modifiers are taken in account, except leadership. Simplified and cleaner code. Also, if an ambusher kills the victim, the other adjacent ambushers will not attempt to attack, and will remain hidden.
- Default status of Village line of sight changed to yes. Default status of Fury changed to no.

### Fixed
- Excluded SoF Caravans from receiving the epic trait.
- Compatibility between "Captured" wound from Non-Fatal Wounds: Extended and Change Recall Cost. Now applies the ransom cost.
- Compatibility between "Insane" wound from Non-Fatal Wounds: Extended and Fury. Now fury is ommited on insane wounded units, even if already owns berserker.
- Compatibility between "Fear of weapon" wound from Non-Fatal Wounds: Extended and Suprise Attacks. Now this wound doesn't applies to Surprise Attack kills.


## [1.17.9] - 2022-12-11

### Added
- New Option: Leadership/Inspire max level. This abilities now have a cap level when Increase Level Number is active, applied to all units in the game, not just the ones that received the AMLA Bonus like before. It is no longer necessary to edit the leadership ability as I explained in the forum. This level can be changed at any time with immediate effect.
- Help menu now includes possibility of change status of Epic Heroes, AMLA Bonus and NINJA WARS! with guaranteed behavior.
- New options to manage some features, better presentation and usability.
- Midnight Queen from TROW added to Epic Heroes.

### Changed
- Increased probability of loyal bonus, but only for level 3 units or higher.
- General probability adjustment, after enough tests.
- Ability Camouflage from NINJA WARS! now applies on giant mushrooms too.
- Poison is not granted to units with charge or other attack bonus.

### Fixed
- Now options changed via Help Menu keeps changed on next scenarios.
- Change status of features that implies remove objects or traits, now works with the recall list, an error present from the original version. Now I can include this on Help Menu with guaranteed behavior.
- Fixed bug when Epic Heroes without regeneration and distraction applies "epic" twelve.
- Restored description on Ninja trait, reduced backstab from +100% to +50% to units that did not have backstab, add diversion ability to units that already have backstab or poison, skirmisher on units without distraction, and all specials with italics, as any other special, trait or ability from AWW, indicating that it is reversible.
- Fixed typo on Promoted Leader that messed up its proper functioning, a severe error from 1.17.8
- Better and cleaner code, removed unused macros, simplified functions, better and more precise text, typos fixed, etc.


## [1.17.8] - 2022-12-7

### Added
- Help menu now includes possibility of change status of Non Random Combats, Squad Mode, Promoted Leaders, Increase Level Number and Floating Notifications.

### Changed
- Option to set maximum level of unit getting the recall cost feature.
- Changed cooldown of ambushes from 2 turn to 1 turn when the ambusher do a normal attack. When attacking in ambushes, the cooldown is still 2 turns. Fixed the tooltip accordingly, which was also wrong (it said it had a 1 turn cooldown and it's actually 2).

### Fixed
- Villages line of sight now take in account villages captured by neutrals.
- Last deprecation messages fixed. Guaranteed compatibility with future 1.19
- Fixed an old bug when disabling Non Random Combats


## [1.17.7] - 2022-12-2

### Changed
- Fury ability changed to object, to easier and simplified management.
- Changed Bloodthirsty exclamations for a more generic screams, non specific to Ulfsekers.
- Bloodthirsty is not granted to weapons that already have a drain ability.
- Better organized Help Menu.

### Fixed
- Capture villages now can be undo (except when some fog is lifted, of course)
- Now ambushers get experience from the ambush just like the ambushed, a bug present from 1.14
- Fixed typo not giving bronze bracelet to AMLA units with bonus on 1.17.6


## [1.17.6] - 2022-11-28

### Added
- Some settings can be changed on any moment via help menu. Changing settings involving lua commands are left for debugging purposes, but not via help menu.
- New feature: Villages line of sight, with configurable distance, to the owner side.
- Villages and Change recall cost of level 0 units included on help menu.

### Changed
- Distract and regenerates now is given separately, to filter if the unit already has this ability, to not duplicate.
- Changed obsolete lua commands to their equivalents.

### Fixed
- New method to detect human and ai players for give passive XP, now works as intended on multiplayer.
- When a unit gains "Epic!", now the action can't be undo.
- Gifted Heroes now is triggered on start too, to give "Epic!" to units who receives golden crown at an event before placed. If the unit receives a golden/silver crown or canrecruit=yes on mid of a scenario, receives the epic trait on the next scenario. 
- Better detection of Captured scenario from Eastern Invasion, mainline and Revised.


## [1.17.5] - 2022-11-23

### Added
- New option: Help Menu. You can read help about all features, and current status of every option. Accesible via right-click at any moment.
- New option: Change recall cost of level 0 units (free, 10, recruit cost+1 or not changed). Based on lua code from https://github.com/fluffbeast/Recall_Cost

### Changed
- With Ninja Wars!, now units receives basic Skirmisher ability instead of Distract, as the description of Ninja trait says.

### Fixed
- Typo on Fearless. Now it is not gifted to neutrals.
- Passed wmllint and wmlindent for better code.
- Better description of the features, adapted to new Help Menu.


## [1.17.4] - 2022-11-19

### Added
- New AMLA Bonus: Fearless. Only for non-neutral units.

### Changed
- AMLA Bonus Melee and Ranged Damage value increased (+3 Melee and +2 Ranged) and reduced their respective probabilities.
- AMLA Bonus loyal, poison, leadership and first strike are now shown in italics, like the rest of the traits and abilities granted by this addon. This mean that can be removed via debug commands.
- With AMLA Leadership bonus now max leadership value used is 5 on the calculation. Original game leadership still can lead a 0 level unit with an 10-level unit with an amazing 250% extra damage bonus. I suggest you to change the code by yourself (read forum).
- Leadership bonus only for units with level 3 or superior. Only to units with level 5 or superior with AMLA increment number active. This bonus on low-level units is a waste and unrealistic.
- Bloodthirsty as AMLA Bonus changed with Adrenaline, that heals on every hit 4 points instead of drains % from living units only, and only applies to melee. This is more usable for all factions, because Bloodthirsty is useless against undead. Bloodthirsty Fury effect still remains untouched.
- Renamed swarm squad to squad. Type swarm is specified on description.
- More compact and legible help with No Random Combats and Squad Mode.
- Removed the extra % of increasing every AMLA level (1.16.0), because with separated extra XP between IA and human can be balanced better.

### Fixed
- Loyal trait translations
- Better text and translations on some places, included french
- Fixed misbehavior on Ambush script with "illuminates" units when are ambushed by units hiding on the night. Now this type of units can suffer a Surprise attack.
- Fixed traits Loyal and Fearless that can be duplicated.
- Support of float text with experience gained on Healing XP for healers without healing animation.


## [1.17.3.1] - 2022-11-16	

### Fixed
- Fixed serious typo on AMLA bonus that prevents for working, only present on 1.17.3


## [1.17.3] - 2022-11-16	

### Added	
- New option to set minimum level to be Promoted Leader (compatible with AMLA Increase Level Number).
- New AMLA Bonus: Loyal (with debug removal support).

### Changed
- Removed status message at every new scenario or loading savegame. Still can be accesed on Lua console with aww_status.message_info()
- Changed Bronze Crown icon for Promoted Leaders for a better one, and loyal units have a Bronze Crown + Loyal Bracelet.
- Bloodthirsty as AMLA Bonus reward nerfed to 20% absorption, can be used on offense and defense, and changed duration from only one scenario to forever. Bloodthirsty as Fury effect remains the same (Drains 50%, only offense, and 1 scenario duration).
- Filtered 'Captured' scenario from 'Eastern Invasion' campaign, to prevent massive gain of XP due to the presence of all your army on a stage during the section without turn limit. This only affect to AI Passive XP, your three initial units and released prisoners still gains the Passive XP set for human players. 
Note: Exploits are possible in scenarios with no turn limit in general, but it is up to the player himself not to abuse them. In the case of this scenario, it can't be avoided, so I decided to disable it.

### Fixed
- Fixed log errors with Ambush Tweak (present since old versions), that did not affect the gameplay but saturated the log file.
- Ambushers now do an attack animation.


## [1.17.2] - 2022-11-13	

### Added	
- New option to choice if you want regeneration and distraction for Epic Heroes by default or not (still can be acquired via AMLA Bonus).
- New option to choice how many Passive XP can gain AI units, independent of Passive XP for human players.
- Units with AMLA Bonus now gets an icon with small bronze bracelet (except Heroes and Promoted Leaders).

### Changed
- Now AMLA Bonus will not have redundant or useless rewards (such as an ability that already exists, or ranged attack points/strikes to a unit without ranged attacks, or poison when no pierce/blade weapon present)
- Learning from healing XP now can learn from poisoned units that are cured or slowed.
- Bronze crown on Promoted Leaders now works (before all of them gets gold crowns).
- Bronze crown icon adjusted, now units with mixed icons can be better differentiated (Bronze+Loyal or Bronze+Crown).

### Fixed
- French po file adapted to the new updates, but still need translation of the new strings (If you can help, write me)


## [1.17.1] - 2022-11-8	

### Added	
- Number of kills needed with Fury ability to gain Bloodthirsty now can be set on options menu. The set number is reflected in the ability description.

### Changed
- Compatible and released on 1.16 and 1.17

### Fixed
- Fixed multiplayer map folder, that could not be started.
- Moving a unit that can hide now does not disables undo action.


## [1.17.0] - 2022-11-7	

### Changed
- Ambush tweak behavior changed, and new method more foolproof. Now all unit can ambush normally without cooldown, but surprise attacks mantains his cooldown.
- Better descriptions on some features.
- Changed deprecated commands, tags and functions to the latest ones.
- Clearer and tidier settings menu.

### Fixed
- When a unit levels up and gains ambush ability, now can't do surprise attacks being visible. Also fixed false positive when the unit without cooldown stops an enemy in its zone of control being visible by a different enemy, who performs a surprise attack that it should not do.


## [1.16.1] - 2022-11-1	

### Fixed
- When AMLA number increase feature is active the maximum level is preserved when the unit is rebuilt for any reason
- New method to increase level number, more foolproof
- Typo on mod title
- Updated and fixed some translations


## [1.16.0] - 2022-10-30	

### Added	
- Messages with portrait of the character that levels up and receives an AMLA bonus (english and spanish, but not french)
- Spanish translation (complete)

### Changed
- Epic trait now doesn't increases attack hits by 20%, only attack damage
- All stat bonuses now are [object] for better compatibility between maps
- AI gets 2*X (double) passive experience if you activates the feature, for balancing
- Level up increases (10*X)% (+10%, +20%, etc.) max experience (requires for next level) if you activates AMLA number increase feature, AMLA bonus, and passive experience together, in addition to the +20% increase by default, for balancing

X = passive experience value you selected

### Fixed
- Fixed some typos on the code, the included on RusackN1 fork and some others
- Max movement points bonus now preserved between maps
- When AMLA number increase feature is active the level is preserved when the unit is rebuilt for any reason (for example when a temporary [object] as bloodthirsty or potions is removed from the unit)
- Prevent Injured Sergeant to level-up by gaining passive xp (Campaigns)


## [1.14.15.1] - 2019-10-19

### Added
- Feature #01 : damage table on attack description
- Feature #01 : special hit 100% not cumulative

### Changed
- hit chance on special attack (magic etc) will be the minimum and not the absolute

## [1.14.14.5] - 2019-05-04

### Fixed
- Berserk tweak : reset ratio/kills/bloodthirsty when unit is recalled/next scenario


## [1.14.14.4] - 2019-04-20

### Changed
- Some float text colors
- Colors or trait name epic (gold), squad swarm special (cyan) on units properties.
- All traits (epic, ninja) and abilities/weapons-special (fury, bloodthirsty, distract, camouflage, custom regen...) defined in the mod are in italic on unit properties, to make a distinction from what was added by the mod.

### Fixed
- Optimised disabling of Feature #12 Berserk Tweak

### Deleted
- old lua/aww_combats.lua


## [1.14.14.3] - 2019-04-16

### Fixed
- Bug reported by Hammerfritz where hit chance was put in 100% in the case "No Random Combats" was disabled, but "Squad Mode" was.
- Bug on "#08 : damage adjustement" not always taken in account
- Bug aww_status.migrate() was always executed.


## [1.14.14.2] - 2019-04-14

### Added
- Feature #12 Berserk Tweak : dwarf laugh when a fury-wearer unit kill someone.

### Changed
- Feature #11, ninja, #10 Epic : found a way to enable / remove trait
- re-enabled "stealthy" trait (renamed "ninja") for Feature #11
- Feature #06 : Level-Up : Relative Healing disabled by default, as it can break balance of campaigns.

### Fixed
- Minor error on migrating version of a savegame
- Bad display information for Passive XP on chat message.
- Bloodthirsty was added after first kill instead of 5th on feature #12 Berserk tweak


## [1.14.14.1] - 2019-04-13

### Changed
- re-balanced Feature #12 (Berserk tweak) : no more initial offensive drains, base attacks damage don't increase on kills, but after 5 kills the fury attack gains also Bloodthirsty (offensive drains)
- Feature #11, ninja : movement increase is used in [object] like the others changes,  don't include a 'stealthy' trait anymore.
- improved aww_status.update_feature_07()  and update_feature_08()
- Re-balance feature #9 AMLA bonus : in case it get the bloodthirsty special attack, apply only for current scenario

### Fixed
- Minor error on migrating version of a savegame
- Bad display information for Passive XP on chat message.


## [1.14.14.0] - 2019-04-13 (BfW 1.14.7 released)

### Added
- Feature #15 : Level-Up After Max Level Advancement : Increase Level Number (default ON)
- Explanations in README.md and code adaption (aww_status.lua, aww_duel.lua) to enabled/disable feature during a game/campaign
- aww_status.run.lua (to separate aww_status declaration from execution)
- aww_status.lua : some functions to manage disable/enable features
- events _enable _restart, _reset on most features impacting units, to revert / re-enable changes (experimental)

### Changed
- Feature #13 : Ambush Tweak no longer in beta, added hides cooldown of 1 turn after surprise/normal attack
- Options numbers are now the same as feature numbers.
- Squad Mode Custom : strikes special effect is now a cumulative multiplier, instead of a not-cumulative
- Squad Mode : Swarm : attacks having 1 base strike will do reduced HP-related damages, like in Custom Mode.
- NoRandomCombats & Squad Mode : added + 0.01 to multiplier to prevent a round down and get a round(.5)
- Feature "Gifted heroes" renamed "Epic heroes"
- balancing Epic heroes : don't include anymore "leadership" ability (already give custom regen 4/slowed + distract)
- Some adjustments on gifted trait stats, and renamed it "epic"
- Max attack damage points earned with "Fury" changed from 15 to 10
- Somes changes in scenario + map 4p_Ruvaak_Mirage_Atoll (now v1.4)
- gettext : textdomains wesnoth-aww and wesnoth-aww-rma merged in one "aww" (and scenario translation reworks)
- macro files *.ma.cfg renamed *.mac.cfg
- uses of [objects] in some features, for effects/abilities
- Features #09 AMLA Random Bonuses : less probabiities to have moves +1

### Fixed
- LUA error sometimes in the end of scenario when NoRandom-Combats/Squad Mode Custom is enabled and no side is defined : (Saw Voyage of a drake > skip tutorial)
- Healing XP : apply to ability-type "heals" instead of only ability id "healing". Optimized not-poisoned filter.

### Deleted
- useless about.cfg


## [1.14.13.0] - 2019-04-04

### Added
- Ability 'distract' for "Gifted Leader". It's a Skirmisher leadership from data/campaigns/The_Rise_Of_Wesnoth/utils/trow-abilities.cfg
- Ability 'leadership' for "Gifted Leader"

### Changed
- Completely changed the "berserk tweak"
- Update french translations
- Ability 'distract' instead of 'skirmisher' for "NINJA WARS!" & "ALMA Random Bonus"
- ability name for camouflage changed from "ambush" to "aww_ability_camouflage"

### Fixed
- Issue reported by Hammerfriz: Squad Mode Custom was not working sometimes (special set to cumulative=false)


## [1.14.12.6] - 2019-03-31

### Changed
- "10. Berserk tweak : Fury" becomes : "10. Berserk tweak : Fury & Drains & Drains"
- "7. Epic heroes" : + leadership ability


## [1.14.12.5] - 2019-03-31

### Added
- Estimations of damages on each weapons (No Random Combats or Squad Mode except if Squad Mode : Swarm chosen)
    - on events : select,sighted,advance,recruit, attack end (for both units)
    - Note : "select" do not apply on enemy unit.
- translation strings in LUA script
- 100% french translated ! Cocorico !

### Changed
- some variables names in aww_duel.lua : notion of constants uppercases
- some french trads

### Fixed
- clear aww_bonus_rand variable after each use (optimisation) (09_amla_bonus)
- lua errors on hit_chance calculation with marksmanshit units (No Random Combats)


## [1.14.12.4] - 2019-03-30

### Fixed
- fix on "Promoted Leaders" : take in account Heroes (to exclude them) not having hero ellipse but overlays icon.


## [1.14.12.3] - 2019-03-29

### Changed
- "Promoted Leaders" : Warning about using it in Campaigns. units who can recruits disapears in The_Rise_Of_Wesnoth : 15_A_New_Land

### Fixed
- retrocompatiblity if a player update from mod in the middle of a campaign
- bug reported by Trossknecht : The_Rise_Of_Wesnoth heroes are not declared properly as Heroes, so I put them in exception list for feature "Promoted Leaders"


## [1.14.12.2] - 2019-03-24

### Changed
- French translations improvements
- Scenario 4p_Ruvaak_Mirage_Atoll : changed default starting gold, from 100 to 200.

### Fixed
- Better retrocompatibilty for features "passive XP" and "healing XP"


## [1.14.12.1] - 2019-03-24

### Added
- Translations support
- French translations

### Changed
- Minors changes on descriptions
- Minors changes on scenario 4p_Ruvaak_Mirage_Atoll.cfg, passing it to v1.3
- macro items.ma.cfg OBJ_TEMPEST_TRIDENT become AWW_OBJ_TEMPEST_TRIDENT with parameters for damages & strikes


## [1.14.12.0] - 2019-03-24

### Added
- Squad (swarm) alternative mode for (Health-based Hits number)
- macros files filters.ma.cfg, setters.ma.cfg
- Feature 12 : Berserk Fix - limit to 0-3 extra attacks
- Feature 13 : Ambushed fix - surprise Attacks (beta)
- Feature 14 : Level-Up Notification on unit
- floating text (and 2 macros for it) on some events
- .editorconfig
- a "Dev Mode" allowing to use dynamic lua file. Create a empty aww.dev file in parent add-ons/ directory to enable it.

### Changed
- By default, LUA files will be included in savegame package (MP / retrocompat optimisation)
- (Health) based Hits) become Squad Mode with a choice between No, Advanced, and Squad (swarm). Advanced is the first made and the one by default (Health-based Hits number)
- Complete rework of LUA script for no-random combats & Squad Mode
- Preview of the damage during/after attack with features 1-2 as Weapon Specials
- (Health) based Hits) Will not apply for berserk, neither "swarm" in 'Custom' algoritm.
- change aww_combats.lua to exlucude swarm mode instead of calculated strikes. (Health-based Hits)
- Promoted leader use the extra_recruit_list defined on main leader, (cf Orchish Incursion cs1) and refresh it on new scenario
- Some macros for detecting hero/loyal-icon in macro (Promoted Leader)
- more filter/filter_condition for lauching events than test inside the event (optimisations)
- Renamed most files in macros/ and mods/. Pure Macros files are suffixed .ma.cfg now.
- Renamed almost all event.id(s) and mods options names
- Renamed some option variables (the most recent)
- Renamed macros.*.cfg => macros/*.ma.cfg
- Ninja mode : now backstab only apply on blade/pierce melee weapons not having charge/berserk
- Ninja mode : now poison only apply on pierce-ranged weapons not having charge/berserk
- Some edit on scenario 4p_Ruvaak_Mirage_Atoll


## [1.14.11.3] - 2019-03-17

### Changed
- Refactoring/optimizations of all WML code
- 'Epic heroes' now also apply to Heroes (silver crowns) and all leaders (except Promoted ones). Option name is now "Epic heroes".
- Renamed leader-crown-promoted.png to aww-leader-crown-alt.png (Promoted Heroes) like in core name, with just a prefix.
- Events in preload and now in start, to synchronize MP and making the map loading less long.


## [1.14.11.2] - 2019-03-17

### Added
- macros/constants.cfg
- images/misc/leader-crown-promoted.png - a copy of core images/misc/leader-crown-alt.png. This image is never used anymore in Wesnoth, so I guess it can be be remove at any version, that's why the copy.

### Changed
- Unit texts when unstored re-enabled (for Gifted!, Ninja! and LEVEL UP! healing reduced), but will apply only if same side.
- Bronze crown instead of silver one for Promoted Leader. Will still display the "loyal" marker. (Promoted Leaders)
- adjustements of random bonuses in amla_extra_bonus (less mouvements chances, no -1 damage for +1 strike)
- improvement movement +1 every advancement  (instead of a initial 20%) for 'stealth' trait (Ninja Wars)
- renamed gifted_leaders.cfg to leader_gifted.cfg (to follow naming convention) Gifted Leaders)
- 'gifted' hh regeneration changed from 5 to 4, to fit more wesnoth standards. (Gifted Leaders)
- trait "chief" renamed to "recruiter" (Promoted Leaders)
- Disabled level-up symbols in unit names (Random Bonuses AMLA)
- Management of missing lua file (retro-compat old saves games using new addon version)

### Fixed
- Healers could get XP from wounded ennemy (Healing XP)
- Bad variable tested in pre advance (Promoted Leaders)


## [1.14.11.1] - 2019-03-17

### Added
- Feature #10 (option 7) : Gifted Starting Leaders
- Feature #11 (option 10) : Ninja Wars! (Stealthy units)
- "chief" trait  (Promoted Leaders)

### Changed
- 'Promoted Leaders' now only only apply AFTER level 3 AND first AMLA level-up
- 'Healing XP' works now a different way : you define the max xp/turn each healer can get (and wil get 1 by heal), instead of defininf the XP for each heal
- Flipped order of option 5 & 6
- More readable options titles and descriptions, prefixed with "Level-Up :" the accurate options


### Fixed
- aww_combats.lua : Option "Health-based Hit Numbers" will never apply for "swarm" special attack.


## [1.14.10.2] - 2019-03-17

### Changed
- Increased damage option minimum range, from 0 to -20%
- Disabled text floating around unit for level-up, I need to test if it can appears to others players in PvP even with fog.

### Fixed
- fixed bug when randomless damage is enabled without option 'Health-base Hits number'


## [1.14.10.1] - 2019-03-17

### Changed
- Bonuses for the new options


## [1.14.10.0] - 2019-03-16

### Added
- New Optional Feature : "Level-Up Bonuses After Max Level Advancement". in mods/amla_extra_bonus.cfg
- Reintroduced on maps/scenario 4p_Ruvaak_Mirage_Atoll after lot of changes. A perfect mod introduction.

### Changed
- Healers XP : max 1 XP by turn
- Renamed "Advance Wesnoth Wars mods" to "Advanced Wesnoth Wars" (added the "d") on _server.pbl : title for Extension Manager.
- Renamed "Advance Wesnoth Wars" to "Advanced Wesnoth Wars" (added the "d") on _main.cfg : modification.name
- Change max value for the 2 XP options from 2 to 3
- Changed default value for 'No Random Combats : Increased Damage' from 10 to 0, to maintain a better "average damage balance" with original combat system.
- re-enabled maps and scenarios, as it is a good introduction to the mod.

### Fixed
- bad debug function called in case of backup error (this should never happens anyway)


## [1.14.9.4] - 2019-03-14

### Changed
- "Random Combats : Terrains Defense Reduction" option renamed "Increased Damage". Variables names not changed.
- applied this bonus to all attacks, even for fixed hits % not depending on terrain (like Magic)
- aww_get_healthy_strikes now returns a rounded result on 0.5, not rounded up
- big refactoring, more human-readable code in lua/aww_combats.lua.
    - Separated functions aww_calculate_* and aww_get_* (who returns rounded result)
    - all functions put in wesnoth. domain for reusability in external scripts


## [1.14.9.3] - 2019-03-16

### Changed
- Relative Healing on Level-Up : statuses are cured, not maintained.


## [1.14.9.2] - 2019-03-16

### Changed
- More readable loading message.
- Default Terrain Defense Reduction: from 20 to 10.
- Color of unit text on healing Xp and Level-Up to RGB 0,150,225 (lighter blue)

### Added
- lua/aww_info.lua
- about.cfg

### Renamed
- mods/resume.cfg => mods/info.cfg


## [1.14.9.1] - 2019-03-10

### Changed
- disabled map & scenario loading (not the point of this mod)

### Fixed
- fix issue in resume.cfg
- fix cpp issue in 4p_Ruvaak_Mirage_Atoll.map


## [1.14.9.0] - 2019-03-10

### Added
- Optional feature "Terrains Bonus Reduction" for  'No Random Combats'
- moved [options] in a separated file ./mods/options.cfg

### Changed
- Options label/descriptions
- Sliders max values decreased to avoid it completely breaks game balance


## [1.14.8.2] - 2019-03-09

### Fixed
- Healing XP : no XP points gained for poisoned units (healer don't always cures, and can be exploited to gain lot of XP)
- aww_combats.lua : LUA error happening occasionally on array index, add index test before searching further in array


## [1.14.8.1] - 2019-03-09

### Changed
- function debug_message() renamed aww_debug_message() to avoid conflicts with addons
- In aww_combat.lu:aww_debug_message(), no do launch combat message for players not owning the attacking unit
- More readdable debug message
- Add description of this option 7 in various locations

### Added
- Optional Feature & Option : Debug messages (Attacks calculations). Disabled by default
- PvPvE scenario + map : 4p_Ruvaak_Mirage_Atoll
- Recap about options valus at map startup.
- Splitted _main.cfg in one file by features in mods/

### Changed
- Refactoring of LUA scripts, the 3 scripts for combats are merged in one, with conditions
- Files split in lot of different files
- Recap message in LUA about mod options values at game (re)loading.
- LUA : wesnoth.message("Advance Wesnoth Wars", x) proper message prefixes.
- Introducing an option to enable debug messages (damage calculations etc)

### Deleted
- previous lua scripts for combats, now they are all merged in one.


## [1.14.7.3] - 2019-03-09

### Changed
- "Differential Healing on Level-Up" option label become "Relative Healing on Level-Up""
- Changed calculation of "Differential Healing on Level-Up" to be based on reporting lack of HP (like in 1.14.1) OR  keeping current HP if new advancement have less max_hitpoints than the previous one.
- Options descriptions are in tooltips now, not the name, so window size is not enlarged.


## [1.14.7.2] - 2019-03-09

### Changed
- Changed calculation of "Differential Healing on Level-Up" to be based on a ratio previous hp / max_hp, to not kill units advancing with less HP.
- Options descriptions are in the proper tooltip now, not the name.

### Fixed
- No opportunity to do a division by 0 in aww_healthy_combats.lua and aww_randomless_healthy_combats.lua (in case of bad function parameters)


## [1.14.7.1] - 2019-03-09

### Changed
- "No Full Heal on Advancement" become "Differential Healing on Level-Up"
- Changed calculation of this feature and HP given, and description of it


## [1.14.7] - 2019-03-09

### Added
- Optional Feature : "No Full Heal on Advancement". Enabled by default.

### Changed
- Caption text for xp earned by healers, just indicate in blue XP earned for each


## [1.14.6] - 2019-03-09

### Changed
- Rounding Up (instead of rounding on .5) strikes number for Health-based Damages
- Promote Leader : prefix changed from "Sir" to "Chief"
- Promote Leader : found a way to filter heroes bases on their ellipse

### Deleted
- images/misc/ellipse-leader-nozoc*.png copied/pasted by mistake.


## [1.14.5] - 2019-03-09

### Changed
- "Promote Leader" don't force their upkeep free.


## [1.14.4] - 2019-03-09

### Changed
- "Health-based" option impact on number of strikes, not damage of theses strikes (except with weapon having a single big strike)
- "Health-based Combats" option description changed


## [1.14.3] - 2019-03-05

### Changed
- Promote Leader option exclude most Heroes (silver crown) from promotion, of base game & "To Lands Unknown" Campaigns.
- Description for Promote Leader option


## [1.14.2] - 2019-03-09

### Fixed
- Promoted Leader are re-prefixed "Sir" (bug introduced in version 1.14.1)


## [1.14.1] - 2019-03-09

### Changed
- Default value for "Learning from battlefield" changed from 1 to 0. Can still be change in options.
### Fixed
- No messages about damage calculation


## [1.14.0] - 2019-03-09

### Added
- script `lua/aww_healthy_combats.lua`
- Conditions to run health-based combats keeping the RNG random misses
- this CHANGELOG.md file
- debug message when combats modifications script is loaded, identifying which one is
- debug message explaining damage calculation on each attack

### Changed
- "Health Damage" option can be enabled independently of "Randomless Damage"
- Addon and options descriptions


## [1.0.1] - 2019-03-04

### Added
- script `lua/aww_randomless_healthy_combats`
- option "(If first option enabled) Enable Health-based Combats"

### Changed
- Dissociated "Health based Damages" and "Randomless Damages" option and script . But "Health Damage" will work only if first "Randomless Combats" is also enabled
- Addon and options descriptions


## [1.0.0] - 2019-03-03

### Changed
- Management of "Health based" Damages" added in "Randomless Damages" script for now. Only one option to enable both.
- Addon and options descriptions

### Fixed
- Various fixes


## [0.1.0] - 2019-03-02

### Added
- First release on Battle for Wesnoth Add-ons Manager.
