-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Particles.Effects.Beach
-- Decompile time: 4.33 ms

local Fusion = require(game:GetService("ReplicatedStorage").Resources.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
local v1 = {}
local Attachment = New("Attachment")
local v2 = {
    Name = "WavesSlow0",
    CFrame = CFrame.new(-1.70074463, 0.0385780334, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
}
v2[Children] = {
    New("Beam")({
        Name = "Waves",
        Brightness = 1.5,
        FaceCamera = true,
        LightEmission = 0.2,
        Texture = "rbxassetid://75873826465064",
        TextureLength = 3.5,
        TextureSpeed = 0.6,
        Width0 = 1.5,
        Width1 = 1.5,
        ZOffset = -1.1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 38, 154)),
            ColorSequenceKeypoint.new(0.499, Color3.fromRGB(0, 58, 145)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 38, 154))),
        }),
        TextureMode = Enum.TextureMode.Static,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.506, 0),
            NumberSequenceKeypoint.new(0.947, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v3 = Attachment(v2)
v2 = New("Attachment")({
    Name = "WavesSlow1",
    CFrame = CFrame.new(1.74017334, 0.0385780334, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
})
local Attachment_3 = New("Attachment")
local v4 = {
    Name = "WavesFast0",
    CFrame = CFrame.new(-1.70074463, 0.340256214, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
}
v4[Children] = {
    New("Beam")({
        Name = "Waves",
        Brightness = 1.5,
        FaceCamera = true,
        LightEmission = 0.2,
        Texture = "rbxassetid://75873826465064",
        TextureLength = 3,
        Width0 = 1.25,
        Width1 = 1.25,
        ZOffset = -1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 112, 234)),
            ColorSequenceKeypoint.new(0.499, Color3.fromRGB(0, 140, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 112, 234))),
        }),
        TextureMode = Enum.TextureMode.Static,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.506, 0),
            NumberSequenceKeypoint.new(0.947, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v5 = Attachment_3(v4)
v4 = New("Attachment")({
    Name = "WavesFast1",
    CFrame = CFrame.new(1.74017334, 0.340256214, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
})
local Attachment_5 = New("Attachment")
local v6 = {Name = "Sand0", CFrame = CFrame.new(-1.5982666, -0.26558733, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1)}
v6[Children] = {
    New("Beam")({
        Name = "Sand",
        Brightness = 2,
        FaceCamera = true,
        Texture = "rbxassetid://116064072797305",
        TextureSpeed = 0,
        Width0 = 0.8,
        Width1 = 0.8,
        ZOffset = -0.8,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(234, 193, 166)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 193, 166))),
        }),
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
local v7 = Attachment_5(v6)
v6 = New("Attachment")({Name = "Sand1", CFrame = CFrame.new(1.63769531, -0.26558733, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1)})
local Attachment_7 = New("Attachment")
local v8 = {Name = "Dark0", CFrame = CFrame.new(1.74017334, -0.025595665, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v8[Children] = {
    New("Beam")({
        Name = "DarkPixels",
        Brightness = 1.5,
        FaceCamera = true,
        LightEmission = 0.8,
        Texture = "rbxassetid://140439908944576",
        TextureLength = 9,
        TextureSpeed = 0.1,
        ZOffset = -0.9,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 28, 52)),
            ColorSequenceKeypoint.new(0.482, Color3.fromRGB(162, 206, 234)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(7, 16, 39))),
        }),
        TextureMode = Enum.TextureMode.Static,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.506, 0),
            NumberSequenceKeypoint.new(0.947, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v9 = Attachment_7(v8)
v8 = New("Attachment")({Name = "Dark1", CFrame = CFrame.new(-1.70074463, -0.025595665, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local Attachment_9 = New("Attachment")
local v10 = {Name = "Sun", CFrame = CFrame.new(-1.05096436, 0.615302086, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v10[Children] = {
    New("ParticleEmitter")({
        Name = "ParticleEmitter",
        Brightness = 2,
        LightEmission = 0.3,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://82514940894525",
        ZOffset = 1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 246, 144)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 246, 144))),
        }),
        Lifetime = NumberRange.new(2),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.66), (NumberSequenceKeypoint.new(1, 0.66))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.496, 0.0575),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v11 = Attachment_9(v10)
v10 = New("ParticleEmitter")({
    Name = "Spark",
    Brightness = 2.5,
    Drag = 4,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 2,
    Texture = "rbxassetid://138328151143120",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(249, 158, 130)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(249, 158, 130))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(2, 3),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.499, 0.281, 0.0669),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(-360, 360),
})
local Attachment_10 = New("Attachment")
local v12 = {
    Name = "Center",
    WorldCFrame = CFrame.new(-575.692261, 7.10001421, 77.4998779, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v12[Children] = {
    New("ParticleEmitter")({
        Name = "Glow",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://16788448905",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 89, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 89, 255))),
        }),
        Lifetime = NumberRange.new(2),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.3), (NumberSequenceKeypoint.new(1, 1.3))}),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, -0.9), (NumberSequenceKeypoint.new(1, -0.9))}),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498, 0.881),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v1[1] = v3
v1[2] = v2
v1[3] = v5
v1[4] = v4
v1[5] = v7
v1[6] = v6
v1[7] = v9
v1[8] = v8
v1[9] = v11
v1[10] = v10
v1[11] = Attachment_10(v12)
return v1