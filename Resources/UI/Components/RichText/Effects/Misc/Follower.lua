-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.Follower
-- Decompile time: 0.73 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "Follower",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(245, 248, 250)),
            ColorSequenceKeypoint.new(0.696, Color3.fromRGB(38, 165, 242)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(29, 161, 242))),
        })
    end,
    render = function(a1) -- Line: 15 -- upvalues: New (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
        end
        New("UIGradient")({Rotation = 90, Color = a1:getColor(), Parent = v1})
        New("UIStroke")({Thickness = 4, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0), Parent = v1})
        return true
    end,
}