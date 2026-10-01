-- Script path: ReplicatedStorage.Resources.UI.Components.Sequence
-- Decompile time: 0.59 ms

local Fusion = require(game.ReplicatedStorage.Resources.UI.Fusion)
local Tween = Fusion.Tween
local Spring = Fusion.Spring
local Computed = Fusion.Computed
Switch = require(script.Parent.Switch)
return function(a1, a2, ...) -- Line: 8 -- upvalues: Tween (val), Spring (val), Computed (val)
    local u2 = {}
    u2[1] = ...
    local v1 = TweenInfo.new(a2, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 1)
    local u15 = Tween(Switch(a1), v1)
    return (setmetatable({}, {
        __index = function(a1, a2) -- Line: 15 -- upvalues: Spring (upval), Computed (upval), u15 (val), u2 (val)
            local v1 = Spring(Computed(function() -- Line: 17 -- upvalues: u15 (upval), a2 (val)
                if (u15:get()) < a2 then
                    return 0
                end
                return 1
            end), unpack(u2))
            rawset(a1, a2, v1)
            return v1
        end,
    }))
end