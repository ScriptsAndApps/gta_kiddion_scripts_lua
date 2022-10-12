require("init")

local panicModeActive = false

local function togglePanicMode()
    panicModeActive = not panicModeActive
    if panicModeActive then
        menu:set_disable_crash_to_sp(panicModeActive)
        menu:set_disable_send_to_island(panicModeActive)
        menu:set_disable_send_to_job(panicModeActive)
        menu:set_disable_teleport_to_apartment(panicModeActive)
        menu:set_disable_vehicle_kick(panicModeActive)
        menu:set_disable_weather_control(panicModeActive)
        if localplayer ~= nil then
            --localplayer:set_godmode(panicModeActive)
            if localplayer:is_in_vehicle() then
                menu:level_current_vehicle()
                veh = localplayer:get_current_vehicle()
                if veh ~= nil then
                    veh:set_health(1000)
                    veh:set_godmode(panicModeActive)
                    veh:set_bulletproof_tires(panicModeActive)
                else
                    menu.heal_vehicle()
                end
            end
        else
            menu.heal_player()
        end
        menu:detach_objects()
        menu:clear_wanted_level()
        menu:kill_all_enemies()
        menu:call_heli_backup()
        menu:remove_insurance_claims()
        menu:end_cutscene()
    end
    if localplayer ~= nil then
        localplayer:set_config_flag(PedConfigFlag.DiesByRagdoll, not panicModeActive)
    end
    menu:set_bribe_authorities(panicModeActive)
    menu:set_cops_turn_blind_eye(panicModeActive)
    menu:set_ghost_organisation(panicModeActive)
    menu:set_offradar(panicModeActive)
    -- menu:set_passive(panicModeActive)
    menu:set_reveal_player(panicModeActive)
end

menu.add_toggle("PANIC MODE", function() return panicModeActive end, togglePanicMode)
local ref = menu.register_hotkey(KeyCode.VK_F12, togglePanicMode)