-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.SugarRush
-- Decompile time: 0.80 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "SugarRush",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(179, 0, 238)),
            ColorSequenceKeypoint.new(0.197, Color3.fromRGB(0, 107, 238)),
            ColorSequenceKeypoint.new(0.365, Color3.fromRGB(0, 238, 139)),
            ColorSequenceKeypoint.new(0.524, Color3.fromRGB(0, 255, 38)),
            ColorSequenceKeypoint.new(0.711, Color3.fromRGB(255, 255, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 85, 0))),
        })
    end,
    render = function(a1) -- Line: 18 -- upvalues: New (val)
        local props = a1.props
        local v1 = a1.labels:Get()
        local stroke = a1.stroke
        for i, v in ipairs(v1) do
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                New("UIGradient")({Color = a1:getColor(), Offset = Vector2.new(0.25, 0), Parent = v})
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