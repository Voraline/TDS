-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.NewDebuffs
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debuffs = require(ReplicatedStorage.Resources.Universal.Content)("Debuffs")
local u13 = {}
return function(a1) -- Line: 8 -- upvalues: u13 (val), Debuffs (val) -- types: a1: string
    local v1 = u13[a1]
    if v1 then
        return v1
    end
    local v2 = require(Debuffs:WaitForChild(a1))
    u13[a1] = v2
    return v2
end