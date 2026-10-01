-- Script path: ReplicatedStorage.Resources.Gifts.Templates.Towers.Cowboy
-- Decompile time: 0.37 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "cowboy",
    sender = "Map Reward",
    name = "Cowboy Tower",
    cover = 11116454415,
    icon = 11122577300,
    rewards = {{type = "tower", tower = "Cowboy"}},
    eligible = function(a1) -- Line: 17 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 18 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:UserOwnsGamePassAsync(a1.UserId, 90119024)
        end)
        return success and result
    end,
})