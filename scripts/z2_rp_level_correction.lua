local enabled = false

SubMenu=menu.add_submenu("Reset level here")
SubMenu:add_action("--- reset level ---", function() end)
local first = true
local function resetmenu()
               SubMenu:clear()
               SubMenu:add_action("--- reset level ---", function() end)
               enabled = not enabled
               SubMenu:add_toggle("Reset level to 5", function() return enabled end,function()local mpIndex = globals.get_int(1574915) 
                    if mpIndex ~= nil then
                        if mpIndex > 1 or mpIndex < 0 then
                            return
                        end
                        enabled = not enabled
                        local newRP = globals.get_int(294355 + 5) + 100
                        if mpIndex == 0 then
                            stats.set_int("MP0_CHAR_SET_RP_GIFT_ADMIN", newRP)
                        else
                            stats.set_int("MP1_CHAR_SET_RP_GIFT_ADMIN", newRP)
                        end
                        resetmenu()
                     end 
            end) 
            
            SubMenu:add_toggle("Reset level to 32", function() return enabled end,function()local mpIndex = globals.get_int(1574915) 
                    if mpIndex ~= nil then
                        if mpIndex > 1 or mpIndex < 0 then
                            return
                        end
                        enabled = not enabled
                        local newRP = 200000
                        if mpIndex == 0 then
                            stats.set_int("MP0_CHAR_SET_RP_GIFT_ADMIN", newRP)
                        else
                            stats.set_int("MP1_CHAR_SET_RP_GIFT_ADMIN", newRP)
                        end
                        resetmenu()
                     end 
            end)
            
            SubMenu:add_toggle("Reset level to 75", function() return enabled end,function()local mpIndex = globals.get_int(1574915) 
                    if mpIndex ~= nil then
                        if mpIndex > 1 or mpIndex < 0 then
                            return
                        end
                        enabled = not enabled
                        local newRP = 938715
                        if mpIndex == 0 then
                            stats.set_int("MP0_CHAR_SET_RP_GIFT_ADMIN", newRP)
                        else
                            stats.set_int("MP1_CHAR_SET_RP_GIFT_ADMIN", newRP)
                        end
                        resetmenu()
                     end 
            end) 
            
            SubMenu:add_int_range("Set custom rp level ", 10000, 538715, 80000000, function() return 2000000 end, function(value)
            local mpIndex = globals.get_int(1574915) 
                    if mpIndex ~= nil then
                        if mpIndex > 1 or mpIndex < 0 then
                            return
                        end
                        enabled = not enabled
                        local newRP = value
                        if mpIndex == 0 then
                            stats.set_int("MP0_CHAR_SET_RP_GIFT_ADMIN", newRP)
                        else
                            stats.set_int("MP1_CHAR_SET_RP_GIFT_ADMIN", newRP)
                        end
                        resetmenu()
                     end 
            end)
            
            
            if first then
                first = false
            else
                SubMenu:add_action("--- now join a new session! ---", function() end)
            end
end
resetmenu()
