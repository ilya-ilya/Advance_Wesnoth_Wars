-- local helper = wesnoth.require "lua/helper.lua"
--local debug_utils = wesnoth.require '~add-ons/Wesnoth_Lua_Pack/debug_utils.lua'
local T = wml.tag
local _ = wesnoth.textdomain 'aww'

wesnoth.wml_actions.set_menu_item { id="mubc_import" ,
	description=_"Import a unit" ,
	{ "show_if" , {
		{ "not" , {
			{ "have_unit", {
				x="$x1",
				y="$y1"
			}}
		}},
		{ "variable" , { name="aww_21_dugi_mubw", equals="yes" }}
	}},
	{ "command" , { 
		{ "mubc_import_unit" ,{
			x="$x1",
			y="$y1"
		} }
	}  }
}

wesnoth.wml_actions.set_menu_item { id="mubc_export" ,
	description=_"Export the unit" ,
	{ "show_if" , {
		{ "have_unit", {
			x="$x1",
			y="$y1",
		}},
		{ "variable" , { name="aww_21_dugi_mubw", equals="yes" }}
	}},
	{ "command" , { 
		{ "mubc_export_unit" ,{
			x="$x1",
			y="$y1"
		} }
	}  }
}

function wesnoth.message_box(message)
	-- A small window that shows some announcement
	local message_box_dialog = { T.tooltip { id = "tooltip_large" }, T.helptip { id = "tooltip_large" },  maximum_height = 600, maximum_width = 800,
		T.grid { T.row { T.column { T.label { id="title" , definition="title" , label=_"Announcement"} }} ,
			T.row {	T.column { T.scroll_label { label=message} } },
			T.row { T.column { T.button { id = "cancel", label = _"Okay", tooltip=_"Back to game." } }}
		}}
	local function message_box_preshow()
	end
	local function message_box_postshow()
	end
	gui.show_dialog(message_box_dialog,message_box_preshow,message_box_postshow)
end

function wesnoth.wml_actions.mubc_export_unit(cfg)
	local unit = wesnoth.units.get(cfg.x, cfg.y).__cfg
	wesnoth.wml_actions.get_global_variable { namespace="dugi_move_units_between_campaigns", from_global="unit_list", to_local="mubc_unit_list" }
	local units = wml.variables["mubc_unit_list"]
	if units == "" then
		units = {}
	end
	local pos = 0
	unit.original_id = unit.id
	for i = 1,#units do
		if unit.id == units[i][2].original_id then
			pos = i
		end
	end
	local choice = -1
	if pos ~= 0 then
		local dialog = { T.tooltip { id = "tooltip_large" }, T.helptip { id = "tooltip_large" },  maximum_height = 600, maximum_width = 800,
			T.grid { T.row { T.column { T.label { id="title" , definition="title" , label=_"Overwrite?"} }} ,
				T.row {	T.column { T.scroll_label { label=_"A unit with that ID is already on the list of exported units. Do you want to overwrite it or give it a new ID?"} } },
				T.row { T.column { T.grid { T.row { 
					 T.column { T.button { id = "ok", label = _"Overwrite", tooltip=_"The old unit with that ID will be removed and replaced by the new one." }  },
					 T.column { T.button { id = "cancel", label = _"New ID", tooltip=_"The old unit will be kept." } }
				}}}}
			}}
		local function preshow()
		end
		local function postshow()
		end
		choice = gui.show_dialog(dialog,preshow,postshow)
		if choice == -2 then
			pos = #units + 1
		end
	else
		pos = #units + 1
	end
	local unique = false
	local random_id
	while unique == false do
		random_id = "exported_unit" .. tostring(math.random(10000000))
		unique = true
		for i = 1,#units do
			if units[i][2].id == random_id then
				unique = false
			end
		end
	end
	unit.id = random_id
	for i = 1,#unit do
		if unit[i][1] == "modifications" then
			for j = 1,#unit[i][2] do
				if unit[i][2][j][1] == "trait" then
					if unit[i][2][j][2].id == "loyal" then
						table.remove(unit[i][2],j)
						break
					end
				end
			end
		end
	end
	local new_overlays = {}
	for i in string.gmatch( unit.overlays , "[^%s,][^,]*") do
		if i ~= "misc/loyal-icon.png" and i ~= "misc/hero-icon.png" then
			new_overlays[#new_overlays+1] = i
		end
	end
	unit.overlays = table.concat(new_overlays,",")
	units[pos] = { "unit" , unit }
	wml.variables["mubc_unit_list"] = units
	wesnoth.wml_actions.set_global_variable { namespace="dugi_move_units_between_campaigns", to_global="unit_list", from_local="mubc_unit_list", immediate=true }
	wesnoth.message_box(_"The unit has been exported. It will be available to import into other campaigns.")
	wesnoth.wml_actions.clear_variable{ name="mubc_unit_list"}
end

function user_pick()
	wesnoth.wml_actions.get_global_variable { namespace="dugi_move_units_between_campaigns", from_global="unit_list", to_local="mubc_unit_list" }
	local units = wml.variables["mubc_unit_list"]
	wesnoth.wml_actions.clear_variable{ name="mubc_unit_list"}	
	local picked
	
	if units == "" then
		wesnoth.message_box(_"No units have been exported, cannot import.")
	else
		if units.show_incompatible == nil then
			units.show_incompatible = true
		end
		if units.remove_inserted == nil then
			units.remove_inserted = true
		end
		local unit_chosen = 0
		local slots = {}
		local dialog = { T.tooltip { id = "tooltip_large" }, T.helptip { id = "tooltip_large" },  maximum_height = 800, maximum_width = 1000,
			T.grid { T.row { T.column { T.label { id="title" , definition="title" , label=_"Import units"} }} ,
				T.row {	T.column { T.scroll_label { id="main_label", label=_"Select a unit to import."} } },
				T.row {	T.column { horizontal_grow = true, T.listbox { id = "unit_chosen", 
					T.list_definition { T.row { T.column { horizontal_grow = true,
						T.toggle_panel { tooltip=_"The list of units you have exported.", T.grid { T.row {
							T.column { T.image { id = "unit_image" } },
		   					T.column { T.grid { 
								T.row { T.column { horizontal_alignment = "left", T.label { id = "unit_name" } }},
								T.row { T.column { horizontal_alignment = "left", T.label { id = "unit_type" } }}
							}}
						}}}
					}}}
				}}},
				T.row {	T.column { T.toggle_button { id="show_incompatible", label=_"Show also units that aren't compatible with this campaign"} } },
				T.row {	T.column { T.toggle_button { id="remove_inserted", label=_"Remove the inserted unit or incompatible unit"} } },
				T.row { T.column { T.grid { T.row { 
					 T.column { T.button { id = "ok", label = _"Import" }  },
					 T.column { T.button { id = "cancel", label = _"Cancel" } }
				}}}}
			}}
		function preshow()
			wesnoth.set_dialog_active( false, "ok")
			local function toggle_remove_inserted()
				units.remove_inserted = wesnoth.get_dialog_value("remove_inserted")
			end
			local function select_unit()
				unit_chosen = wesnoth.get_dialog_value "unit_chosen"
				local active = true
				if slots[unit_chosen] == nil then
					active = false
				end
				if units.remove_inserted == true then
					active = true
				end
				wesnoth.set_dialog_active( active, "ok")
			end
			local function toggle_show_incompatible()
				units.show_incompatible = wesnoth.get_dialog_value("show_incompatible")
			end
			local slot = 1
			for i = 1,#units do
				if wesnoth.unit_types[units[i][2].type] then
					slots[slot] = i
					wesnoth.set_dialog_value(wesnoth.unit_types[units[i][2].type].name .. _" (level " .. wesnoth.unit_types[units[i][2].type].level .. ")" , "unit_chosen", slot , "unit_type")
					if units[i][2].name then
						wesnoth.set_dialog_value(units[i][2].name  , "unit_chosen", slot , "unit_name")
					else
						wesnoth.set_dialog_value("(unnamed)"  , "unit_chosen", slot , "unit_name")
					end
					if units[i][2].image then
						wesnoth.set_dialog_value(units[i][2].image .. "~RC(magenta>red)"  , "unit_chosen", slot , "unit_image")
					else
						wesnoth.set_dialog_value("misc/blank-hex.png"  , "unit_chosen", slot , "unit_image")
					end
					slot = slot + 1
				else
					if units.show_incompatible == true then
						wesnoth.set_dialog_value(_"INCOMPATIBLE"  , "unit_chosen", slot , "unit_type")
						wesnoth.set_dialog_value(units[i][2].name  , "unit_chosen", slot , "unit_name")
						wesnoth.set_dialog_value( "misc/blank-hex.png~BLIT(icons/terrain/terrain_group_unwalkable_30-pressed.png,21,21)"  , "unit_chosen", slot , "unit_image")
						slot = slot + 1
					end
				end
			end
			for i = 1,#units do
				if slots[i] == nil then
					wesnoth.set_dialog_value( _"The list of units you have exported.\n\n Note: Some units are incompatible with this campaign.", "main_label" )
				end
			end
			wesnoth.set_dialog_value( units.show_incompatible, "show_incompatible" )
			wesnoth.set_dialog_value( units.remove_inserted, "remove_inserted" )
			wesnoth.set_dialog_callback(select_unit, "unit_chosen")
			wesnoth.set_dialog_callback(toggle_show_incompatible, "show_incompatible")
			wesnoth.set_dialog_callback(toggle_remove_inserted, "remove_inserted")
		end
		function postshow()
		end
		local choice = gui.show_dialog(dialog,preshow,postshow)
		if choice == -1 then
			if units.remove_inserted == true and slots[unit_chosen] == nil then
				table.remove(units,unit_chosen)
			else
				if slots[unit_chosen] ~= nil and #wesnoth.units.find_on_map{ id=units[unit_chosen][2].id } > 0 then
					wesnoth.message_box(_"That unit is already in the game.")
					else
						if slots[unit_chosen] ~= nil and #wesnoth.units.find_on_map{ id=units[unit_chosen][2].original_id } > 0 then
							wesnoth.message_box(_"That unit is a part of the campaign.")
							else
								if slots[unit_chosen] ~= nil then
									picked = units[unit_chosen][2]
								if units.remove_inserted == true then
									table.remove(units,unit_chosen)
							end
						end
					end
				end
			end
		end
	end
	wml.variables["mubc_unit_list"] = units
	wesnoth.wml_actions.set_global_variable { namespace="dugi_move_units_between_campaigns", to_global="unit_list", from_local="mubc_unit_list", immediate=true }
	wesnoth.wml_actions.clear_variable{ name="mubc_unit_list"}
	
	return picked
end

function wesnoth.wml_actions.mubc_import_unit(cfg)
	local picked = wesnoth.sync.evaluate_single(user_pick)
	if picked.side then
		picked.x = cfg.x
		picked.y = cfg.y
		picked.side = wml.variables["side_number"]
		wml.variables["mubc_unit"] = picked
		wesnoth.wml_actions.unstore_unit{ variable="mubc_unit" }
		wesnoth.wml_actions.clear_variable{ name="mubc_unit"}
	end
end
