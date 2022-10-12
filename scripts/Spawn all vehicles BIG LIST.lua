-- do ont change >>
	require("init")
	local title_main = ""
	local itemindex = 1
	local maxitemindex = 100000000
	local new_sub_title = "Unset"
	local loopmenu = false
-- << do ont change

--initialize (custom) variables
maxitemindex = table_count(VehicleHash) -- vehicle list is in require("init")
loopmenu = true
new_sub_title = "adder 1/" .. maxitemindex
title_main = "Spawn all vehicles"

--custom function
local function spawn()

	local int1 = 1
	local value = nil
	
	for k,v in table_sort(VehicleHash) do  -- vehicle list is in require("init")
		if(int1 == itemindex) then --note itemindex
			value = joaat(k)
		end
		int1 = int1 + 1
	end

	if localplayer ~=nil and value ~=nil then 
	    local pos = localplayer:get_position()
        local heading = localplayer:get_heading()
            
        pos.x = pos.x + heading.x * 5
        pos.y = pos.y + heading.y * 5
		if value ~=nil then 
			globals.set_int(2671449 + 44, value)
			globals.set_float(2671449 + 40, pos.x)
			globals.set_float(2671449 + 41, pos.y)
			globals.set_float(2671449 + 42, pos.z)
			globals.set_boolean(2671449 + 39, true)
		end 
	else
		new_sub_title = "Error"
    end
	
end

local function on_menu_change_trigger()

	local int1 = 1
	local value = "error"
	for k,v in table_sort(VehicleHash) do  -- vehicle list is in require("init")
		if(int1 == itemindex) then
			value = k
		end
		int1 = int1 + 1
	end
	
	--spawn() -- we dont want vehiscles on every menu input so spawn is not used here
	
	new_sub_title = value .. " " ..itemindex .. "/".. maxitemindex 
	
end


local function trigger_on_press()
	--cal custom function
	spawn()
	--press indicator disabled
	--new_sub_title = "# " .. new_sub_title .. " #"
end

local function set_title()
 	local title = title_main .. " | " ..  "< " .. new_sub_title .. " >" -- custom < arrow > tags
	return title
end 
local function next_item()
	if itemindex < maxitemindex then 
		itemindex = itemindex + 1
		else
		if loopmenu then itemindex = 1 end
	end
	on_menu_change_trigger()
	return set_title()
end
local function previous_item()
	if itemindex > 1 then
		itemindex = itemindex - 1
		else
		if loopmenu then itemindex = maxitemindex end
	end
	on_menu_change_trigger()
	return set_title()
end

menu.add_bare_item(title_main, set_title, function() trigger_on_press() set_title() return new_sub_title end, previous_item, next_item)

