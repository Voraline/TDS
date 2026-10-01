-- Script path: ReplicatedStorage.Resources.Universal.Thread
-- Decompile time: 1.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(ReplicatedStorage.Resources.Globals.math)
local table = require(ReplicatedStorage.Resources.Globals.table)
RunService:IsStudio()
require(ReplicatedStorage.Resources.Common.Maid)
local Scheduler = require(ReplicatedStorage.Resources.Scheduler)
require(ReplicatedStorage.Resources.Common.Standalone.Signal)
local u38 = {_yields = {}, _functions = {}}

function u38.Add(a1, a2, a3) -- Line: 21 -- upvalues: u38 (val)
    u38._functions[a1] = {
        f = function() -- Line: 24 -- upvalues: a2 (val)
            a2()
        end,
        n = a3 or "Unnamed",
    }
end

function u38.Remove(a1) -- Line: 33 -- upvalues: u38 (val)
    u38._functions[a1] = nil
end

function u38.Wait(a1) -- Line: 39 -- upvalues: table (val), u38 (val)
    local v1 = coroutine.running()
    table.insert(u38._yields, {time = a1 or 1, clock = tick(), thread = v1})
    return coroutine.yield()
end

Scheduler.add("CustomThreads", RunService.Stepped, function() -- Line: 55 -- upvalues: u38 (val), table (val)
    local clock, thread, time, v1, v2
    debug.profilebegin("Threads")
    for k, v in pairs(u38._yields) do
        time = v.time
        clock = v.clock
        if time <= tick() - clock then
            thread = v.thread
            if thread then
                coroutine.resume(thread)
                table.remove(u38._yields, k)
            end
        end
    end
    for k2, i in pairs(u38._functions) do
        debug.profilebegin("Step_" .. i.n)
        if not i.t then
            i.t = coroutine.create(i.f)
            v1, v2 = coroutine.resume(i.t)
            i.s = v1
            i.m = v2
        elseif coroutine.status(i.t) == "dead" or not i.t then
            i.t = nil
        end
        debug.profileend()
    end
    debug.profileend()
end)
return u38