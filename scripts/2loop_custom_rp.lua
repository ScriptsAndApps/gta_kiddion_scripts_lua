-- begin rp loop function

local rp = false menu.add_toggle("RP loop", function() return rp end, function(value) rp = value end)
local wanted = false
local function giverp()
    if rp then
        if wanted then
            localplayer:set_wanted_level(0)
            wanted = false
        else
            localplayer:set_wanted_level(5)
            wanted = true
        end
    end
end

-- end rp loop function


--####################################--
local function loop()
--------------------------------------------------------------

    -- call custom functions here to loop 
	 giverp()

---------------------------------------------------------------
end 
 menu.register_hotkey(151, function() loop() end) -- this is automatically called from other script
--####################################--
 