local subb = menu.add_submenu("Auto triggers like trigger_mc_production()")

local autobunkprod = false
local autobunkres = false
local automcprod = false
local autonichtclubmax = false


local function mpx() return stats.get_int("MPPLY_LAST_MP_CHAR") end

local title = "Wep. mods"

local explotyp = 1
local explotypnum = 1
local exptext = "Normal"
local dmgtype = 0
local expltype = 0
local wepontoray = false
local setstats = false
local autorepairvehicle = false


local function localplayerweps()
	
        if wepontoray then 
        if  localplayer ~= nil and localplayer:get_current_weapon() ~= nil then 
                -- set railgun to wep --
                if explotyp > 1 then 
                        localplayer:get_current_weapon():set_explosion_type(expltype)
                        localplayer:get_current_weapon():set_damage_type(dmgtype)
                end
                -- set force to weapon --
                localplayer:get_current_weapon():set_heli_force(100000)
                localplayer:get_current_weapon():set_ped_force(100000)
                localplayer:get_current_weapon():set_vehicle_force(100000)
                
                -- rapid shots -- 
                localplayer:get_current_weapon():set_time_between_shots(0.1)
                localplayer:get_current_weapon():set_range(90000)
                localplayer:get_current_weapon():set_spread(0.1)
                localplayer:get_current_weapon():set_lock_on_range(10000)
                
                -- full ammo weapon --
                localplayer:get_current_weapon():set_current_ammo(localplayer:get_current_weapon():get_max_mp_ammo())
              
        end
          end
end

local function repaircar()
    if autorepairvehicle then
        menu.heal_vehicle()
		--localplayer:get_config_flag(429)
		localplayer:set_config_flag(429, false)--set can engine start
    end 
end
--####################################--
local function loop()
--------------------------------------------------------------
		

		
		    if autobunkprod then  menu:trigger_bunker_production() end
			if autobunkres then menu:trigger_bunker_research() end
			if automcprod then menu:trigger_mc_production() end
			if autonichtclubmax then menu:trigger_nightclub_production() end

			
            repaircar()
            localplayerweps() 
            
            if setstats then 

                PlayerIndex = globals.get_int(1312763)
                if PlayerIndex == 0 then
                    mpx = "MP0_"
                else
                    mpx = "MP1_"
                end
                stats.set_int(mpx.."NIGHTCLUB_JOBS_DONE", 0)
                stats.set_int(mpx.."NIGHTCLUB_EARNINGS", 0)
                stats.set_int(mpx.."NIGHTCLUB_VIP_APPEAR", 0)
                stats.set_int(mpx.."NIGHTCLUB_JOBS_DONE", 0) 
                stats.set_int(mpx.."HUB_SALES_COMPLETED", 0)
                stats.set_int(mpx.."HUB_EARNINGS", 0)
                stats.set_int(mpx.."DANCE_COMBO_DURATION_MINS", 0)
                stats.set_int(mpx.."NIGHTCLUB_PLAYER_APPEAR", 0)
                stats.set_int(mpx.."LIFETIME_HUB_GOODS_SOLD", 0)
                stats.set_int(mpx.."LIFETIME_HUB_GOODS_MADE", 0)
                    
                mpIndex = globals.get_int(1312763)
                if mpIndex == 0 then
                    stats.set_int("mp0_club_popularity", 1000)
                else
                    stats.set_int("mp1_club_popularity", 1000)
                end
                -- just to be sure
                --stats.set_int("MP"..mpx().."_club_popularity", 1000)
                
            end
---------------------------------------------------------------
end 

--####################################--

 
 


local explosiontype = {"Disabled","Unl ammo + force","Force with boom","Force","Granade?","Molotof","Gas","Flare","Rail gun explosion","medium explosion","big explosion","Mega explosion","Ultra explosion","Fun explosion","Steam","Fire","Water"}

 local function set_title()
	if localplayer ~=nil and  localplayer:get_current_weapon() ~=nil then
			if explotyp < 1 then explotyp = 1 end
			 explotypnum = explotyp
		  

			
			if explotyp == 1 then 
			
			  localplayer:get_current_weapon():set_explosion_type(0)
			  localplayer:get_current_weapon():set_damage_type(3)
			  wepontoray = false
			else
			   wepontoray = true
			end
			 if explotyp < #explosiontype+1 then 
			 
				 exptext  = explosiontype[explotypnum]   
				 
						if explotyp == 3 then
							expltype = 65
							dmgtype = 5
						end
						if explotyp == 4 then
							 expltype = 70
							dmgtype = 5
						end
						if explotyp == 5 then
							 expltype = 0
							dmgtype = 5
						end
						if explotyp == 6 then
							expltype = 3
							dmgtype = 5
						end
						if explotyp == 7 then
							expltype = 21
							dmgtype = 5
						end
						if explotyp == 8 then
							expltype = 22 -- flare
							dmgtype = 5
						end
						if explotyp == 9 then
							expltype = 25 -- small
							dmgtype = 5
						end
						if explotyp == 10 then
							expltype = 23 -- medium
							dmgtype = 5
						end
						if explotyp == 11 then
							expltype = 28 -- big
							dmgtype = 5
						end
						if explotyp == 12 then
							expltype = 8 --mega
							dmgtype = 5
						end
						if explotyp == 13 then
							expltype = 29 -- ultra
							dmgtype = 5
						end
						if explotyp == 14 then
							expltype = 16 -- fun
							dmgtype = 5
						end
						if explotyp == 15 then
							expltype = 24 -- steam
							dmgtype = 5
						end
						if explotyp == 16 then
							expltype = 12 -- 
							dmgtype = 5
						end
						if explotyp == 17 then
							expltype = 13 -- s
							dmgtype = 5
						end
						if explotyp == 2 then
							 expltype = 0
							dmgtype = 3
						end
						
			  else
						if explotyp > 600 then
							expltype = (explotyp)-600
							dmgtype = 2
						elseif explotyp > 450 then
							expltype = (explotyp)-450
							dmgtype = 1
						elseif explotyp > 300 then
							expltype = (explotyp)-300
							dmgtype = 4
						elseif explotyp > 150 then
						   expltype = (explotyp)-150
							 dmgtype = 3
						else
							 expltype = explotyp-(#explosiontype+1)
							 dmgtype = 5
						end 
					 exptext  = "dmg " .. dmgtype .. "/5 expl " .. expltype ..  "~" ..  explotyp-(#explosiontype+1)
			end

			localplayerweps()
			
			local title = title .. " | < " ..  exptext .. " >"
			return title
		else
		   local title = title .. " | < " .. "Disabled" .. " >"
			return title
 
		end
end

    local function next_item()
        explotyp = explotyp + 1
        return set_title()
    end
    local function previous_item()
        explotyp = explotyp - 1
        return set_title()
    end

menu.add_bare_item(title, set_title, function() return "Disabled" end, previous_item, next_item)
--menu.add_toggle("Set weapon raygun auto", function() return wepontoray end, function(value) wepontoray = value 
--                if not wepontoray then
--                    localplayer:get_current_weapon():set_explosion_type(0)
 --                   localplayer:get_current_weapon():set_damage_type(5)
 --               end 
--
--end) 
menu.add_toggle("Set nightclub stats to 100% and reset", function() return setstats end, function(value) setstats = value end) 
menu.add_toggle("Automatically repair vehicle", function() return autorepairvehicle end, function(value) autorepairvehicle = value end) 

subb:add_toggle("Auto trigger_bunker_production()", function() return autobunkprod end, function(value) autobunkprod = value end) 
subb:add_toggle("Auto trigger_bunker_research()", function() return autobunkres end, function(value) autobunkres = value end) 
subb:add_toggle("Auto trigger_mc_production()", function() return automcprod end, function(value) automcprod = value end) 
subb:add_toggle("Auto trigger_nightclub_production()", function() return autonichtclubmax end, function(value) autonichtclubmax = value end) 






menu.register_hotkey(151, function() if loop ~=nil then loop() end end) -- auto loop