require("init")
local CrVeh=Global.CreateVehicle				--Create Vehicle Offset

local function check()
	globals.set_int(CrVeh+27+66, localplayer:get_model_hash())
end
menu.register_hotkey(34, check) --pg down

local W,A,S,D=87,65,83,68
local function roundabout()
	a=0
	while a==0 do 
	menu.send_key_down(W)
	sleep(0.2)
	menu.send_key_down(A)
	sleep(0.2)
	menu.send_key_up(W)
	sleep(0.2)
	menu.send_key_down(S)
	sleep(0.2)
	menu.send_key_up(A)
	sleep(0.2)
	menu.send_key_down(D)
	sleep(0.2)
	menu.send_key_up(S)
	sleep(0.2)
	menu.send_key_down(W)
	sleep(0.2)
	menu.send_key_up(D)
	sleep(0.2)
	menu.send_key_down(A)
	sleep(0.2)
	menu.send_key_up(W)
	sleep(0.2)
	menu.send_key_up(A)
	a=1 end
end
menu.register_hotkey(113, roundabout) --f2
 menu.add_action("F2 linked parts car", function() end)