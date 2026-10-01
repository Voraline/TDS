-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.CircuitHacker
-- Decompile time: 0.79 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "CircuitHacker",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 176, 48)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(208, 139, 0))),
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
                Thickness = 5,
                Color = Color3.fromRGB(0, 125, 77),
                Parent = v1,
            })
            a1.created = true
        end
        local adornee = a1.adornee
        if not adornee then
            return
        end
        for k, n in adornee["1"]:GetChildren() do
            if n:IsA("Beam") then
                n.Attachment0 = adornee["1"]
                n.Attachment1 = adornee["2"]
            end
        end
        return true
    end,
}