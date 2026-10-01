-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.StarryNight
-- Decompile time: 0.69 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "StarryNight",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 36, 76)),
            ColorSequenceKeypoint.new(0.199, Color3.fromRGB(214, 49, 184)),
            ColorSequenceKeypoint.new(0.322, Color3.fromRGB(149, 50, 249)),
            ColorSequenceKeypoint.new(0.626, Color3.fromRGB(29, 126, 211)),
            ColorSequenceKeypoint.new(0.701, Color3.fromRGB(53, 184, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 36, 76))),
        })
    end,
    render = function(a1) -- Line: 18 -- upvalues: New (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
        end
        New("UIGradient")({Rotation = 45, Color = a1:getColor(), Parent = v1})
        New("UIStroke")({Thickness = 4, Color = Color3.fromRGB(81, 35, 147), Parent = v1})
        return true
    end,
}