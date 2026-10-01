-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.SandCastle
-- Decompile time: 1.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Resources.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
return {
    DesiredType = "Word",
    Particle = "SandCastle",
    getColor = function(a1) -- Line: 11
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 143, 221))),
        })
    end,
    onCreate = function(self) -- Line: 18
        local adornee = self.adornee
        if not adornee then
            return
        end
        adornee["1"].Sand.Attachment0 = adornee["1"]
        adornee["1"].Sand.Attachment1 = adornee["2"]
        adornee["3"].Castle.Attachment0 = adornee["3"]
        adornee["3"].Castle.Attachment1 = adornee["4"]
    end,
    render = function(a1) -- Line: 30 -- upvalues: New (val), Children (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        local v2 = v1:FindFirstAncestorWhichIsA("SurfaceGui")
        if v2 then
            v2.ZIndexBehavior = Enum.ZIndexBehavior.Global
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        New("UIGradient")({
            Rotation = -88,
            Color = a1:getColor(),
            Offset = Vector2.new(-0.2, 0),
            Parent = v1,
        })
        local UIStroke = New("UIStroke")
        local v3 = {Name = "UIStroke", Thickness = 4, Color = Color3.fromRGB(136, 9, 199), Parent = v1}
        UIStroke(v3)
        if v2 then
            local Frame = New("Frame")
            v3 = {
                Name = "Frame",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                ClipsDescendants = true,
                Position = UDim2.new(0, -10, -0.1, 0),
                Size = UDim2.new(1, 20, 1.2, 0),
                Parent = v1,
            }
            local v4 = Children
            local v5 = {}
            local ImageLabel = New("ImageLabel")
            local v6 = {
                Name = "ImageLabel",
                Image = "rbxassetid://104464890093222",
                ResampleMode = Enum.ResamplerMode.Pixelated,
                ScaleType = Enum.ScaleType.Tile,
                TileSize = UDim2.fromOffset(50, 50),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                ZIndex = -1,
            }
            v6[Children] = {(New("UICorner")({Name = "UICorner"}))}
            v5[1] = ImageLabel(v6)
            v3[v4] = v5
            Frame(v3)
        end
        task.defer(function() -- Line: 97 -- upvalues: a1 (val)
            a1:onCreate()
        end)
        return true
    end,
    cleanUp = function(a1) -- Line: 104
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