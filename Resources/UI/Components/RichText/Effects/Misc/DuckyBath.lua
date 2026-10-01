-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.DuckyBath
-- Decompile time: 0.71 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "DuckyBath",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 140, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 235, 82))),
        })
    end,
    render = function(a1) -- Line: 14 -- upvalues: New (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        if not a1.created then
            for i, j in a1.labels:Get() do
                j.TextColor3 = Color3.new(1, 1, 1)
            end
            New("UIGradient")({Name = "UIGradient", Rotation = -27, Color = a1:getColor(), Parent = v1})
            New("UIStroke")({
                Name = "UIStroke",
                Thickness = 3,
                Color = Color3.fromRGB(255, 162, 0),
                Parent = v1,
            })
            a1.created = true
        end
        if not a1.adornee then
            return
        end
        return true
    end,
}