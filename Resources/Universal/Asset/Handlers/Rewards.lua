-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.Rewards
-- Decompile time: 0.43 ms

local Name, v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Resources.Globals.math)
require(ReplicatedStorage.Resources.Globals.table)
local u15 = {}
for k, v in pairs((ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Rewards")):GetChildren()) do
    Name = v.Name
    if Name then
        v1 = require(v)
        if v1 then
            u15[Name] = v1
        end
    end
end
return function(a1) -- Line: 25 -- upvalues: u15 (val)
    return not a1 and u15 or u15[a1]
end