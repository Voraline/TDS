-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.Frozen
-- Decompile time: 1.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Fusion = require(ReplicatedStorage.Resources.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
return {
    DesiredType = "Word",
    Particle = "Frozen",
    render = function(a1, a2) -- Line: 12 -- upvalues: New (val), Children (val), TweenService (val) -- types: a1: table, a2: number
        local v1
        local v2 = a1.container:Get()
        if v2 == a1.root then
            v2 = a1.labels:Get()[1]
        end
        local v3 = a1.Stroke == true
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(185, 243, 255)
            if not v3 then
                New("UIStroke")({
                    Name = "UIStroke",
                    Thickness = 4,
                    Transparency = 0.84,
                    Color = Color3.fromRGB(185, 243, 255),
                    Parent = v,
                })
            end
        end
        if not v3 then
            a1.Stroke = true
        end
        if not a1.Background then
            local ImageLabel = New("ImageLabel")
            v1 = {
                Name = "ImageLabel",
                Image = "rbxassetid://9039076279",
                ImageColor3 = Color3.fromRGB(230, 235, 255),
                ImageTransparency = 0.68,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, -10, 0.5, 0),
                Size = UDim2.new(1, 20, 0.8, 0),
                ZIndex = -1,
                Parent = v2,
            }
            v1[Children] = {(New("UICorner")({Name = "UICorner"}))}
            a1.Background = ImageLabel(v1)
        end
        if not a1.Shimmer then
            local Frame = New("Frame")
            v1 = {
                Name = "Shimmer",
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0, -10, 0.5, 0),
                Size = UDim2.new(1, 20, 0.8, 0),
                ZIndex = 3,
                Parent = v2,
            }
            v1[Children] = {(New("UICorner")({Name = "UICorner"}))}
            a1.Shimmer = Frame(v1)
            a1.ShimmerGradient = New("UIGradient")({
                Name = "UIGradient",
                Rotation = 45,
                Offset = Vector2.new(-0.8, 0),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.302, 1),
                    NumberSequenceKeypoint.new(0.419, 0.5),
                    NumberSequenceKeypoint.new(0.502, 0.512),
                    NumberSequenceKeypoint.new(0.592, 0.5),
                    NumberSequenceKeypoint.new(0.7, 1),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
                Parent = a1.Shimmer,
            })
        end
        if not a1.Elapsed then
            a1.Elapsed = 0
        end
        if 2 < a1.Elapsed then
            a1.Elapsed = 0
            a1.ShimmerGradient.Offset = Vector2.new(0.8, 0)
            TweenService:Create(a1.ShimmerGradient, TweenInfo.new(1), {Offset = Vector2.new(-0.8, 0)}):Play()
        end
        a1.Elapsed = a1.Elapsed + math.min(a2, 0.016666666666666666)
    end,
}