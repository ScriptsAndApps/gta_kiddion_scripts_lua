local function PedDrop()
	local position = localplayer:get_position()
	position.z = position.z + 30


	for p in replayinterface.get_peds() do
		if p == nil or p == localplayer then
			goto continue
		end
		
		if p:get_pedtype() < 4 then
            if p:get_current_vehicle() ~=nil then 
                p:get_current_vehicle():set_godmode(true)
            end 
			goto continue
		end
		
		if p:is_in_vehicle() then
        
			goto continue
		end

		p:set_position(position)

		if p:get_health() > 2 then
			p:set_position(position)
			p:set_freeze_momentum(true)
			p:set_health(0)
           
            math.random(); math.random(); math.random()
			p:set_wallet(math.random(1000,1999))
			break
		end

		::continue::
	end
    
        menu.kill_all_vehicles()
    
		for p in replayinterface.get_peds() do
		if p == nil or p == localplayer then
			goto continue
		end
		
		if p:get_pedtype() < 4 then
            if p:get_current_vehicle() ~=nil then 
                p:get_current_vehicle():set_godmode(false)
            end 
			goto continue
		end
		::continue::
	end
    
end

-- Uncomment the next line to drop a ped when pressing F3
-- menu.register_hotkey(114, PedDrop)

-- Add Menu action under scripts sub menu
menu.add_action("Drop Money from explosion", PedDrop)