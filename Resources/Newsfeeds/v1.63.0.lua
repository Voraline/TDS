-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.63.0
-- Decompile time: 0.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🐝 Swarmer Rework",
    ImageId = 122995175333858,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🐝 Swarmer",
                        Points = {
                            "Swarmer has been reworked to bring out its boss killing/single-target potential.",
                            "Multiple swarmers can now stack bees on the same target allowing the player to stack multiple damage over-time sources on a single target.",
                            function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 104305842436949,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {SubjectName = "🗺️ Rework Map Added:", Points = {"Space City"}},
                },
            },
        },
        {
            Name = "🔨 Game Changes:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Swarmer",
                        Points = {
                            "Lvl 0 Cost: 300 > 450",
                            "Lvl 2 Cost: 350 > 500",
                            "Lvl 3 Cost: 500 > 1500",
                            "Lvl 4 Cost: 1400 > 3000",
                            "Lvl 5 Cost: 4000 > 6000",
                            "Lvl 0 Damage: 2 > 1",
                            "Lvl 1 Damage: 2 > 1",
                            "Lvl 2 Damage: 2 > 4",
                            "Lvl 3 Damage: 2 > 10",
                            "Lvl 4 Damage: 2 > 15",
                            "Lvl 5 Damage: 2 > 25",
                            "Lvl 0 Range: 12 > 13",
                            "Lvl 1 Range: 12 > 13",
                            "Lvl 2 Range: 16 > 15",
                            "Lvl 3 Range: 18 > 18",
                            "Lvl 4 Range: 18 > 20",
                            "Lvl 3 Cooldown: 1 > 1.25",
                            "Lvl 4 Cooldown: 1 > 1",
                            "Lvl 5 Cooldown: 0.5 > 0.75",
                            "Lvl 4 Bee Damage: 4 > 3",
                            "Lvl 5 Bee Damage: 6 > 4",
                            "Lvl 1 Bee Tick Rate: 0.75 > 1",
                            "Lvl 4 Bee Tick Rate: 0.5 > 0.75",
                            "Lvl 5 Bee Tick Rate: 0.25 > 0.5",
                            "Lvl 2 Bee Duration: 4 > 4.5",
                            "Lvl 3 Bee Duration: 4 > 5.25",
                            "Lvl 4 Bee Duration: 6 > 5.5",
                            "Lvl 3 Bee Grenade Splash Range: 8 > 6",
                            "Lvl 4 Bee Grenade Splash Range: 8 > 7",
                            "Lvl 4 Bee Grenade Damage: 10 > 30",
                            "Lvl 5 Bee Grenade  Damage: 10 > 50",
                        },
                    },
                },
            },
        },
    },
}