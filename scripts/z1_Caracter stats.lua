
local function mpx()
	return stats.get_int("MPPLY_LAST_MP_CHAR")
end
 
local function Text(text)
    menu.add_action(text, function() end)
end
  
--Text(" ___________Player Stats Increase___________")
	
local PlStatInc=menu.add_submenu("Player Stats Increase")
 
PlStatInc:add_int_range("Increase Stamina", 1, 0, 100, function()
	return stats.get_int("MP"..mpx().."_script_increase_stam")
end, function(value)
	stats.set_int("MP"..mpx().."_script_increase_stam", value)
end)
 
PlStatInc:add_int_range("Increase Strength", 1, 0, 100, function()
	return stats.get_int("MP"..mpx().."_script_increase_strn")
end, function(value)
	stats.set_int("MP"..mpx().."_script_increase_strn", value)
end)
 
PlStatInc:add_int_range("Increase Lung capacity", 1, 0, 100, function()
	return stats.get_int("MP"..mpx().."_script_increase_lung")
end, function(value)
	stats.set_int("MP"..mpx().."_script_increase_lung", value)
end)
 
PlStatInc:add_int_range("Increase Driving", 1, 0, 100, function()
	return stats.get_int("MP"..mpx().."_script_increase_driv")
end, function(value)
	stats.set_int("MP"..mpx().."_script_increase_driv", value)
end)
 
PlStatInc:add_int_range("Increase Flying", 1, 0, 100, function()
	return stats.get_int("MP"..mpx().."_script_increase_fly")
end, function(value)
	stats.set_int("MP"..mpx().."_script_increase_fly", value)
end)
 
PlStatInc:add_int_range("Increase Shooting", 1, 0, 100, function()
	return stats.get_int("MP"..mpx().."_script_increase_sho")
end, function(value)
	stats.set_int("MP"..mpx().."_script_increase_sho", value)
end)
 
PlStatInc:add_int_range("Increase Stealth", 1, 0, 100, function()
	return stats.get_int("MP"..mpx().."_script_increase_stl")
end, function(value)
	stats.set_int("MP"..mpx().."_script_increase_stl", value)
end)
 
PlStatInc:add_int_range("Increase Mechanic", 1, 0, 100, function()
	return stats.get_int("MP"..mpx().."_script_increase_mech")
end, function(value)
	stats.set_int("MP"..mpx().."_script_increase_mech", value)
end)
--Text("                 		--- End ---                ")