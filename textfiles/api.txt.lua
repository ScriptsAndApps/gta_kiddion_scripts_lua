


		---------------------------------------
-- Globals:
---------------------------------------
globals = {}
if globals then
    function globals:get_boolean(index) end -- (int) -> bool
    function globals:get_float(index) end -- (int) -> float
    function globals:get_int(index) end -- (int) -> int
    function globals:get_uint(index) end -- (int) -> uint

    function globals:set_boolean(index) end -- (int, bool) -> nil
    function globals:set_float(index) end -- (int, float) -> nil
    function globals:set_int(index) end -- (int, int) -> nil
    function globals:set_uint(index) end -- (int, uint) -> nil
end

---------------------------------------
-- Menu:
---------------------------------------
menu = {}
if menu then
    function menu:register_callback(event, callback) end -- (str) -> ref
    function menu:remove_callback(event) end -- (ref) -> nil

    function menu:register_hotkey(keycode, callback) end -- (func) -> ref
    function menu:remove_hotkey(func) end -- (mem) -> nil

    function menu:add_action(name, action_function) end -- (str, func) -> nil
    function menu:add_float_range(name, step, min, max, getter, setter) end -- (str, float, float, float, func, func) -> nil
    function menu:add_int_range(name, step, min, max, getter, setter) end -- (str, int, int, int, func, func) -> nil
    function menu:add_toggle(name, getter, setter) end -- (str, func, func) -> nil

    function menu:send_key_down(name, keycode) end -- (str, int) -> nil
    function menu:send_key_press(name, keycode) end -- (str, int) -> nil
    function menu:send_key_up(name, keycode) end -- (str, int) -> nil

    function menu:call_airstrike() end -- () -> nil
    function menu:call_heli_backup() end -- () -> nil
    function menu:clear_wanted_level() end -- () -> nil
    function menu:deliver_ammo() end -- () -> nil
    function menu:deliver_avenger() end -- () -> nil
    function menu:deliver_bullshark() end -- () -> nil
    function menu:deliver_dinghy() end -- () -> nil
    function menu:deliver_kosatka() end -- () -> nil
    function menu:deliver_minigun() end -- () -> nil
    function menu:deliver_moc() end -- () -> nil
    function menu:deliver_personal_vehicle() end -- () -> nil
    function menu:deliver_terrorbyte() end -- () -> nil
    function menu:detach_objects() end -- () -> nil
    function menu:disconnect_session() end -- () -> nil
    function menu:empty_session() end -- () -> nil
    function menu:end_cutscene() end -- () -> nil
    function menu:enter_personal_vehicle() end -- () -> nil
    function menu:heal_all() end -- () -> nil
    function menu:heal_player() end -- () -> nil
    function menu:heal_vehicle() end -- () -> nil
    function menu:instant_bullshark() end -- () -> nil
    function menu:instant_drone() end -- () -> nil
    function menu:instant_minigun() end -- () -> nil
    function menu:instant_minitank() end -- () -> nil
    function menu:instant_rcbandito() end -- () -> nil
    function menu:kill_all_vehicles() end -- () -> nil
    function menu:kill_all_enemies() end -- () -> nil
    function menu:kill_all_mission_Peds() end -- () -> nil
    function menu:kill_all_mission_vehicles() end -- () -> nil
    function menu:kill_all_npcs() end -- () -> nil
    function menu:kill_current_vehicle() end -- () -> nil
    function menu:level_current_vehicle() end -- () -> nil
    function menu:max_all_ammo() end -- () -> nil
    function menu:max_current_ammo() end -- () -> nil
    function menu:refill_boost() end -- () -> nil
    function menu:remove_insurance_claims() end -- () -> nil
    function menu:repair_online_vehicle() end -- () -> nil
    function menu:retrieve_personal_vehicle() end -- () -> nil
    function menu:start_choose_character() end -- () -> nil
    function menu:start_creator_mode() end -- () -> nil
    function menu:start_singleplayer() end -- () -> nil
    function menu:suicide_player() end -- () -> nil
    function menu:teleport_to_current_vehicle() end -- () -> nil
    function menu:teleport_to_objective() end -- () -> nil
    function menu:teleport_to_waypoint() end -- () -> nil
    function menu:trigger_boat_pickup() end -- () -> nil
    function menu:trigger_bunker_production() end -- () -> nil
    function menu:trigger_bunker_research() end -- () -> nil
    function menu:trigger_heli_pickup() end -- () -> nil
    function menu:trigger_heli_vip_pickup() end -- () -> nil
    function menu:trigger_mc_production() end -- () -> nil
    function menu:trigger_nightclub_production() end -- () -> nil

    function menu:get_assisted_aim() end -- () -> bool
    function menu:get_bribe_authorities() end -- () -> bool
    function menu:get_cops_turn_blind_eye() end -- () -> bool
    function menu:get_disable_crash_to_sp() end -- () -> bool
    function menu:get_disable_send_to_island() end -- () -> bool
    function menu:get_disable_send_to_job() end -- () -> bool
    function menu:get_disable_teleport_to_apartment() end -- () -> bool
    function menu:get_disable_vehicle_kick() end -- () -> bool
    function menu:get_disable_weather_control() end -- () -> bool
    function menu:get_ghost_organisation() end -- () -> bool
    function menu:get_nightvision() end -- () -> bool
    function menu:get_offradar() end -- () -> bool
    function menu:get_passive() end -- () -> bool
    function menu:get_reveal_player() end -- () -> bool
    function menu:get_thermalvision() end -- () -> bool

    function menu:set_assisted_aim(value) end -- (bool) -> nil
    function menu:set_bribe_authorities(value) end -- (bool) -> nil
    function menu:set_cops_turn_blind_eye(value) end -- (bool) -> nil
    function menu:set_disable_crash_to_sp(value) end -- (bool) -> nil
    function menu:set_disable_send_to_island(value) end -- (bool) -> nil
    function menu:set_disable_send_to_job(value) end -- (bool) -> nil
    function menu:set_disable_teleport_to_apartment(value) end -- (bool) -> nil
    function menu:set_disable_vehicle_kick(value) end -- (bool) -> nil
    function menu:set_disable_weather_control(value) end -- (bool) -> nil
    function menu:set_ghost_organisation(value) end -- (bool) -> nil
    function menu:set_nightvision(value) end -- (bool) -> nil
    function menu:set_offradar(value) end -- (bool) -> nil
    function menu:set_passive(value) end -- (bool) -> nil
    function menu:set_reveal_player(value) end -- (bool) -> nil
    function menu:set_thermalvision(value) end -- (bool) -> nil
end

---------------------------------------
-- Ped:
---------------------------------------
Ped = {}
if Ped then
    function Ped:get_armour() end -- () -> int
    function Ped:get_current_weapon() end -- () -> Weapon
    function Ped:get_current_vehicle() end -- () -> Vehicle
    function Ped:get_freeze_momentum() end -- () -> bool
    function Ped:get_godmode() end -- () -> bool
    function Ped:get_health() end -- () -> float
    function Ped:get_max_health() end -- () -> float
    function Ped:get_nearest_vehicle() end -- () -> Vehicle
    function Ped:get_player_id() end -- () -> int
    function Ped:get_Pedtype() end -- () -> int
    function Ped:get_config_flag(index) end -- (int) -> bool