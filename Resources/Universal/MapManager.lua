-- Script path: ReplicatedStorage.Resources.Universal.MapManager
-- Decompile time: 1.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local u17 = RunService:IsServer()
local Enum = require(script.Parent.Enum)
local GameState = require(script.Parent.GameState)
local Signal = require(ReplicatedStorage.Resources.Common.Standalone.Signal)
local Promise = if not u17 then require(ReplicatedStorage.Resources.Common.Promise) else require(ServerStorage.Server.Modules.Universal.Modules.Session.DataStore2.Promise)
local u48 = nil
local u49 = {}
u49.MapChanged = Signal.new()

local function getContextualMap(a1) -- Line: 19
    -- upvalues: u17 (val), GameState (val), ReplicatedStorage (val), Enum (val)
    if u17 then
        return a1
    end
    local v1, v2 = GameState.GetAsync("GameMode"):await()
    if not v1 then
        warn("could not get GameMode (This should never error)")
        return a1
    end
    if v2 == "PVP" then
        return (a1:WaitForChild((Enum.Team.ToString((require(ReplicatedStorage.Client.Modules.Universal.Modules.PlayerReplicator).GetLocalPlayer():expect()).Team))))
    end
    return a1
end

workspace.ChildAdded:Connect(function(a1) -- Line: 46 -- upvalues: u48 (ref), getContextualMap (val), u49 (val)
    if a1.Name == "Map" and a1 ~= u48 then
        u48 = getContextualMap(a1)
        u49.MapChanged:Fire(u48)
    end
end)
task.spawn(function() -- Line: 53 -- upvalues: u48 (ref), getContextualMap (val), u49 (val)
    if workspace:FindFirstChild("Map") then
        u48 = getContextualMap(workspace:FindFirstChild("Map"))
        u49.MapChanged:Fire(u48)
    end
end)

function u49.GetLoadedMap() -- Line: 60 -- upvalues: Promise (val), u48 (ref)
    return Promise.new(function(a1) -- Line: 61 -- upvalues: u48 (upval)
        while not u48 do
            task.wait()
        end
        a1(u48)
    end)
end

function u49.GetLoadedMapRaw() -- Line: 69 -- upvalues: u48 (ref)
    return u48
end

return u49