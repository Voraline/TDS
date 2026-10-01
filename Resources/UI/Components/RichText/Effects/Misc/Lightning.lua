-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.Lightning
-- Decompile time: 0.71 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "Lightning",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 236, 126)),
            ColorSequenceKeypoint.new(0.218, Color3.fromRGB(195, 191, 113)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 239, 212)),
            ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 246, 126)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 215, 114))),
        })
    end,
    render = function(a1) -- Line: 17 -- upvalues: New (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
        end
        New("UIGradient")({Rotation = 60, Color = a1:getColor(), Parent = v1})
        New("UIStroke")({Thickness = 4, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0), Parent = v1})
        return true
    end,
}