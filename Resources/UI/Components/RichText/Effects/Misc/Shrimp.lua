-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.Shrimp
-- Decompile time: 0.75 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "Shrimp",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 166, 106)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 202, 202))),
        })
    end,
    render = function(a1) -- Line: 14 -- upvalues: New (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        New("UIGradient")({Rotation = -90, Color = a1:getColor(), Parent = v1})
        New("UIStroke")({
            Thickness = 4,
            Transparency = 0.28,
            Color = Color3.fromRGB(239, 138, 92),
            Parent = v1,
        })
        return true
    end,
}