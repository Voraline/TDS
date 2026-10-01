-- Script path: ReplicatedStorage.Resources.UI.Components.Prompts
-- Decompile time: 0.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
ReplicatedStorage:WaitForChild("Client")
if RunService:IsRunning() then
    require(ReplicatedStorage.Resources.Globals.table)
    require(ReplicatedStorage.Resources.Globals.math)
    return (require(ReplicatedStorage.Client.Modules.Universal.Interface.Elements.Prompts))
end

local function u35() end

local v1 = {
    __index = function(a1, a2) -- Line: 17 -- upvalues: u35 (val)
        return u35
    end,
    __call = function() end,
}
local u41 = setmetatable({}, v1)
return (setmetatable({}, {
    __index = function(a1, a2) -- Line: 25 -- upvalues: u41 (val)
        return u41
    end,
}))