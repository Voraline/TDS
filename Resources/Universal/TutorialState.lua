-- Script path: ReplicatedStorage.Resources.Universal.TutorialState
-- Decompile time: 1.21 ms

local v1 = game:GetService("RunService"):IsServer()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Signal = require(ReplicatedStorage.Resources.Common.Standalone.Signal)
local v2 = {ScoutPlaced = false}
if RunService:IsServer() then
    v2.Replicator = require(ServerStorage.Server.Modules.Universal.Controllers.ServerTagReplicator).new(
        "TutorialState",
        {ScoutPlaced = false, ScoutTargetMode = false}
    )
    v2.Replicator:Hook(v2)
    return v2
end
local TagReplicator = require(ReplicatedStorage.Client.Modules.Universal.Utilities.TagReplicator)
local Promise = if not v1 then require(ReplicatedStorage.Resources.Common.Promise) else require(ServerStorage.Server.Modules.Universal.Modules.Session.DataStore2.Promise)
local Enum = require(ReplicatedStorage.Resources.Universal.Enum)
local Middleware = require(ReplicatedStorage.Resources.Universal.Middleware)
local u81 = {}
u81.Updated = Signal.new()

function u81.GetState() -- Line: 37 -- upvalues: Promise (val), u81 (val)
    return Promise.new(function(a1) -- Line: 38 -- upvalues: u81 (upval)
        while not u81.State do
            task.wait()
        end
        a1(u81.State)
    end)
end

TagReplicator.hook("GameState", function(a1, a2) -- Line: 46 -- upvalues: u81 (val), Middleware (val), Enum (val)
    a2:Hook(a2)
    a2:Hook(u81)
    u81.State = a2
    u81.Replicator = a2
    ;(a2:GetStateChangedSignal("Wave")):Connect(function(a1) -- Line: 53 -- upvalues: Middleware (upval), Enum (upval)
        Middleware:RunFunction(Enum.HookType.OnNextWave, nil, function() -- Line: 54 -- upvalues: a1 (val)
            return a1
        end)
    end)
    u81.Updated:Fire(a2)
end)
return u81