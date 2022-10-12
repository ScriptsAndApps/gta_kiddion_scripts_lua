require("init")

local vehmenu = menu.add_submenu("Spawn Vehicle")
vehmenu:add_action("Spawn Vehicle | " .. table_count(VehicleHash), function() end)
for k,v in table_sort(VehicleHash) do
    vehmenu:add_action(menu_centered_text(string.toTitleCase(k)), function()
        --print(k)
        if k == nil then return end
        vehicle_spawn(joaat(k), false)
        
        local pos = localplayer:get_position()
        local heading = localplayer:get_heading()
            
        pos.x = pos.x + heading.x * 5
        pos.y = pos.y + heading.y * 5
        
        globals.set_int(2671449 + 44, joaat(k))
        globals.set_float(2671449 + 40, pos.x)
        globals.set_float(2671449 + 41, pos.y)
        globals.set_float(2671449 + 42, pos.z)
        globals.set_boolean(2671449 + 39, true)
            
        
    end)
end