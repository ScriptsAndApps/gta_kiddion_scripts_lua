
menu.add_action("TpToCar", function()
            currentpos = localplayer:get_position()
            nearveh = localplayer:get_nearest_vehicle()
            vehpos = localplayer:get_position()
 
        localplayer:set_position(vehpos)                
           
end)



local currentVehicle = localplayer:get_current_vehicle()
local drivmode={} drivmode[2]="Highway" drivmode[1]="Street" drivmode[0]="OFF" 
local defaccel = currentVehicle:get_acceleration()
local defsteer = currentVehicle:get_steering_lock()
local defspeed = currentVehicle:get_max_speed()
local modaccel = 0
local modsteer = 0
local modspeed = 0
 
function setdefvalues()
currentVehicle:set_acceleration(defaccel)
currentVehicle:set_steering_lock(defsteer)
currentVehicle:set_max_speed(defspeed)
end
 
function setmodvalues()
currentVehicle:set_acceleration(modaccel)
currentVehicle:set_steering_lock(modsteer)
currentVehicle:set_max_speed(modspeed)

end


function tp(pos)
    if(localplayer:is_in_vehicle() == true) then 
        localplayer:get_current_vehicle():set_position(pos)
    else
        localplayer:set_position(pos)
    end
end
 
menu.add_action('tp to the nearest car', function()
    local pos = localplayer:get_nearest_vehicle():get_position()
    if pos ~= nil then
        tp(pos)
    end
end)
 
menu.add_action('tp to the nearest car', function() tp(localplayer:get_nearest_vehicle():get_position()) end)

half_god = false
 
menu.add_toggle('Half God', function() return half_god end, function(toggle)
    half_god = toggle
    if(half_god == true) then 
        local max_health = localplayer:get_max_health()
        if max_health == 0.0 then
            max_health = 328.0
            localplayer:set_max_health(328.0)
        end
        while(localplayer:get_max_health() ~= 0.0) do
            localplayer:set_health(328.0)
            localplayer:set_armour(50.0)
        end
        localplayer:set_max_health(max_health)
        half_god = false
    end
end)
menu.add_action('end loop', function() localplayer:set_max_health(0.0) end)




local Plates={ "H4X0R", "1D10T", "L00KUP", "AD10S", "etc." }
local function Veh() if localplayer:is_in_vehicle() then return localplayer:get_current_vehicle() else return nil end end
menu.add_array_item("Set Number Plate>", Plates, function()
if Veh() then for x=1, #Plates do if Plates[x]==Veh():get_number_plate_text() then return x end end return 1 end end, function(t)
  if Veh() then Veh():set_number_plate_text(Plates[t]) end
end)

"Hotkeys" :  {
			"VirtualKey" : 117,
			"Action" : "RepairOnlineVehicle"
		}
		
		--Super Weapon Values
WR = 350
WD = 350
WRTM = 4
 
local function SuperWeapon()
	Hash = localplayer:get_model_hash()
	if localplayer:get_weapon_enabled(Hash) then
		WeaponName = weapon:get_name_hash()
		ModelHash = weapon:get_model_hash()
		weapon:get_range()
		weapon:get_bullet_damage()
		weapon:get_reload_time_multiplier()
		localplayer:set_bullet_damage(WD)
		localplayer:set_range(WR)
		localplayer:set_reload_time_multiplier(WRTM)
	end