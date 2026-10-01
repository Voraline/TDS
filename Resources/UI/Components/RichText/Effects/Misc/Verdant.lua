-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.Verdant
-- Decompile time: 0.62 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "Verdant",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 113, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(171, 255, 14))),
        })
    end,
    render = function(a1) -- Line: 14 -- upvalues: New (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        if not a1.created then
            for i, v in ipairs(a1.labels:Get()) do
                v.TextColor3 = Color3.new(1, 1, 1)
            end
            New("UIGradient")({Rotation = -90, Color = a1:getColor(), Parent = v1})
            New("UIStroke")({
                Name = "UIStroke",
                Thickness = 3,
                Color = Color3.fromRGB(130, 130, 0),
                Parent = v1,
            })
            a1.created = true
        end
        return true
    end,
}