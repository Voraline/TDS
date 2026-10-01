-- Script path: ReplicatedStorage.Resources.Universal.NetworkUtil
-- Decompile time: 0.48 ms

local v1 = {}
local u1 = {}

function v1.batch(a1, a2, ...) -- Line: 5 -- upvalues: u1 (val) -- types: a1: string, a2: string
    if not u1[a1] then
        u1[a1] = {}
    end
    if not u1[a1][a2] then
        local v1 = u1[a1]
        v1[a2] = {}
    end
    table.insert(u1[a1][a2], {...})
end

function v1.flush(a1, a2) -- Line: 20 -- upvalues: u1 (val) -- types: a1: string, a2: string
    if u1[a1] and u1[a1][a2] then
        local v1 = u1[a1][a2]
        local v2 = u1[a1]
        v2[a2] = {}
        return v1
    end
end

return v1