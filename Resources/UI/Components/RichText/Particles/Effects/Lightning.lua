-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Particles.Effects.Lightning
-- Decompile time: 0.98 ms

local New = require(game:GetService("ReplicatedStorage").Resources.UI.Fusion).New
return {
    New("ParticleEmitter")({
        Name = "PixelLightning",
        Acceleration = Vector3.new(0, 0.25, 0),
        Brightness = 5,
        LightEmission = 0.8,
        LightInfluence = 0.45,
        LockedToPart = true,
        Rate = 4,
        Texture = "rbxassetid://11864126449",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 127)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 127))),
        }),
        FlipbookFramerate = NumberRange.new(16),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        Lifetime = NumberRange.new(0.8),
        RotSpeed = NumberRange.new(0, 40),
        Rotation = NumberRange.new(-45, 0),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.6), (NumberSequenceKeypoint.new(1, 0.6))}),
        Speed = NumberRange.new(0.1),
        SpreadAngle = Vector2.new(30, 30),
    }),
    (New("ParticleEmitter")({
        Name = "Bits",
        Acceleration = Vector3.new(0, -1, 0),
        Drag = 10,
        LightEmission = 1,
        Rate = 2,
        Texture = "http://www.roblox.com/asset/?id=118322059",
        ZOffset = 0.4,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 127)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 127))),
        }),
        Lifetime = NumberRange.new(0.5, 2),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.05, 0.05),
            (NumberSequenceKeypoint.new(1, 0.05, 0.05)),
        }),
        Speed = NumberRange.new(0, 1),
        SpreadAngle = Vector2.new(20, 20),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.799, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}