-- Script path: ReplicatedStorage.Resources.UI.Components.Binder
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Observer = require(ReplicatedStorage.Resources.UI.Fusion).Observer
return function(a1, a2) -- Line: 6 -- upvalues: Observer (val)
    a2(a1:get(false))
    return (Observer(a1)):onChange(function() -- Line: 9 -- upvalues: a2 (val), a1 (val)
        a2(a1:get(false))
    end)
end