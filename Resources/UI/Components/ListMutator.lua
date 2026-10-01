-- Script path: ReplicatedStorage.Resources.UI.Components.ListMutator
-- Decompile time: 0.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Resources.UI.Fusion)
local Observer = Fusion.Observer
local Value = Fusion.Value
return function(a1, a2, a3) -- Line: 7 -- upvalues: Value (val), Observer (val)
    local function generateList() -- Line: 8 -- upvalues: a1 (val), a2 (val)
        local v1 = {}
        for k, v in pairs(a1:get(false)) do
            v1[k] = (a2(k, v))
        end
        return v1
    end

    local u7 = Value((generateList()))
    local v1 = (Observer(a1)):onChange(function() -- Line: 18 -- upvalues: u7 (val), generateList (val)
        u7:set((generateList()))
    end)
    if not a3 then
        return u7, v1
    end
    table.insert(a3, v1)
    return u7
end