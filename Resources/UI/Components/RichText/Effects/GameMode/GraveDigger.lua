-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.GameMode.GraveDigger
-- Decompile time: 0.68 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "Gravedigger",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(173, 173, 173)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(92, 106, 88)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 44, 9))),
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