-- Script path: ReplicatedStorage.Content.Nametag.Exclusive.Classic
-- Decompile time: 0.13 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    Name = "Classic",
    Description = "Earned from the classic event.",
    Rarity = (require(ReplicatedStorage.Shared.Modules.Enum)).SkinRarity.Event,
}