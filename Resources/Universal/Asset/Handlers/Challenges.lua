-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.Challenges
-- Decompile time: 0.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Content = require(ReplicatedStorage.Resources.Universal.Content)
local table = require(ReplicatedStorage.Resources.Globals.table)
local Challenges = Content("Challenges")
local u23 = {}
return function(a1) -- Line: 52 -- upvalues: u23 (val), Challenges (val), table (val), RunService (val) -- types: a1: string
    local v1 = u23[a1]
    if v1 then
        return v1
    end
    local v2 = Challenges:WaitForChild(a1)
    v1 = table.merge({name = a1}, require(v2))
    if not RunService:IsServer() then
        v1.onServerLoad = nil
    end
    u23[a1] = v1
    return v1
end