-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Particles.Effects.PVPTag
-- Decompile time: 1.08 ms

local Fusion = require(game:GetService("ReplicatedStorage").Resources.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
local v1 = {}
local Attachment = New("Attachment")
local v2 = {Name = "1"}
local v3 = {}
local Attachment_2 = New("Attachment")
local v4 = {Name = "2", CFrame = CFrame.new(0.10345459, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v4[Children] = {
    New("ParticleEmitter")({
        Name = "Lightning",
        Brightness = 2.1,
        LockedToPart = true,
        Rate = 2.1,
        Texture = "rbxassetid://97847087059912",
        ZOffset = -0.99,
        FlipbookFramerate = NumberRange.new(24),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        Lifetime = NumberRange.new(0.5),
        Size = NumberSequence.new(0.6),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new(-0.5),
    }),
}
local v5 = Attachment_2(v4)
v4 = New("ParticleEmitter")({
    Name = "Base",
    Brightness = 2.3,
    LockedToPart = true,
    Rate = 1.5,
    Texture = "rbxassetid://127497052538390",
    ZOffset = -0.98,
    FlipbookFramerate = NumberRange.new(24),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(0.4, 0.7),
    Size = NumberSequence.new(1),
    Speed = NumberRange.new(0),
    Squash = NumberSequence.new(-1.5),
})
local ParticleEmitter_3 = New("ParticleEmitter")
local v6 = {
    Name = "Base",
    Brightness = 2.1,
    LockedToPart = true,
    Rate = 2.1,
    Texture = "rbxassetid://71319542969553",
    ZOffset = -1,
    FlipbookFramerate = NumberRange.new(24),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(0.5),
    Size = NumberSequence.new(1),
    Speed = NumberRange.new(0),
    Squash = NumberSequence.new(-1.5),
}
v3[1] = v5
v3[2] = v4
v3[3] = ParticleEmitter_3(v6)
v2[Children] = v3
v1[1] = Attachment(v2)
return v1