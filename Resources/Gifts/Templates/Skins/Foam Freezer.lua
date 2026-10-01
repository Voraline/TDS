-- Script path: ReplicatedStorage.Resources.Gifts.Templates.Skins.Foam Freezer
-- Decompile time: 0.54 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "foam-freezer",
    sender = "Exclusive Gift",
    name = "Foam Freezer",
    cover = 11122113309,
    icon = 11122112129,
    rewards = {{type = "skin", tower = "Freezer", skin = "Foam"}},
    eligible = function(a1) -- Line: 18 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 19 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:PlayerOwnsAsset(a1, 8072333951)
        end)
        return success and result
    end,
})