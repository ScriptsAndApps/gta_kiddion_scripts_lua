require("init")

local events = { "OnPlayerChanged", "OnVehicleChanged", "OnWeaponChanged" }

local cbs = {}
local keys = nil
local enabled = false

local function Trigger()
     if enabled then
        menu.call_heli_backup()
     end
 end

local function Toggle()
    if keys == nil then
        keys = {}
        for k, v in pairs({ KeyCode.W, KeyCode.A, KeyCode.S, KeyCode.D, KeyCode.VK_ESCAPE }) do
            table.insert(keys, menu.register_hotkey(v, Trigger))
        end
        for i = 1, #events do
            table.insert(cbs,menu.register_callback(events[i], Trigger))
        end
        Trigger()
        enabled = true
    else
        enabled = false
        for i = 1, #keys do
            menu.remove_hotkey(keys[i])
        end
        
        for i = 1, #cbs do
            menu.remove_callback(cbs[i])
        end
        cbs = {}
        keys = nil
    end
end


menu.add_toggle("Permanent heli Backup", function() return keys ~= nil end, Toggle)
