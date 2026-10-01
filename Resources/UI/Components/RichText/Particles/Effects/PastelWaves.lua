-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Particles.Effects.PastelWaves
-- Decompile time: 2.77 ms

local Fusion = require(game:GetService("ReplicatedStorage").Resources.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
local v1 = {}
local Attachment = New("Attachment")
local v2 = {
    Name = "Waves0",
    Axis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(2.00097656, -0.43250227, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(0, -1, 0),
}
v2[Children] = {
    New("Beam")({
        Name = "Beam",
        Segments = 25,
        Texture = "rbxassetid://17103466366",
        TextureLength = 0.5,
        TextureSpeed = 0.2,
        Width0 = 1.5,
        Width1 = 1.5,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(169, 215, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(169, 215, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0996, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v3 = Attachment(v2)
v2 = New("Attachment")({
    Name = "Waves1",
    Axis = Vector3.new(-1, 0, 0),
    SecondaryAxis = Vector3.new(0, -1, 0),
    CFrame = CFrame.new(-2.00061035, -0.43250227, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
})
local Attachment_3 = New("Attachment")
local v4 = {
    Name = "Waves2",
    Axis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(2.00097656, -0.410000324, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(0, -1, 0),
}
v4[Children] = {
    New("Beam")({
        Name = "Beam",
        Segments = 25,
        Texture = "rbxassetid://17103466366",
        TextureLength = 0.32,
        TextureSpeed = -0.112,
        Width0 = 1.5,
        Width1 = 1.5,
        ZOffset = -0.6,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(198, 176, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(198, 176, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0996, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v5 = Attachment_3(v4)
v4 = New("Attachment")({
    Name = "Waves3",
    Axis = Vector3.new(-1, 0, 0),
    SecondaryAxis = Vector3.new(0, -1, 0),
    CFrame = CFrame.new(-2.00061035, -0.410000324, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
})
local Attachment_5 = New("Attachment")
local v6 = {
    Name = "Waves4",
    Axis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(2.00097656, -0.208989143, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(0, -1, 0),
}
v6[Children] = {
    New("Beam")({
        Name = "Beam",
        Segments = 25,
        Texture = "rbxassetid://17103466366",
        TextureLength = 0.4,
        TextureSpeed = 0.125,
        Width0 = 1.6,
        Width1 = 1.6,
        ZOffset = -0.7,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 156, 199)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 156, 199))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0996, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v7 = Attachment_5(v6)
v6 = New("Attachment")({
    Name = "Waves5",
    Axis = Vector3.new(-1, 0, 0),
    SecondaryAxis = Vector3.new(0, -1, 0),
    CFrame = CFrame.new(-2.00061035, -0.208989143, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
})
local Attachment_7 = New("Attachment")
local v8 = {
    Name = "Waves6",
    Axis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(2.00097656, -0.14093399, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(0, -1, 0),
}
v8[Children] = {
    New("Beam")({
        Name = "Beam",
        Segments = 25,
        Texture = "rbxassetid://17103466366",
        TextureLength = 0.64,
        TextureSpeed = 0.125,
        Width0 = 1.5,
        Width1 = 1.5,
        ZOffset = -0.8,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(158, 164, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(158, 164, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0996, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v9 = Attachment_7(v8)
local Attachment_8 = New("Attachment")
local v10 = {
    Name = "Waves7",
    Axis = Vector3.new(-1, 0, 0),
    SecondaryAxis = Vector3.new(0, -1, 0),
    CFrame = CFrame.new(-2.00061035, -0.14093399, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
}
v1[1] = v3
v1[2] = v2
v1[3] = v5
v1[4] = v4
v1[5] = v7
v1[6] = v6
v1[7] = v9
v1[8] = Attachment_8(v10)
return v1