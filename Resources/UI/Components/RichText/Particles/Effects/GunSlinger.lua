-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Particles.Effects.GunSlinger
-- Decompile time: 1.48 ms

local New = require(game:GetService("ReplicatedStorage").Resources.UI.Fusion).New
return {
    New("ParticleEmitter")({
        Name = "Dirt",
        Acceleration = Vector3.new(0.5, -0.5, 0),
        Drag = 4,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 5,
        Texture = "rbxassetid://1084987899",
        ZOffset = -0.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(113, 98, 62)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(113, 98, 62))),
        }),
        Lifetime = NumberRange.new(1.5),
        Rotation = NumberRange.new(-180, 180),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.4, 0.25),
            (NumberSequenceKeypoint.new(1, 0.3, 0.3)),
        }),
        Speed = NumberRange.new(0),
        SpreadAngle = Vector2.new(10, 10),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.744),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    New("ParticleEmitter")({
        Name = "Smoke",
        Acceleration = Vector3.new(0.5, -0.5, 0),
        Drag = 4,
        LockedToPart = true,
        Rate = 5,
        Texture = "rbxassetid://1084987899",
        ZOffset = -0.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(24, 24, 24)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(24, 24, 24))),
        }),
        Lifetime = NumberRange.new(1.5),
        Rotation = NumberRange.new(-180, 180),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.4, 0.25),
            (NumberSequenceKeypoint.new(1, 0.3, 0.3)),
        }),
        Speed = NumberRange.new(0),
        SpreadAngle = Vector2.new(10, 10),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.744),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (New("ParticleEmitter")({
        Name = "Spread",
        Acceleration = Vector3.new(0, -15, 0),
        Drag = 6,
        LightEmission = 0.5,
        LockedToPart = true,
        Rate = 3,
        Texture = "rbxassetid://6794338720",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.524, Color3.fromRGB(255, 170, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 115, 0))),
        }),
        Lifetime = NumberRange.new(0.4, 0.75),
        Orientation = Enum.ParticleOrientation.VelocityParallel,
        RotSpeed = NumberRange.new(300),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), (NumberSequenceKeypoint.new(1, 0.1))}),
        Speed = NumberRange.new(6, 8),
        SpreadAngle = Vector2.new(60, 60),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.701, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}