-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.29.0
-- Decompile time: 1.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🎵 DJ Rework 🎵",
    ImageId = 138924286251630,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🎵 New DJ",
                        Points = {
                            "Lvl 0 Cost (600 -> 1200)",
                            "Lvl 2 Cost (850 -> 1250)",
                            "Lvl 3 Cost (2500 -> 3000)",
                            "Lvl 4 Cost (4000 -> 8000)",
                            "Lvl 5 Cost (9000 -> 20000)",
                            "Lvl 0 Range (15 -> 12)",
                            "Lvl 1 Range (17 -> 15)",
                            "Lvl 3 Range (18 -> 15)",
                            "Lvl 4 Range (18 -> 16.5)",
                            "Lvl 5 Range (20 -> 18.5)",
                            "Lvl 4 Damage (0 -> 25)",
                            "Lvl 5 Damage (0 -> 50)",
                            "DJ Boosts are determined by what track the player has active",
                            function(a1, a2) -- Line: 30 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 140300061576601,
                                    Text = "Red Track",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 38 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 128028657950615,
                                    Text = "Green Track",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 46 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 111757217983424,
                                    Text = "Purple Track",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "Lvl 0 Range Boost (10 -> 12.5)",
                            "Lvl 3 Range Boost (15 -> 17.5)",
                            "Lvl 4 Range Boost (25 -> 22.5)",
                            "Lvl 5 Range Boost (35 -> 25)",
                            "Lvl 0 Discount Boost (0 -> 5)",
                            "Lvl 2 Discount Boost (0 -> 7.5)",
                            "Lvl 4 Discount Boost (10 -> 12.5)",
                            "Lvl 5 Discount Boost (20 -> 15)",
                            "Lvl 2 Damage Boost (0 -> 10)",
                            "Lvl 3 Damage Boost (0 -> 12.5)",
                            "Lvl 4 Damage Boost (0 -> 15)",
                            "Lvl 5 Damage Boost (0 -> 20)",
                            "Gains an ability at level 3 that changes based on the selected track",
                            "Purple: Knockback and apply slowness to enemies in range",
                            "Scales with towers in range. Min: 20% / Max 40% Slowness",
                            "Green: Gain a cash payout based on the number of towers in range",
                            "Lvl 3 Max Cash payout : 600",
                            "Lvl 4 Max Cash payout : 1250",
                            "Lvl 5 Max Cash payout : 2250",
                            "Red: Apply defense melt and deal damage to enemies in range",
                            "Scales with towers in range. Min: 5% / Max 25% Defense melt",
                            "Skins got a refresh",
                            function(a1, a2) -- Line: 76 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 98990886827012,
                                    Text = "Plushie",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 84 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 98867395733462,
                                    Text = "Neon Rave",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 92 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 94196836925494,
                                    Text = "Masquerade",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 100 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 73517020025075,
                                    Text = "Ghost",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 108 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 133211921839440,
                                    Text = "Neko",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 116 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 81989149695459,
                                    Text = "Default",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "New Matchmaking UI",
                        Points = {
                            "You can matchmake by difficulty now",
                            "Activate it by pressing `Play Survival`",
                            function(a1, a2) -- Line: 134 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 123266652505045,
                                    Text = "Shows live player count per gamemode",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🔧 Game Improvements",
                        Points = {
                            "Fixed all tower's passive to ignore height",
                            "Fixed timescale to reset back to one when it detects there are over 1 player",
                            "Optimized ui rendering for lobby and shop",
                            "Optimized rendering for playerlist",
                            "Optimized culling for tower pets and nametags",
                            "Disabled statue collisions",
                            "Optimized tower-pets",
                            "2D rich-text doesn't update anymore",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🔥 Next Week 🔥",
                        Points = {
                            function(a1, a2) -- Line: 166 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 91017686313133,
                                    Text = "Mako DJ Skin 🎵",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "...keep an eye on our socials for more info! 📢",
                        },
                    },
                },
            },
        },
    },
}