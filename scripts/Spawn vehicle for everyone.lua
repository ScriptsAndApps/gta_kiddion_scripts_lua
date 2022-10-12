require("init")
local vehmenu = menu.add_submenu("Spawn Vehicle for all players")

local function IsNPC(ped)
	if ped == nil or ped:get_pedtype() < 4 then
		return false
	end
	return true
end
local nmethoddspawn = 1
function setveh(ped,k,posss)

if posss == 1 then posss = 5 
elseif posss == 2 then posss = 15 
elseif posss == 3 then posss = 35
elseif posss == 4 then posss = 45
end

	if not IsNPC(ped) then
				--ped:set_position(localplayer:get_position()+vector3(0,0,2))
				ped:set_freeze_momentum(true)
                local acc = nil
                if ped:get_current_vehicle() ~= nil then 
                    acc=ped:get_current_vehicle():get_acceleration()
                    ped:get_current_vehicle():set_acceleration(0)
                    --ped:get_current_vehicle():set_position(localplayer:get_position()+vector3(0,0,2))
                end
                    --vehicle_spawn(joaat(k), false)
                    local pos = ped:get_position()
                    local heading = ped:get_heading()
                    pos.x = pos.x + heading.x * (posss) 
                    pos.y = pos.y + heading.y * (posss)
					
					--personal fake?
if nmethoddspawn == 1 then 
                    globals.set_int(2671449 + 44, joaat(k))
                    globals.set_float(2671449 + 40, pos.x)
                    globals.set_float(2671449 + 41, pos.y)
                    globals.set_float(2671449 + 42, pos.z)
        
                    globals.set_boolean(2671449 + 39, true)
end
					--anonymus ? 
if nmethoddspawn == 2 then 
					vehicle_spawn(joaat(k),false,ped)
end
                     -- sleep(0.2)
                    ped:set_freeze_momentum(false)
                if ped:get_current_vehicle() ~= nil then 

                    
                    if acc ~=nil then
                        ped:get_current_vehicle():set_acceleration(acc)
                    end
                end
		end
            

end
local numberrr = 1
vehmenu:add_bare_item("Number of cars", function() return "Number of cars | ".. numberrr end,function() return "Number of cars | ".. numberrr  end,function() if numberrr > 1 then numberrr=numberrr-1 end  return "Number of cars | ".. numberrr   end,function() numberrr=numberrr+1  return "Number of cars | ".. numberrr   end)
vehmenu:add_bare_item("Method", function() return "Method | ".. nmethoddspawn end,function() return "Method | ".. nmethoddspawn  end,function() nmethoddspawn=1 return "Method | ".. nmethoddspawn   end,function() nmethoddspawn=2  return "Method | ".. nmethoddspawn   end)
vehmenu:add_action("Spawn Vehicle for all | " .. table_count(VehicleHash), function() end)
for k,v in table_sort(VehicleHash) do
    vehmenu:add_action(menu_centered_text(string.toTitleCase(k)), function()
        --print(k)
        if k == nil then return end
        
        for i=1,numberrr do
			for ped in replayinterface.get_peds() do
			  setveh(ped,k,numberrr)
			  	sleep(0.4)
			end
		
		end
       -- sleep(0.2)
        --setveh(localplayer,k,0)
        --sleep(0.2)
        --setveh(localplayer,k,10)
        --sleep(0.2)
    end)
end