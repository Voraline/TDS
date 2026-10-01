-- Script path: ReplicatedStorage.Resources.Scheduler.Profiler
-- Decompile time: 0.76 ms

local u0 = {}

local function average(a1) -- Line: 12 -- types: a1: table
    local v1 = 0
    for i, j in a1 do
        v1 = v1 + j
    end
    return v1 / #a1
end

return {
    profiles = u0,
    getProfile = function(a1, a2) -- Line: 21 -- upvalues: u0 (val) -- types: a1: string, a2: string
        return u0[a2] and u0[a2][a1]
    end,
    updateProfile = function(a1, a2, a3) -- Line: 25 -- upvalues: u0 (val) -- types: a1: string, a2: string, a3: number
        local v1 = u0[a2]
        if not v1 then
            v1 = {}
            v1[a2] = v1
        end
        local v2 = v1[a1]
        if not v2 then
            v1[a1] = {average = 0, deltas = {}}
        end
        table.insert(v2.deltas, a3)
        if #v2.deltas > 10 then
            table.remove(v2.deltas, 1)
        end
        local deltas_2 = v2.deltas
        local v3 = 0
        for i, j in deltas_2 do
            v3 = v3 + j
        end
        v2.average = v3 / #deltas_2
        return v2
    end,
    removeProfile = function(a1, a2) -- Line: 52 -- upvalues: u0 (val) -- types: a1: string, a2: string
        local v1 = u0[a2]
        if not v1 then
            return
        end
        v1[a1] = nil
    end,
}