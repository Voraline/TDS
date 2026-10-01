-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.PVPIconBeams.Private
-- Decompile time: 1.13 ms

local Fusion = require(game:GetService("ReplicatedStorage").Resources.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
local v1 = {}
local Attachment = New("Attachment")
local v2 = {
    Name = "Attachment",
    CFrame = CFrame.new(1.56390381, -0.0753259659, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
local v3 = {}
local Attachment_2 = New("Attachment")
local v4 = {Name = "Attachment", CFrame = CFrame.new(-4.1, 0.0123000145, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v4[Children] = {
    New("ParticleEmitter")({
        Name = "RankUp",
        LightInfluence = 1,
        LockedToPart = true,
        Rate = 1,
        ZOffset = 0.1,
        Texture = "rbxassetid://124366459969448",
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        Lifetime = NumberRange.new(0.5),
        Speed = NumberRange.new(0),
    }),
}
local v5 = Attachment_2(v4)
local Attachment_3 = New("Attachment")
local v6 = {
    Name = "Beam",
    Axis = Vector3.new(-4.099999904632568, 0, 0),
    CFrame = CFrame.new(-4.1, 0.670518875, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(0, -1, 0),
    WorldAxis = Vector3.new(-1, 0, 0),
    WorldSecondaryAxis = Vector3.new(0, -1, 0),
}
v6[Children] = {
    New("Beam")({
        Name = "Beam",
        FaceCamera = true,
        LightInfluence = 1,
        Texture = "rbxassetid://118572289381269",
        TextureSpeed = 0,
        Width0 = 1.3,
        Width1 = 1.3,
        ZOffset = 0.01,
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
v4 = Attachment_3(v6)
local Attachment_4 = New("Attachment")
local v7 = {
    Name = "Up",
    Axis = Vector3.new(-1, 0, 0),
    SecondaryAxis = Vector3.new(0, -1, 0),
    WorldAxis = Vector3.new(-1, 0, 0),
    WorldSecondaryAxis = Vector3.new(0, -1, 0),
    CFrame = CFrame.new(-4.1, -0.657129288, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
}
v3[1] = v5
v3[2] = v4
v3[3] = Attachment_4(v7)
v2[Children] = v3
v1[1] = Attachment(v2)
return v1