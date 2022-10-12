-- begin  loop function

local enn = false menu.add_toggle("Automatically end cutscenes", function() return enn end, function(value) enn = value end)

local function giverp()
    if enn then
      menu.end_cutscene()
    end
end

-- end  loop function


--####################################--
local function loop()
--------------------------------------------------------------

    -- call custom functions here to loop 
	 giverp()

---------------------------------------------------------------
end 
 menu.register_hotkey(151, function() loop() end) -- this is automatically called from other script
--####################################--
 