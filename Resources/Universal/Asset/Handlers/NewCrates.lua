-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.NewCrates
-- Decompile time: 0.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Resources.Universal.Content)
local table = require(ReplicatedStorage.Resources.Globals.table)
local Crate = Content("Crate")
local u18 = {}
return function(a1) -- Line: 9 -- upvalues: u18 (val), ReplicatedStorage (val), Crate (val), table (val)
    local v1 = u18[a1]
    if v1 then
        return v1
    end
    local v2 = (ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Crates"):WaitForChild(a1)
    local v3 = require(Crate:WaitForChild(a1))
    local Model = v2:WaitForChild("Model")
    local Animation = v2:WaitForChild("Animation")
    local VFX = v2:FindFirstChild("VFX")
    local v4 = table.merge({
        Model = Model,
        Animation = Animation,
        Animated = Model:FindFirstChild("AnimationController") ~= nil,
        VFX = VFX,
    }, v3)
    u18[a1] = v4
    return v4
end