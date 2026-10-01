-- Script path: ReplicatedStorage.Resources.UI.Components.Mutator
-- Decompile time: 0.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Resources.UI.Fusion)
local Observer = Fusion.Observer
local Value = Fusion.Value
return function(a1, a2, a3) -- Line: 7 -- upvalues: Value (val), Observer (val)
    local u10 = Value(a2(a1:get(false)))
    local v1 = (Observer(a1)):onChange(function() -- Line: 9 -- upvalues: u10 (val), a2 (val), a1 (val)
        u10:set((a2((a1:get(false)))))
    end)
    if not a3 then
        return u10, v1
    end
    table.insert(a3, v1)
    return u10
end