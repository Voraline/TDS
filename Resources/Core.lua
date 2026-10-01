-- Script path: ReplicatedStorage.Resources.Core
-- Decompile time: 0.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Resources = ReplicatedStorage:WaitForChild("Resources")
local Globals = require(ReplicatedStorage.Resources.Universal.Globals)

local function InitializePackages(a1) -- Line: 11 -- upvalues: Globals (val)
    for i, v in ipairs(a1:GetChildren()) do
        if v:IsA("ModuleScript") then
            Globals.registerSingle(v.Name, v)
        end
    end
end

local Map = Resources:WaitForChild("Map")
if Map then
    local v1 = require(Map)
    if v1 then
        for k, v in pairs(v1) do
            Globals.register(Resources, {v})
        end
    end
end
InitializePackages(Packages)
if RunService:IsServer() then
    InitializePackages(ServerStorage:WaitForChild("Packages"))
end
return function(a1, a2) -- Line: 37 -- upvalues: Globals (val)
    Globals.register(a1, a2 or {})
end