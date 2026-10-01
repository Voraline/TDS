-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Text.Binary
-- Decompile time: 0.73 ms

local Fusion = require(game:GetService("ReplicatedStorage").Resources.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
return {
    DesiredType = "Word",
    Particle = "Binary",
    render = function(a1) -- Line: 9 -- upvalues: New (val), Children (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new()
        end
        local UIStroke = New("UIStroke")
        local v2 = {
            Name = "UIStroke",
            Color = Color3.fromRGB(255, 255, 255),
            Thickness = 4,
            Parent = v1,
        }
        v2[Children] = {
            New("UIGradient")({
                Name = "UIGradient",
                Rotation = -90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 38, 109)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 115, 232))),
                }),
            }),
        }
        UIStroke(v2)
        return true
    end,
}