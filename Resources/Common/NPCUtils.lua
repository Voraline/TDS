-- Script path: ReplicatedStorage.Resources.Common.NPCUtils
-- Decompile time: 1.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TimescaleUtilities = require(ReplicatedStorage.Resources.Common.TimescaleUtilities)

local function resumeThread(a1, a2) -- Line: 12 -- types: a2: thread
    local v1, v2 = coroutine.resume(a2)
    if not v1 then
        warn("[NPC] coroutine resume failed for", a1.Name, v2)
        a1._threadCo = nil
        a1._threadDelayRemaining = 0.1
    end
end

return {
    stepThread = function(a1, a2) -- Line: 21 -- upvalues: TimescaleUtilities (val) -- types: a2: number
        local v1, v2
        if not a1.ThreadFunction then
            return
        end
        local _threadCo = a1._threadCo
        local _threadDelayRemaining = a1._threadDelayRemaining
        if _threadDelayRemaining then
            if _threadDelayRemaining > 0 then
                a1._threadDelayRemaining = a1._threadDelayRemaining - a2
                return
            end
            if _threadCo and coroutine.status(_threadCo) == "suspended" then
                v1, v2 = coroutine.resume(_threadCo)
                if not v1 then
                    warn("[NPC] coroutine resume failed for", a1.Name, v2)
                    a1._threadCo = nil
                    a1._threadDelayRemaining = 0.1
                end
            end
        end
        if not _threadCo or coroutine.status(_threadCo) == "dead" then
            local v3 = coroutine.create(function() -- Line: 41 -- upvalues: a1 (val)
                local success, result = pcall(a1.ThreadFunction, a1)
                if not success then
                    warn("[NPC] ThreadFunction error for", a1.Name, result)
                end
            end)
            a1._threadCo = v3
            TimescaleUtilities._registerNPCThread(v3, a1)
            v1, v2 = coroutine.resume(v3)
            if not v1 then
                warn("[NPC] coroutine resume failed for", a1.Name, v2)
                a1._threadCo = nil
                a1._threadDelayRemaining = 0.1
            end
        end
    end,
}