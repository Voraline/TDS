-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.EnemyModifiers
-- Decompile time: 0.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EnemyModifiers = require(ReplicatedStorage.Resources.Universal.Content)("EnemyModifiers")
local u13 = {}
return function(a1) -- Line: 8 -- upvalues: u13 (val), EnemyModifiers (val) -- types: a1: string
    local v1 = u13[a1]
    if v1 then
        return v1
    end
    local v2 = EnemyModifiers:FindFirstChild((("%*Modifier"):format(a1)))
    if not v2 then
        return
    end
    local v3 = require(v2)
    u13[a1] = v3
    return v3
end