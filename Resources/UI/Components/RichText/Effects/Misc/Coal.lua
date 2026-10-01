-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.Coal
-- Decompile time: 0.78 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "Coal",
    render = function(a1) -- Line: 7 -- upvalues: New (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
            New("UIGradient")({
                Name = "UIGradient",
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(186, 186, 186)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
                }),
                Parent = v,
            })
            New("UIStroke")({Name = "UIStroke", Thickness = 4, Transparency = 0.5, Parent = v})
        end
        return true
    end,
}