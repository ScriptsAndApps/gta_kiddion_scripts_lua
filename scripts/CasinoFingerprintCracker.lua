local STRKM52=52929;
menu.add_action("Crack Casino Fingerprint", function()
	local heist_script = script("fm_mission_controller")
	if heist_script and heist_script:is_active() then
		if heist_script:get_int(STRKM52) == 3 or heist_script:get_int(STRKM52) == 4 then
			heist_script:set_int(STRKM52, 5)
		end
	end
end)