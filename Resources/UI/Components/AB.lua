-- Script path: ReplicatedStorage.Resources.UI.Components.AB
-- Decompile time: 0.37 ms

local Resources = (game:GetService("ReplicatedStorage")).Resources
local Computed = require(Resources.UI.Fusion).Computed
return function(a1, a2, a3) -- Line: 6 -- upvalues: Computed (val)
    return Computed(function() -- Line: 7 -- upvalues: a1 (val), a3 (val), a2 (val)
        if a1:get() then
            return a3
        end
        return a2
    end)
end