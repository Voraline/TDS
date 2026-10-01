-- Script path: ReplicatedStorage.Resources.SharedData.FFlagAtoms
-- Decompile time: 0.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local FFlagManager = if not RunService:IsServer() then require(ReplicatedStorage.Client.Modules.Universal.Compatibility.Controllers.FFlagController) else require(ServerStorage.Server.Modules.Universal.Controllers.FFlagManager)
local Updated = FFlagManager.Updated
local u39 = {}
local u40 = {}
Updated:Connect(function(a1) -- Line: 18 -- upvalues: u40 (val), u39 (val)
    local v1
    for i, j in u40 do
        v1 = j()
        u39[i](v1)
    end
end)
return function(a1, a2) -- Line: 25 -- upvalues: u39 (val), Charm (val), u40 (val), FFlagManager (val) -- types: a1: string
    if u39[a1] then
        return u39[a1]
    end
    local v1 = Charm.atom(a2)
    u39[a1] = v1
    u40[a1] = (FFlagManager.get(a1, a2))
    v1(u40[a1]())
    return v1
end