-- Script path: ReplicatedStorage.Resources.Universal.TimerClass
-- Decompile time: 3.53 ms

local v1 = game:GetService("RunService"):IsServer()
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u23 = {}
u23.__index = u23
local Maid = require(ReplicatedStorage.Resources.Common.Maid)
local Promise = if not v1 then require(ReplicatedStorage.Resources.Common.Promise) else require(ServerStorage.Server.Modules.Universal.Modules.Session.DataStore2.Promise)
local GameState = require(ReplicatedStorage.Resources.Universal.GameState)
local Signal = require(ReplicatedStorage.Resources.Common.Standalone.Signal)
local u68 = nil
if RunService:IsServer() then
    u68 = require(ServerStorage.Server.Modules.Universal.Controllers.ServerTagReplicator)
end
local u69 = {}

function u23.new(a1, a2, a3, a4, a5, a6) -- Line: 74
    -- upvalues: u23 (val), Maid (val), Signal (val), RunService (val), u68 (ref), u69 (val)
    local u9 = setmetatable({}, u23)
    u9.Maid = Maid.new()
    u9.StartTime = a4 or workspace:GetServerTimeNow()
    u9.EndTime = a2
    u9.LastTick = math.floor(u9.StartTime)
    u9.TimeScaled = a6 ~= false
    u9.OnSecond = Signal.new()
    u9.OnCountdown = Signal.new()
    u9.OnFinish = Signal.new()
    u9.TimePassSignals = {}
    u9.PingRate = a3 or 1
    u9.Maid:Mark(u9.OnSecond)
    u9.Maid:Mark(u9.OnFinish)
    u9.Maid:Mark(u9.OnCountdown)
    u9._type = a1
    u9._tick = 0
    if not a5 and RunService:IsServer() then
        u9.Replicator = u68.new(a1, {
            Duration = a2,
            TimeScaled = u9.TimeScaled,
            StartTime = u9.StartTime,
            EndTime = u9.StartTime + a2,
        })
        u9.Replicator.ReplicationFolder.Name = "TimerReplicator"
        u9.Maid:Mark(u9.Replicator)
    end
    u69[u9] = true
    u9.Maid:Mark(function() -- Line: 113 -- upvalues: u69 (upval), u9 (val)
        u69[u9] = nil
    end)
    return u9
end

function u23.AddTime(a1, a2) -- Line: 124 -- types: a1: table, a2: number
    a1.EndTime = a1.EndTime + a2
end

function u23.GetTimeLeft(a1) -- Line: 132
    return a1.EndTime - a1._tick
end

function u23.SetTimeLeftToAtLeast(a1, a2) -- Line: 140
    if a2 < a1.EndTime - a1._tick then
        a1.EndTime = a1._tick + a2
    end
end

function u23.Wait(a1) -- Line: 175 -- upvalues: Promise (val)
    return Promise.race({
        Promise.new(function(a1_2) -- Line: 177 -- upvalues: a1 (val)
            a1.OnFinish:Wait()
            a1_2()
        end),
        (Promise.new(function(a1_2, a2, a3) -- Line: 181 -- upvalues: a1 (val)
            while a1.Maid ~= nil do
                if a3() then
                    return
                end
                task.wait()
            end
            a2("Timer cancelled")
        end)),
    })
end

function u23.Cancel(a1) -- Line: 196
    a1.OnFinish:Fire()
    a1:Destroy()
end

function u23.GetTimePassedSignal(a1, a2) -- Line: 215 -- upvalues: Signal (val)
    local v1 = a1.TimePassSignals[a2]
    if v1 then
        return v1
    end
    v1 = Signal.new()
    a1.Maid:Mark(v1)
    a1.TimePassSignals[a2] = v1
    return v1
end

function u23:Destroy() -- Line: 238
    if self.Maid then
        self.Maid:Sweep()
        self.Maid = nil
    end
end

function u23.clear() -- Line: 252 -- upvalues: u69 (val)
    for i in u69 do
        i:Destroy()
    end
end

RunService.Heartbeat:Connect(function(a1) -- Line: 258 -- upvalues: u69 (val), GameState (val), ReplicatedStorage (val)
    local EndTime, TimeScale, v1, v2, v3, v4
    local ServerTimeNow = workspace:GetServerTimeNow()
    local v5 = nil
    local v6 = nil
    for i in u69, v5, v6 do
        TimeScale = i.TimeScaled ~= false and GameState.TimeScale or 1
        v4 = i.PingRate / TimeScale
        if TimeScale == 0 then
            i.LastTick = i.LastTick + v1
        end
        if v4 < ServerTimeNow - i.LastTick then
            EndTime = i.EndTime
            if i._tick < EndTime then
                v2 = (ServerTimeNow - i.LastTick) * TimeScale
                i._tick = i._tick + v2
                v3 = not (v4 ~= 1) and math.floor(ServerTimeNow) or ServerTimeNow
                i.LastTick = v3
                while v4 <= v2 do
                    v2 = v2 - v4
                    i.OnSecond:Fire(i.EndTime - i._tick)
                end
                if (math.ceil(i.EndTime - i._tick)) <= 5 then
                    i.OnCountdown:Fire()
                end
            end
        end
        if i._type == "ClientUITimer" then
            ReplicatedStorage.State.Timer.Time.Value = math.ceil(i.EndTime - i._tick)
        end
        for k, v in pairs(i.TimePassSignals) do
            if k <= i._tick then
                i.TimePassSignals[k] = nil
                v:Fire()
            end
        end
        if i.EndTime <= i._tick then
            i.OnFinish:Fire()
            i:Destroy()
        end
    end
end)
return u23