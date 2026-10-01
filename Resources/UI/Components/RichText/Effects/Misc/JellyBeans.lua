-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.JellyBeans
-- Decompile time: 1.05 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "JellyBeans",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 26, 106)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(123, 96, 255))),
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
            New("UIGradient")({Rotation = 99, Color = a1:getColor(), Parent = v1})
            New("UIStroke")({
                Name = "UIStroke",
                Thickness = 3,
                Color = Color3.fromRGB(145, 98, 135),
                Parent = v1,
            })
            a1.created = true
        end
        local adornee = a1.adornee
        if not adornee then
            return
        end
        adornee["1"].GlowBeam.Attachment0 = adornee["1"]
        adornee["1"].GlowBeam.Attachment1 = adornee["2"]
        return true
    end,
}