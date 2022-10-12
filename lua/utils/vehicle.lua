function vehicle_get_hash(name) return VehicleHash[name] end
function vehicle_get_name(hash) return VehicleHashName[hash] end
function vehicle_get_infos(veh)
	if not veh then return {} end
	local infos = {}
	infos.hash = veh:get_model_hash()
	infos.name = vehicle_get_name(infos.hash)
	infos.licensePlate = veh:get_number_plate_text()
	infos.godmode = veh:get_godmode()
	infos.locked = veh:get_door_lock_state()
	infos.max_speed = veh:get_max_speed()
	infos.bouyance = veh:get_bouyance()
	return infos
end

function vehicle_get_string(veh)
    local infos = vehicle_get_infos(veh)
	-- log("vehicle_get_infos: "..dump(infos))
	local str = infos.name or tostring(veh)
	if infos.hash then str = str .. " (" .. dump(infos.hash) .. ")" end
	if infos.licensePlate then str = str .. " [" .. dump(infos.licensePlate) .. "]" end
	if infos.godmode then str = str .. " * " end
	if infos.locked ~= nil then str = str .. " " .. (infos.locked and "LOCKED" or "UNLOCKED")..": "..dump(infos.locked) end
	if infos.max_speed then str = str .. " speed:" .. dump(infos.max_speed) end
	if infos.bouyance then str = str .. " bouyance:" .. dump(infos.bouyance) end
	return str
end

function vehicle_spawn(modelhash, moreopts,ped)

if not ped and (localplayer == nil or localplayer:get_position() == nil) then  return end
if ped and (ped == nil or ped:get_position() == nil) then  return end

	local mypos = nil
    local heading = nil
	
		if ped then
			mypos = ped:get_position()
			heading = ped:get_heading()
				else
			mypos = localplayer:get_position()
			heading = localplayer:get_heading()
		end
    mypos.x = mypos.x + heading.x * (5) 
    mypos.y = mypos.y + heading.y * (5)
	
	--Source: https://gitlab.com/ExternalMemoryakaLolBobTest/external-menu-gta-5-csgo/-/blob/master/GTA%205%20C++/Hack.cpp

--[[ 	globals.set_int(2725439 + 2, 1)
	globals.set_uint(2725439 + 5, 1)
	globals.set_uint(2725439 + 27, 1)

	if moreopts then

		--globals.set_uint(2725439 + 27 + 1, math_randomnumber(1,9000000)) --VEHICLE_NUMBER_PLATE_TEXT
		
		globals.set_uint(2725439 + 27 + 5, 255) --VEHICLE_PRIMARY_COLOR
		globals.set_uint(2725439 + 27 + 6, 255) --VEHICLE_SECONDARY_COLOR
		globals.set_uint(2725439 + 27 + 7, 255) --VEHICLE_EXTRA_COLOURS
		
		globals.set_int(2725439 + 27 + 8, 255)
		globals.set_int(2725439 + 27 + 10, 5)
		globals.set_int(2725439 + 27 + 12, 4)
		globals.set_int(2725439 + 27 + 13, 8)
		globals.set_int(2725439 + 27 + 14, 6)
		globals.set_int(2725439 + 27 + 15, 3)
		globals.set_int(2725439 + 27 + 16, 4)
		globals.set_int(2725439 + 27 + 17, 13)
		globals.set_int(2725439 + 27 + 18, 8)
		globals.set_int(2725439 + 27 + 19, 5)
		globals.set_int(2725439 + 27 + 20, 255)
		globals.set_int(2725439 + 27 + 21, 3)
		globals.set_int(2725439 + 27 + 22, 6)
		globals.set_int(2725439 + 27 + 23, 10)
		globals.set_int(2725439 + 27 + 24, -1)
		
		globals.set_uint(2725439 + 27 + 59, 2)
		globals.set_int(2725439 + 27 + 62, 255)
		globals.set_int(2725439 + 27 + 63, 0)
		globals.set_int(2725439 + 27 + 64, 0)
		globals.set_int(2725439 + 27 + 65, 2)
		
		globals.set_uint(2725439 + 27 + 67, 1)
		globals.set_uint(2725439 + 27 + 69, 0)
		globals.set_uint(2725439 + 27 + 27, 1)
		
		globals.set_uint(2725439 + 27 + 74, 255) --VEHICLE_NEON_LIGHTS_COLOUR
		globals.set_uint(2725439 + 27 + 75, 255) 
		globals.set_uint(2725439 + 27 + 76, 255) 
		
		globals.set_uint(2725439 + 27 + 68, 1) --GET_CONVERTIBLE_ROOF_STATE
		globals.set_int(2725439 + 27 + 77, 0xF0400000) --CAR OPTIONS
		globals.set_uint(2725439 + 27 + 96, 1)
		globals.set_uint(2725439 + 27 + 97, 1)
		globals.set_uint(2725439 + 27 + 98, 0)
		globals.set_uint(2725439 + 27 + 99, 255)
	end

	globals.set_uint(2725439 + 27 + 70, 0) --VEHICLE_DOOR_LOCK_STATUS (If it is not 0, you cant enter the vehicle).

	globals.set_int(2725439 + 27 + 66, modelhash)

	globals.set_float(2725439 + 7, mypos.x) --Position X
	globals.set_float(2725439 + 7+1, mypos.y) --Position Y
	globals.set_float(2725439 + 7+2, mypos.z)
	--globals.set_float(2725439 + 7+2, -255)

--[[
	globals.set_int(2725439 + 2, 1);
	globals.set_uint(2725439 + 5, 1);
	globals.set_int(2725439 + 27 + 66, modelhash);
	globals.set_float(2725439 + 7, mypos.x);
	globals.set_float(2725439 + 7+1, mypos.y);
	globals.set_float(2725439 + 7+2, -255);
--]]
		-- different type of spawn
   --globals.set_int(2671449 + 44,  modelhash)
   -- globals.set_float(2671449 + 40, mypos.x)
   -- globals.set_float(2671449 + 41, mypos.y)
   -- globals.set_float(2671449 + 42, mypos.z)

   -- globals.set_boolean(2671449 + 39, true)

--]]
	globals.set_int(2725439 + 2, 1);
	globals.set_uint(2725439 + 5, 1);
	globals.set_int(2725439 + 27 + 66, modelhash);
	globals.set_float(2725439 + 7, mypos.x);
	globals.set_float(2725439 + 7+1, mypos.y);
	globals.set_float(2725439 + 7+2, -255);
		
	if moreopts then

		globals.set_uint(2725439 + 27, 1);
		
		--globals.set_uint(2725439 + 27 + 1, math_randomnumber(1,9000000)) --VEHICLE_NUMBER_PLATE_TEXT
			
		globals.set_uint(2725439 + 27 + 5, 10); --VEHICLE_COLOURS
		globals.set_uint(2725439 + 27 + 6, 10);
		globals.set_uint(2725439 + 27 + 7, 10); 
		globals.set_int(2725439 + 27 + 8, 255);--VEHICLE_EXTRA_COLOURS
		
		
		globals.set_int(2725439 + 27 + 10, 5);
		globals.set_int(2725439 + 27 + 12, 4);
		globals.set_int(2725439 + 27 + 13, 8);
		globals.set_int(2725439 + 27 + 14, 6);
		globals.set_int(2725439 + 27 + 15, 3);
		globals.set_int(2725439 + 27 + 16, 4);
		globals.set_int(2725439 + 27 + 17, 13);
		globals.set_int(2725439 + 27 + 18, 8);
			
		globals.set_int(2725439 + 27 + 13, 8);
		globals.set_int(2725439 + 27 + 19, 5);
		globals.set_int(2725439 + 27 + 20, 255);
		globals.set_int(2725439 + 27 + 21, 3);
		globals.set_int(2725439 + 27 + 22, 6);
		globals.set_int(2725439 + 27 + 23, 10);
		globals.set_int(2725439 + 27 + 24, -1);

		globals.set_uint(2725439 + 27 + 59, 2);
		globals.set_int(2725439 + 27 + 62, 255); --VEHICLE_TYRE_SMOKE_COLOR
		globals.set_int(2725439 + 27 + 63, 0);
		globals.set_int(2725439 + 27 + 64, 0);
		globals.set_int(2725439 + 27 + 65, 1); --VEHICLE_WINDOW_TINT
		globals.set_uint(2725439 + 27 + 67, 1); --VEHICLE_LIVERY
		globals.set_uint(2725439 + 27 + 69, 0); --VEHICLE_WHEEL_TYPE
		globals.set_uint(2725439 + 27 + 27, 1); --VEHICLE_TYRE_SMOKE_COLOR
		globals.set_uint(2725439 + 27 + 70, 0); --VEHICLE_DOOR_LOCK_STATUS
		globals.set_uint(2725439 + 27 + 74, 255); --VEHICLE_NEON_LIGHTS_COLOUR
		globals.set_uint(2725439 + 27 + 75, 255); --VEHICLE_NEON_LIGHTS_COLOUR
		globals.set_uint(2725439 + 27 + 76, 255); --VEHICLE_NEON_LIGHTS_COLOUR
		globals.set_uint(2725439 + 27 + 68, 1); --GET_CONVERTIBLE_ROOF_STATE
		globals.set_int(2725439 + 27 + 77, 0xF0400000); --CAR OPTIONS
		
		
		
		globals.set_uint(2725439 + 27 + 96, 1);
		globals.set_uint(2725439 + 27 + 97, 1);
		globals.set_uint(2725439 + 27 + 98, 0);
		globals.set_uint(2725439 + 27 + 99, 255);
		globals.set_uint(2460715 + 27 + 100, 1);


		globals.set_int(2725439 + 27 + 9 + 4, 4); 
		globals.set_int(2725439 + 27 + 9 + 5, 4); 
		globals.set_int(2725439 + 27 + 9 + 6, 4); 
		globals.set_int(2725439 + 27 + 9 + 7, 4); 
		globals.set_int(2725439 + 27 + 9 + 8, 4); 
		globals.set_int(2725439 + 27 + 9 + 9, 4); 
		globals.set_int(2725439 + 27 + 9 + 10, 4); 
		globals.set_int(2725439 + 27 + 9 + 12, 4);  -- ems?
		globals.set_int(2725439 + 27 + 9 + 13, 4); 
		globals.set_int(2725439 + 27 + 9 + 14, 4);--
		globals.set_int(2725439 + 27 + 9 + 15, 4);--
		globals.set_int(2725439 + 27 + 9 + 16, 4);
		globals.set_int(2725439 + 27 + 9 + 18, 1);
		
		
		globals.set_int(2725439 + 27 + 0 , 1);
		
		globals.set_int(2725439 + 27 + 5, 44); -- primary color (pre config)
		globals.set_int(2725439 + 27 + 6, 4); -- secondari color (pre config)
		globals.set_int(2725439 + 27 + 7, -1); -- pearlesent color (pre config)
		globals.set_int(2725439 + 27 + 8, -1); --wheel color
					

		globals.set_int(2725439 + 27 + 7, -1);
		globals.set_int(2725439 + 27 + 8, -1);
		globals.set_int(2725439 + 27 + 10, 16);
		globals.set_int(2725439 + 27 + 11, 11);
		globals.set_int(2725439 + 27 + 12, 2);
		globals.set_int(2725439 + 27 + 13, 4);
		globals.set_int(2725439 + 27 + 14, 7);
		globals.set_int(2725439 + 27 + 17, 8);
		globals.set_int(2725439 + 27 + 18, 1);
		globals.set_int(2725439 + 27 + 19, 5);
		
		globals.set_int(2725439 + 27 + 21, 4); -- ems
		globals.set_int(2725439 + 27 + 22, 6); -- brakes
		globals.set_int(2725439 + 27 + 23, 9); -- TRANSMISSION
		globals.set_int(2725439 + 27 + 24, 58);
		globals.set_int(2725439 + 27 + 25, 13); -- suspension
		globals.set_int(2725439 + 27 + 26, 5); -- armor
		globals.set_int(2725439 + 27 + 27, 1);
		globals.set_int(2725439 + 27 + 28, 1); -- turbooo
		
		globals.set_int(2725439 + 27 + 29, 1);
		globals.set_int(2725439 + 27 + 30, 1);
		globals.set_int(2725439 + 27 + 31, 1);
		globals.set_int(2725439 + 27 + 33, 241); -- wheel type
		globals.set_int(2725439 + 27 + 58, -1);  -- livery
		globals.set_int(2725439 + 27 + 60, -1);
		globals.set_int(2725439 + 27 + 61, -1);
		globals.set_int(2725439 + 27 + 62, 200); -- smoke colors r
		globals.set_int(2725439 + 27 + 63, 200); -- smoke colors g
		globals.set_int(2725439 + 27 + 64, 200); -- smoke colors b
		
		globals.set_int(2725439 + 27 + 74, 200); -- neon colors r
		globals.set_int(2725439 + 27 + 75, 200); -- neon colors g
		globals.set_int(2725439 + 27 + 76, 200); -- neon colors b
		
		globals.set_int(2725439 + 27 + 77, -264240640); -- bulletproof tires bool? en = -264240640 dis = -264241152 or bool true false
		
		
		globals.set_int(2725439 + 27 + 78, -264240640); -- neon dis= = 4194816 en = -264240640 or bool true false
		
		globals.set_int(2725439 + 27 + 64, 200);
		
		globals.set_int(2725439 + 27 + 65, 1); -- limo windows
			
		globals.set_int(2725439 + 27 + 99, 12); --dashboard color (pre config)
		globals.set_int(2725439 + 27 + 100, 4);
		

		

	end

end





-------------------------------------------------------------




--[[

local listty = {}
local olistty = {}

local ulistty = {}
local oulistty = {}

local boollistty = {}
local oboollistty = {}
local numm = 500
local numm2 = 55000
local logoffset = 2671449 + 42 -- faked personal? + 42 im not sure it does not show up for me

logoffset = 2725439 + 27 -- anonymus car at  + 27

function logints()
sleep(0.2)
print("begin")
	olistty = {}
	olistty = listty
	listty = {}

    for i = 0, numm2 do	
	
	   listty[i] = globals.get_int((logoffset + (i-numm)))
	
		local donot = false
		if #olistty > 1 then
		local l1 = olistty[i]
		local l2 = listty[i] 
			if l1 == l2 then 
			donot = true
			end 
			if not donot then
					print("Int " .. logoffset .." + " .. i-numm .. " - " .. olistty[i].. " >>  " .. listty[i])
			
			end
		end
		
		
	end
	
    for i = 0, numm2 do	
	
	   ulistty[i] = globals.get_uint((logoffset  + (i-numm)))
	
		local donotu = false
		local donotul = false
		if #oulistty > 1 then
		local l1 = oulistty[i]
		local l2 = ulistty[i] 
		local lllll = listty[i]

			if l1 == l2 then 
			donotu = true
			end 
			if l2 == lllll then
				donotul = true
			end
			if not donotu and not donotul then
	
					print("Uint " .. logoffset .." + " .. i-numm .. " - " .. oulistty[i].. " >>  " .. ulistty[i])
			end
		end
		
		
	end
	
	--[[	 --how o i get bool and see if one changed?
	for i = 0, numm2 do	

	   boollistty[i] = globals.get_bool((logoffset + (i-numm)))
	
		local donotu = false
		if #oboollistty > 1 then
		local l1 = oboollistty[i]
		local l2 = boollistty[i] 
		if l1 == l2 then donotu = true end 
			if not donotu then
					local booltype = "false"
					local obooltype = "false"
					if oboollistty[i] then obooltype = "true" end
					if boollistty[i] then booltype = "true" end
					print("Bool " .. logoffset .." + " .. i-numm .. " " .. obooltype.. " >>  " .. booltype)
			end
		end

	end
	--]] 	 --how o i get bool and see if one changed?
	
	--[[
	
	
	print("end")
end

menu.register_hotkey(76, function() logints() end) 
-- press l to log difference in ints set in game 
--after spawning a vehicle press l
--then change anything in the spawner and press l to see the differences




--]]



--------------------