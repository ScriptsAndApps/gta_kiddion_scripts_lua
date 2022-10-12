
-- do not edit its part of the loop functionality
local enable = false
local delay = 0.5
 
local function loop()
	while enable do
		menu.send_key_press(151)
		sleep(delay)
	end
end
 
menu.register_hotkey(232, function() -- do not edit its part of the loop functionality
	if not enable then
		enable = true
		loop()
	end
end)

-- do not edit its part of the loop functionality