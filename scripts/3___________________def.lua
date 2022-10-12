require("init")
--player_set_ped_model(PedHex["cs_lazlow"])
--vehicle_spawn(joaat("adder"),true)



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
	local heist_script = script("fm_mission_controller")
	if heist_script then
		print("scriptexists")
	end
	if heist_script and heist_script:is_active() then
		print("scriptactive")
	end
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
	
	
	
	print("end")
end

menu.register_hotkey(76, function() logints() end) 
-- press l to log difference in ints set in game 
--after spawning a vehicle press l
--then change anything in the spawner and press l to see the differences