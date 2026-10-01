-- Script path: ReplicatedStorage.Resources.SharedData.RarityWeights
-- Decompile time: 0.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Resources.Universal.Enum)
local u10 = {
    Enum.SkinRarity.Rare,
    Enum.SkinRarity.Legendary,
    Enum.SkinRarity.Golden,
    Enum.SkinRarity.Event,
    Enum.SkinRarity.Exclusive,
}
local v1 = {
    [Enum.SkinRarity.Common] = 40,
    [Enum.SkinRarity.Uncommon] = 25,
    [Enum.SkinRarity.Rare] = 10,
    [Enum.SkinRarity.Legendary] = 5,
    [Enum.SkinRarity.Golden] = 1,
    [Enum.SkinRarity.Event] = 1,
    [Enum.SkinRarity.Exclusive] = 1,
}
local v2 = {
    __call = function(a1, a2, a3) -- Line: 24 -- upvalues: u10 (val) -- types: a3: number
        local v1 = if not table.find(u10, a2) then 0 else a3
        return a1[a2] * (v1 + 1)
    end,
    __newindex = function() -- Line: 29
        error("Attempt to modify read-only table")
    end,
}
setmetatable(v1, v2)
return v1