script_name = "fm_mission_controller_2020"
cayo_instant_heist_passed_trigger = 38396 + 0
cayo_instant_heist_passed_value = 38396 + 1375 + (1 + 0 * 1)
 
menu.add_action("Instant Cayo Complete", function()
    if(script(script_name):is_active()) then
        script(script_name):set_int(cayo_instant_heist_passed_trigger, 9)
        script(script_name):set_int(cayo_instant_heist_passed_value, 50)
    end
end)