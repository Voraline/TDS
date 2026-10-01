-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.Crates
-- Decompile time: 0.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Resources.Globals.math)
local table = require(ReplicatedStorage.Resources.Globals.table)
local Crates = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Crates")
local u23 = {}
return function(a1) -- Line: 10 -- upvalues: u23 (val), Crates (val), table (val)
    local v1 = u23[a1]
    if not v1 then
        local v2 = Crates:WaitForChild(a1)
        v1 = table.merge({Model = v2:WaitForChild("Model"), Animation = v2:WaitForChild("Animation")}, (require(v2:WaitForChild("Data"))))
    end
    return v1
end