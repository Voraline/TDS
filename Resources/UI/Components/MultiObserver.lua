-- Script path: ReplicatedStorage.Resources.UI.Components.MultiObserver
-- Decompile time: 0.60 ms

local Observer = require(game.ReplicatedStorage.Resources.UI.Fusion).Observer
return function(a1, a2) -- Line: 4 -- upvalues: Observer (val)
    local u2 = {}

    local function u3() -- Line: 7 -- upvalues: a1 (val)
        local v1 = {}
        for k, v in pairs(a1) do
            table.insert(v1, (v:get(false)))
        end
        return unpack(v1)
    end

    for i, v in ipairs(a1) do
        table.insert(u2, (Observer(v):onChange(function() -- Line: 16 -- upvalues: a2 (val), u3 (val)
            a2(u3())
        end)))
    end
    a2(u3())
    return function() -- Line: 25 -- upvalues: u2 (val)
        for i, v in ipairs(u2) do
            v()
        end
        table.clear(u2)
    end
end