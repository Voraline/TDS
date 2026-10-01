-- Script path: ReplicatedStorage.Resources.UI.Components.Animation
-- Decompile time: 0.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Resources.UI.Fusion)
local New = Fusion.New
local Hydrate = Fusion.Hydrate
local Cleanup = Fusion.Cleanup
return function(a1) -- Line: 8 -- upvalues: New (val), Hydrate (val), Cleanup (val)
    local Track = a1.Track or New("Animation")({AnimationId = string.format("rbxassetid://%d", a1.Id or 0)})
    local v1 = Hydrate(a1.Target:LoadAnimation(Track))({Looped = a1.Looped or true, [Cleanup] = {Track}})
    v1:Play()
    return v1
end