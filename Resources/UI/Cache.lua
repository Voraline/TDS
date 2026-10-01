-- Script path: ReplicatedStorage.Resources.UI.Cache
-- Decompile time: 0.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Client = ReplicatedStorage:WaitForChild("Client")
local Resources = ReplicatedStorage:WaitForChild("Resources")
local Promise = require(Resources.Common.Promise)
local Signal = require(Resources.Common.Standalone.Signal)
if RunService:IsRunning() then
    return (require(Client.Modules.Universal.Utilities.Cache))
end
return (setmetatable({}, {
    __index = function(a1, a2) -- Line: 19 -- upvalues: Signal (val), Promise (val)
        local v1 = {
            Updated = Signal.new(),
            Update = function(a1, ...) end,
            Get = function(a1) -- Line: 27 -- upvalues: Promise (upval)
                return Promise.resolve(nil)
            end,
        }
        rawset(a1, a2, v1)
        return v1
    end,
    __call = function(a1, a2) -- Line: 36
        return a1[a2]
    end,
}))