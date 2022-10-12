require("init")
local enabled = false
local events = { "OnPlayerChanged", "OnVehicleChanged", "OnWeaponChanged" }
local function do_some_trolling()
        if enabled then
                     if localplayer:get_current_vehicle() ~=nil then
                            localplayer:get_current_vehicle():set_gravity(16) -- 9.8 default
                            localplayer:get_current_vehicle():set_godmode(true)
                            localplayer:get_current_vehicle():set_can_be_visibly_damaged(false)
                            localplayer:get_current_vehicle():set_window_collisions_disabled(true)
                            localplayer:get_current_vehicle():set_dirt_level(0)
                            localplayer:get_current_vehicle():set_max_speed(5000)
                            localplayer:get_current_vehicle():set_window_tint(1)
                            localplayer:get_current_vehicle():set_bulletproof_tires(true)
                            localplayer:get_current_vehicle():set_acceleration(4)
                            menu.heal_vehicle()
                            localplayer:get_current_vehicle():set_number_plate_text('!! GTAVI !!')
                    end      
        end
end


 -- this is automatically called from other script
menu.register_hotkey(151, function() 
if enabled and localplayer ~= nil then
       do_some_trolling()
    end 
end)
-- this is automatically called from other script


local function Trigger()
    if enabled and localplayer ~= nil then
       do_some_trolling()
    end
end

for i = 1, #events do
    menu.register_callback(events[i], Trigger)
end

 menu.add_toggle("Auto car fast mod", function() return enabled end, function()
    enabled = not enabled
end)

