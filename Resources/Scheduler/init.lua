-- Script path: ReplicatedStorage.Resources.Scheduler
-- Decompile time: 2.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NoYield = require(ReplicatedStorage.Resources.Common.NoYield)
local Profiler = require(script.Profiler)
local u14 = {}
u14.customSchedule = require(script.CustomSchedule)
u14.disabledSystems = {}
u14.profiles = Profiler.profiles
u14._connections = {}
u14._callbacks = {}
local u23 = {}

local function getSignalName(a1) -- Line: 30 -- upvalues: u23 (val) -- types: a1: userdata
    if u23[a1] then
        return u23[a1]
    end
    local v1 = tostring(a1):match("^Signal%s(.+)$")
    assert(v1, "Unable to get signal name")
    u23[a1] = v1
    return v1
end

local u25 = 0

local function getId() -- Line: 43 -- upvalues: u25 (ref)
    u25 = u25 + 1
    return string.format("%02x", u25)
end

function u14._execute(a1, ...) -- Line: 50 -- upvalues: u14 (val) -- types: a1: userdata
    local result, success
    local v1 = u14._callbacks[a1]
    if not v1 then
        return
    end
    local disabledSystems = u14.disabledSystems
    debug.profilebegin("Scheduler")
    local v2 = nil
    local v3 = nil
    for i, j in v1, v2, v3 do
        if not disabledSystems[j] then
            debug.profilebegin((("Schedule_%*"):format(j)))
            success, result = xpcall(i, debug.traceback, ...)
            if not success then
                warn(result)
            end
            debug.profileend()
        end
    end
    debug.profileend()
end

function u14._addContext(a1) -- Line: 74 -- upvalues: u14 (val), u23 (val), Profiler (val) -- types: a1: userdata
    local v1
    if u14._connections[a1] then
        return false
    end
    if not u23[a1] then
        local v2 = tostring(a1):match("^Signal%s(.+)$")
        assert(v2, "Unable to get signal name")
        u23[a1] = v2
        v1 = v2
    else
        v1 = u23[a1]
    end
    if not Profiler.profiles[v1] then
        Profiler.profiles[v1] = {}
    end
    u14._connections[a1] = (a1:Connect(function(...) -- Line: 84 -- upvalues: u14 (upval), a1 (val)
        u14._execute(a1, ...)
    end))
    return true
end

function u14.getProfile(a1, a2) -- Line: 91 -- upvalues: Profiler (val) -- types: a1: string, a2: string
    return Profiler.getProfile(a2, a1)
end

function u14.profileCallback(a1, a2, ...) -- Line: 95 -- upvalues: Profiler (val) -- types: a1: string, a2: function
    local v1 = tick()
    a2(...)
    Profiler.updateProfile(a1, "Custom", tick() - v1)
end

function u14.customProfile(a1, a2) -- Line: 101 -- upvalues: Profiler (val) -- types: a1: string, a2: number
    Profiler.updateProfile(a1, "Custom", a2)
end

function u14.profile(a1, a2, a3) -- Line: 105 -- upvalues: Profiler (val) -- types: a1: string, a2: string, a3: number
    Profiler.updateProfile(a1, a2, a3)
end

function u14.add(a1, a2, a3) -- Line: 109
    -- upvalues: u14 (val), u23 (val), NoYield (val), Profiler (val)
    local u30
    u14._addContext(a2)
    if not u14._callbacks[a2] then
        u14._callbacks[a2] = {}
    end
    if not u23[a2] then
        local v1 = tostring(a2):match("^Signal%s(.+)$")
        assert(v1, "Unable to get signal name")
        u23[a2] = v1
        u30 = v1
    else
        u30 = u23[a2]
    end

    local function profiledCallback(...) -- Line: 118
        -- upvalues: a1 (val), NoYield (upval), a3 (val), Profiler (upval), u30 (val)
        local v1 = tick()
        debug.profilebegin(a1)
        NoYield(a3, ...)
        debug.profileend()
        Profiler.updateProfile(a1, u30, tick() - v1)
    end

    u14._callbacks[a2][profiledCallback] = a1
    return function() -- Line: 128
        -- upvalues: u14 (upval), a2 (val), profiledCallback (val), Profiler (upval), a1 (val), u30 (val)
        local v1 = u14._callbacks[a2]
        v1[profiledCallback] = nil
        Profiler.removeProfile(a1, u30)
    end
end

function u14.addDynamic(a1, a2, a3) -- Line: 134
    -- upvalues: u14 (val), u25 (ref)
    local add = u14.add
    u25 = u25 + 1
    return add(("%*_%*"):format(a1, (string.format("%02x", u25))), a2, a3)
end

function u14.stop() -- Line: 138 -- upvalues: u14 (val)
    for i, j in u14._connections do
        j:Disconnect()
    end
    u14._connections = {}
    u14._callbacks = {}
end

function u14.clear(a1) -- Line: 147 -- upvalues: u14 (val) -- types: a1: userdata
    u14.stop()
    u14.profiler = {}
end

return u14