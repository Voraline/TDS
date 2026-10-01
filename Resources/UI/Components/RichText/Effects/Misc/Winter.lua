-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.Winter
-- Decompile time: 1.18 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "WinterLights",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(140, 83, 255)),
            ColorSequenceKeypoint.new(0.311, Color3.fromRGB(106, 73, 173)),
            ColorSequenceKeypoint.new(0.613, Color3.fromRGB(99, 120, 255)),
            ColorSequenceKeypoint.new(0.746, Color3.fromRGB(63, 85, 184)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(119, 137, 255))),
        })
    end,
    render = function(a1) -- Line: 17 -- upvalues: New (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        New("UIGradient")({Name = "UIGradient", Rotation = -90, Color = a1:getColor(), Parent = v1})
        New("UIStroke")({Name = "UIStroke", Thickness = 4, Transparency = 0.5, Parent = v1})
        task.defer(function() -- Line: 42 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
    onCreate = function(self) -- Line: 49
        local adornee = self.adornee
        if not adornee then
            return
        end
        for i, j in adornee["1"]:GetChildren() do
            if j:IsA("Beam") then
                j.Attachment0 = adornee["1"]
                j.Attachment1 = adornee["2"]
            end
        end
    end,
    cleanUp = function(a1) -- Line: 64
        local adornee = a1.adornee
        if not adornee then
            return
        end
        for i, j in adornee:GetChildren() do
            if j:IsA("Attachment") then
                j:Destroy()
            end
        end
    end,
}