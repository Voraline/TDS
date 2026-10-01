-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.MeltingIce
-- Decompile time: 1.03 ms

local Fusion = require(game:GetService("ReplicatedStorage").Resources.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
return {
    DesiredType = "Word",
    Particle = "MeltingIce",
    getColor = function(a1) -- Line: 10
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 213, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(198, 246, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 213, 255))),
        })
    end,
    render = function(a1) -- Line: 18 -- upvalues: New (val), Children (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
        end
        New("UIGradient")({Rotation = 90, Color = a1:getColor(), Parent = v1})
        New("UIStroke")({Thickness = 4, Color = Color3.fromRGB(112, 147, 200), Parent = v1})
        local ImageLabel = New("ImageLabel")
        local v2 = {
            Name = "ImageLabel",
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Image = "rbxassetid://9039076279",
            ImageColor3 = Color3.fromRGB(230, 235, 255),
            ImageTransparency = 0.68,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(0, 270, 0.8, 0),
            ZIndex = -1,
            Parent = v1,
        }
        v2[Children] = {(New("UICorner")({Name = "UICorner"}))}
        ImageLabel(v2)
        return true
    end,
}