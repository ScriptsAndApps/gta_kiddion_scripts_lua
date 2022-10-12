local cars_map = {}

cars_map[joaat("BATI2")] = "Bati 801RR"
cars_map[joaat("BIFTA")] = "Bifta"
cars_map[joaat("ADDER")] = "adder"
cars_map[joaat("SCRAMJET")] = "ScramJet"
cars_map[joaat("DINGHY2")] = "cdinghy"
cars_map[joaat("ANNIHILATOR")] = "AnniHilator"
cars_map[joaat("AVENGER2")] = "Avenger2"
cars_map[joaat("BUZZARD2")] = "Buzzard2"
cars_map[joaat("CHEETAH2")] = "Cheetah2"
cars_map[joaat("COACH")] = "Coach"
cars_map[joaat("COMET5")] = "Comet5"
cars_map[joaat("DELUXO")] = "Deluxo"
cars_map[joaat("DINGHY4")] = "Dinghy4"
cars_map[joaat("ELEGY2")] = "Elegy2"
cars_map[joaat("VELUM2")] = "Velum"
cars_map[joaat("LAZER")] = "Lazer"
cars_map[joaat("LIMO2")] = "Limo2"
cars_map[joaat("MAVERICK")] = "Maverick"
cars_map[joaat("MONSTER")] = "Monster"
cars_map[joaat("SULTANRS")] = "Sultanrs"
cars_map[joaat("INSURGENT3")] = "Insurgetnt3"
cars_map[joaat("OPPRESSOR2")] = "Oppressor2"
cars_map[joaat("JETMAX")] = "Jetmax"
local car_hash = joaat("BATI2")
 
menu.add_array_item("Spawn Vehicle", cars_map, function()
	return car_hash
end, function(value)
	car_hash = value
    if localplayer ~=nil then 
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
    end
end)