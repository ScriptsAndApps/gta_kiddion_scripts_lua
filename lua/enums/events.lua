Event = {
    OnPlayerChanged = "OnPlayerChanged", -- > function(Ped|nil oldPlayer, Ped|nil newPlayer)
    OnPlayerStateChanged = "OnPlayerStateChanged", -- > function(Integer oldState, Integer newState)
    OnVehicleChanged = "OnVehicleChanged", -- > function(Vehicle|nil oldVehicle, Vehicle|nil newVehicle)
    OnWeaponChanged = "OnWeaponChanged" -- > function(Weapon|nil oldWeapon, Weapon|nil newWeapon)
}
events = {
    "OnPlayerChanged", -- > function(Ped|nil oldPlayer, Ped|nil newPlayer)
    "OnPlayerStateChanged", -- > function(Integer oldState, Integer newState)
    "OnVehicleChanged", -- > function(Vehicle|nil oldVehicle, Vehicle|nil newVehicle)
    "OnWeaponChanged" -- > function(Weapon|nil oldWeapon, Weapon|nil newWeapon)
}