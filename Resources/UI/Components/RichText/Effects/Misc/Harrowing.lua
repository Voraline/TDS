-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.Harrowing
-- Decompile time: 0.81 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "Harrowing",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 25, 50)),
            ColorSequenceKeypoint.new(0.355, Color3.fromRGB(90, 62, 62)),
            ColorSequenceKeypoint.new(0.623, Color3.fromRGB(239, 161, 36)),
            ColorSequenceKeypoint.new(0.818, Color3.fromRGB(255, 201, 165)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 201, 165))),
        })
    end,
    render = function(a1) -- Line: 17 -- upvalues: New (val)
        local props = a1.props
        local v1 = a1.labels:Get()
        local stroke = a1.stroke
        for i, v in ipairs(v1) do
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                New("UIGradient")({
                    Rotation = -83,
                    Color = a1:getColor(),
                    Offset = Vector2.new(0.3, 0),
                    Parent = v,
                })
                New("UIStroke")({
                    Thickness = 4,
                    Transparency = 0.5,
                    Color = Color3.fromRGB(107, 71, 0),
                    Parent = v,
                })
            end
        end
        a1.stroke = true
        if not a1.created then
            a1.created = true
        end
        return true
    end,
}