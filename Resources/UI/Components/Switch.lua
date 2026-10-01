-- Script path: ReplicatedStorage.Resources.UI.Components.Switch
-- Decompile time: 0.27 ms

local Computed = require(game.ReplicatedStorage.Resources.UI.Fusion).Computed
return function(a1, a2) -- Line: 4 -- upvalues: Computed (val)
    local u3 = if not a2 then 0 else -1
    return Computed(function() -- Line: 7 -- upvalues: a1 (val), u3 (val)
        if a1:get() then
            return 0 - u3
        end
        return u3 + 1
    end)
end