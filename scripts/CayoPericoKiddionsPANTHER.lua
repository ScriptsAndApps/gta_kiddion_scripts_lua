local cayo_menu = menu.add_submenu('Cayo Heist Editor - panther')

local function WriteText(text)
    cayo_menu:add_action(text, function() end) -- Creates A Fake Action to provide a text.
end

WriteText('Create Cayo Heist')

WriteText('Select Type Of Target')

cayo_menu:add_int_range("Set Up Max Cayo - # of Players:", 1, 1, 4, function() return 1 end, function(NumPlayers)
	if NumPlayers == 1 then
		LootValue = 538484
	end
	if NumPlayers == 2 then
		LootValue = 1235151 -- Use 50%/50% split
	end
	if NumPlayers == 3 then
		LootValue = 1375382 -- Use 35%/35%/30% split
	end
	if NumPlayers == 4 then
		LootValue = 1583484 -- Use 25%/25%/25%/25% split
	end
	PlayerIndex = globals.get_int(1574907)
	if PlayerIndex == 0 then
		stats.set_int("MP0_H4_PROGRESS", 131055)
		stats.set_int("MP0_H4CNF_GRAPPEL", 5156)
		stats.set_int("MP0_H4CNF_TROJAN", 1)
		stats.set_int("MP0_H4CNF_TARGET", 5)
		stats.set_int("MP0_H4CNF_UNIFORM", 5256)
		stats.set_int("MP0_H4CNF_BS_GEN", -1)
		stats.set_int("MP0_H4CNF_WEAPONS", 3) -- 1: Aggressor [Assault SG + Machine Pistol + Machete + Grenade] 2: Conspirator [Military Rifle + AP + Knuckles + Stickies] 3: Crackshot [Sniper + AP + Knife + Molotov] 4: Saboteur [SMG Mk2 + SNS Pistol + Knife + Pipe Bomb] 5: Marksman [Assault Rifle MKII + Pistol MKII + Machete + Pipe Bomb]
		stats.set_int("MP0_H4_MISSIONS", -1)
		stats.set_int("MP0_H4LOOT_CASH_I", 0)
		stats.set_int("MP0_H4LOOT_CASH_I_SCOPED", 0)
		stats.set_int("MP0_H4LOOT_CASH_C", 0)
		stats.set_int("MP0_H4LOOT_CASH_C_SCOPED", 0)
		stats.set_int("MP0_H4LOOT_COKE_I", 0)
		stats.set_int("MP0_H4LOOT_COKE_I_SCOPED", 0)
		stats.set_int("MP0_H4LOOT_COKE_C", 16777215)
		stats.set_int("MP0_H4LOOT_COKE_C_SCOPED", 16777215)
		stats.set_int("MP0_H4LOOT_WEED_I", 0)
		stats.set_int("MP0_H4LOOT_WEED_I_SCOPED", 0)
		stats.set_int("MP0_H4LOOT_WEED_C", 0)
		stats.set_int("MP0_H4LOOT_WEED_C_SCOPED", 0)
		stats.set_int("MP0_H4LOOT_PAINT", 0)
		stats.set_int("MP0_H4LOOT_PAINT_SCOPED", 0)
		stats.set_int("MP0_H4LOOT_GOLD_C", 255)
		stats.set_int("MP0_H4LOOT_GOLD_C_SCOPED", 255)
		stats.set_int("MP0_H4LOOT_GOLD_V", LootValue)
	else
		stats.set_int("MP1_H4_PROGRESS", 131055)
		stats.set_int("MP1_H4CNF_GRAPPEL", 5156)
		stats.set_int("MP1_H4CNF_TROJAN", 1)
		stats.set_int("MP1_H4CNF_TARGET", 5) -- Pink Diamond = 3, Panther = 5;
		stats.set_int("MP1_H4CNF_UNIFORM", 5256)
		stats.set_int("MP1_H4CNF_BS_GEN", -1)
		stats.set_int("MP1_H4CNF_WEAPONS", 3) -- 1: Aggressor [Assault SG + Machine Pistol + Machete + Grenade] 2: Conspirator [Military Rifle + AP + Knuckles + Stickies] 3: Crackshot [Sniper + AP + Knife + Molotov] 4: Saboteur [SMG Mk2 + SNS Pistol + Knife + Pipe Bomb] 5: Marksman [Assault Rifle MKII + Pistol MKII + Machete + Pipe Bomb]
		stats.set_int("MP1_H4_MISSIONS", -1)
		stats.set_int("MP1_H4LOOT_CASH_I", 0)
		stats.set_int("MP1_H4LOOT_CASH_I_SCOPED", 0)
		stats.set_int("MP1_H4LOOT_CASH_C", 0)
		stats.set_int("MP1_H4LOOT_CASH_C_SCOPED", 0)
		stats.set_int("MP1_H4LOOT_COKE_I", 0)
		stats.set_int("MP1_H4LOOT_COKE_I_SCOPED", 0)
		stats.set_int("MP1_H4LOOT_COKE_C", 16777215)
		stats.set_int("MP1_H4LOOT_COKE_C_SCOPED", 16777215)
		stats.set_int("MP1_H4LOOT_WEED_I", 0)
		stats.set_int("MP1_H4LOOT_WEED_I_SCOPED", 0)
		stats.set_int("MP1_H4LOOT_WEED_C", 0)
		stats.set_int("MP1_H4LOOT_WEED_C_SCOPED", 0)
		stats.set_int("MP1_H4LOOT_PAINT", 0)
		stats.set_int("MP1_H4LOOT_PAINT_SCOPED", 0)
		stats.set_int("MP1_H4LOOT_GOLD_C", 255)
		stats.set_int("MP1_H4LOOT_GOLD_C_SCOPED", 255)
		stats.set_int("MP1_H4LOOT_GOLD_V", LootValue)
	end
end)
