-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.The32
-- Decompile time: 0.78 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "The32",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
            ColorSequenceKeypoint.new(0.277, Color3.fromRGB(13, 9, 0)),
            ColorSequenceKeypoint.new(0.491, Color3.fromRGB(43, 0, 79)),
            ColorSequenceKeypoint.new(0.804, Color3.fromRGB(112, 0, 142)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 0, 255))),
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
                    Rotation = 90,
                    Color = a1:getColor(),
                    Offset = Vector2.new(0, 0.05),
                    Parent = v,
                })
                New("UIStroke")({Thickness = 2, Transparency = 0.5, Parent = v})
            end
        end
        a1.stroke = true
    end,
}