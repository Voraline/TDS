-- Script path: ReplicatedStorage.Resources.UI.Components.AnimationInstance
-- Decompile time: 0.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Resources.UI.Fusion)
local New = Fusion.New
local Hydrate = Fusion.Hydrate
local Cleanup = Fusion.Cleanup
return function(a1) -- Line: 8 -- upvalues: New (val), Hydrate (val), Cleanup (val)
    local Track = a1.Track
    if not Track then
        Track = New("Animation")({AnimationId = string.format("rbxassetid://%d", a1.Id or 0)})
    end
    local v1 = Hydrate(a1.Target:LoadAnimation(Track))
    local v2 = {Looped = a1.Looped or true}
    v2[Cleanup] = {
        function() -- Line: 17 -- upvalues: a1 (val), Track (val)
            if not a1.Track then
                Track:Destroy()
            end
        end,
    }
    v1 = v1(v2)
    if a1.TimePosition then
        v1.TimePosition = a1.TimePosition
    end
    v1:Play(0)
    if a1.Paused then
        v1:AdjustSpeed(0)
        v1.TimePosition = a1.TimePosition or 0
    end
    return v1
end