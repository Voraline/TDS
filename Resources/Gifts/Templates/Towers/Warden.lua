-- Script path: ReplicatedStorage.Resources.Gifts.Templates.Towers.Warden
-- Decompile time: 0.36 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "warden",
    sender = "Map Reward",
    name = "Warden Tower",
    cover = 11401458801,
    icon = 11401184517,
    rewards = {{type = "tower", tower = "Warden"}},
    eligible = function(a1) -- Line: 17 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 18 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:UserOwnsGamePassAsync(a1.UserId, 99570026)
        end)
        return success and result
    end,
})