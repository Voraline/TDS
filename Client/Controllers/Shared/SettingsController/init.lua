-- Script path: ReplicatedStorage.Client.Controllers.Shared.SettingsController
-- Decompile time: 0.14 ms

local Modules = script:WaitForChild("Modules")
return {
    Game = require(Modules:WaitForChild("Game")),
    User = require(Modules:WaitForChild("User")),
}