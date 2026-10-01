-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.31.0
-- Decompile time: 1.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "💥 Skin Drop 💥",
    ImageId = 83513859685698,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "More skins!",
                        Points = {
                            function(a1, a2) -- Line: 17 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 100891975576935,
                                    Text = "Star Spartan - Militant\nEarn by completing the <u><b>For the Commander!</b></u> mission",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 25 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 95658666931242,
                                    Text = "Megalodon - Cowboy",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 33 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 113838647340601,
                                    Text = "Loader - Brawler",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 41 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 94884664380986,
                                    Text = "Stealth Ops - Soldier",
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
                        SubjectName = "🔥 Coming Soon 🔥",
                        Points = {"New tower 💥", "...keep an eye on our socials for more info! 📢"},
                    },
                },
            },
        },
        {
            Name = "🔨 Game Changes:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Golden Scout",
                        Points = {
                            "Lvl 0 Cost (200 -> 250)",
                            "Lvl 1 Cost (125 -> 200)",
                            "Lvl 2 Cost (500 -> 650)",
                            "Lvl 4 Cost (4000 -> 4500)",
                            "Lvl 0 Damage (2 -> 3)",
                            "Lvl 1 Damage (3 -> 4)",
                            "Lvl 2 Damage (4 -> 8)",
                            "Lvl 3 Damage (10 -> 15)",
                            "Lvl 4 Damage (15 -> 20)",
                            "Lvl 1 Range (14 -> 12)",
                            "Lvl 2 Range (16 -> 14)",
                            "Lvl 3 Range (16 -> 16.5)",
                            "Lvl 4 Range (18 -> 16.5)",
                            "Lvl 1 Cooldown (1.2 -> 1)",
                            "Lvl 3 Cooldown (0.75 -> 0.8)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Crook Boss",
                        Points = {
                            "Tower placement limit (6 -> 5)",
                            "Lvl 1 Cost (250 -> 300)",
                            "Lvl 2 Cost (750 -> 900)",
                            "Lvl 3 Cost (2850 -> 4250)",
                            "Lvl 4 Cost (11500 -> 20000)",
                            "Lvl 0 Damage (4 -> 3)",
                            "Lvl 2 Damage (4 -> 6)",
                            "Lvl 3 Damage (3 -> 6)",
                            "Lvl 4 Damage (6 -> 18)",
                            "Lvl 0 Range (10 -> 12.5)",
                            "Lvl 1 Range (12 -> 12.5)",
                            "Lvl 3 Range (14 -> 15)",
                            "Lvl 4 Range (16 -> 16.5)",
                            "Lvl 0 Cooldown (1.25 -> 0.9)",
                            "Lvl 1 Cooldown (1 -> 0.75)",
                            "Lvl 2 Cooldown (0.8 -> 0.75)",
                            "Lvl 3 Cooldown (0.15 -> 0.2)",
                            "Lvl 4 Cooldown (0.1 -> 0.12)",
                            "Lvl 0 Pistol Crook Spawn Time (35 -> 50)",
                            "Lvl 1, 2, 3, 4 Pistol Crook Spawn Time (25 -> 50)",
                            "Lvl 3 Tommy Crook Spawn Time (30 -> 50)",
                            "Lvl 4 Pistol Crook Spawn Time (20 -> 50)",
                            "Gains Flying Detection at Level 2",
                            "<u><b>Pistol Crook</b></u>",
                            "Health (10 -> 15)",
                            "Range (15 -> 20)",
                            "Cooldown (0.9 -> 1)",
                            "Damage (2 -> 3)",
                            "Gained Hidden and Flying Detection",
                            "Removed Aim Delay",
                            "<u><b>Tommy Crook Lvl 1</b></u>",
                            "Health (35 -> 100)",
                            "Cooldown (0.25 -> 0.2)",
                            "Damage (3 -> 4)",
                            "<u><b>Tommy Crook Lvl 2</b></u>",
                            "Health (50 -> 175)",
                            "Range (20 -> 18)",
                            "Cooldown (0.18 -> 0.12)",
                            "Damage (4 -> 10)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Golden Crook Boss",
                        Points = {
                            "Tower placement limit (6 -> 5)",
                            "Lvl 1 Cost (350 -> 500)",
                            "Lvl 2 Cost (1100 -> 1500)",
                            "Lvl 3 Cost (4750 -> 6000)",
                            "Lvl 4 Cost (17500 -> 30000)",
                            "Lvl 0 Damage (8 -> 4)",
                            "Lvl 1 Damage (8 -> 6)",
                            "Lvl 3 Damage (5 -> 10)",
                            "Lvl 4 Damage (11 -> 20)",
                            "Lvl 0 Cooldown (1.65 -> 0.9)",
                            "Lvl 1 Cooldown (1.35 -> 0.7)",
                            "Lvl 2 Cooldown (1.1 -> 0.7)",
                            "Lvl 3 Cooldown (0.12 -> 0.18)",
                            "Lvl 0 Range (12.5 -> 14)",
                            "Lvl 1 Range (12.5 -> 14)",
                            "Lvl 2 Range (14 -> 15)",
                            "Lvl 3 Range (15 -> 16)",
                            "Lvl 0 Pistol Crook Spawn Time (35 -> 50)",
                            "Lvl 1, 2, 3, 4 Pistol Crook Spawn Time (25 -> 50)",
                            "Lvl 3 Tommy Crook Spawn Time (25 -> 50)",
                            "Lvl 4 Pistol Crook Spawn Time (20 -> 50)",
                            "<u><b>Pistol Crook</b></u>",
                            "Health (15 -> 25)",
                            "Range (15 -> 20)",
                            "Cooldown (0.7 -> 0.6)",
                            "Damage (2 -> 3)",
                            "Gained Hidden and Flying Detection",
                            "Removed Aim Delay",
                            "<u><b>Tommy Crook Lvl 1</b></u>",
                            "Health (40 -> 125)",
                            "Cooldown (0.22 -> 0.18)",
                            "Damage (3 -> 5)",
                            "Range (17 -> 17.5)",
                            "<u><b>Tommy Crook Lvl 2</b></u>",
                            "Health (65 -> 225)",
                            "Cooldown (0.15 -> 0.1)",
                            "Damage (5 -> 12)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {SubjectName = "Consumable Rarity Changes", Points = {"Molotov -> Common"}},
                },
                {
                    Type = "Log",
                    Props = {SubjectName = "Consumable Uses Changes", Points = {"Supply Drop (4 -> 3)"}},
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Consumable Pregame Cooldown Changes",
                        Points = {"Barricade (20 -> 45)", "Supply Drop (60 -> 75)"},
                    },
                },
                {
                    Type = "Log",
                    Props = {SubjectName = "Consumable Cooldown Changes", Points = {"Supply Drop (75 -> 60)"}},
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Consumable Duration Changes",
                        Points = {"Damage Flag (60 -> 45)", "Cooldown Flag (60 -> 45)"},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Consumable Radius Changes",
                        Points = {"Damage Flag (20 -> 16)", "Cooldown Flag (20 -> 16)", "Range Flag (20 -> 16)"},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Individual Consumable Changes",
                        Points = {
                            "Supply Drop Cash (1250 -> 1000)",
                            "Damage Buff (40 -> 20)",
                            "Grenade Damage (100 -> 125)",
                            "Flashbang Radius (5 -> 6.5)",
                            "Flashbang Stun Time (4 -> 5)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Intermediate Gamemode Changes",
                        Points = {
                            "Slight increase to time between health regen healing",
                            "Adjustments to wave ECO",
                            "Adjusted waves to spam less enemies",
                            "Armored Health (70 -> 80)",
                            "Breaker2 Health (30 -> 40)",
                            "Breaker Health (15 -> 20)",
                            "Enraged Health (45 -> 65)",
                            "Failed Experiment Health (2000 -> 2500)",
                            "Failed Experiment Speed (3.5 -> 4)",
                            "Ghoul Health (180 -> 175)",
                            "Hidden Health (15 -> 20)",
                            "Patient Zero Health (70000 -> 80000)",
                            "Reaver removed Tank modifier",
                            "Reaver Health (70 -> 300)",
                            "Reaver Defense (0 -> 100)",
                            "Skeleton health (55 -> 30)",
                            "Slow health (18 -> 20)",
                        },
                    },
                },
            },
        },
    },
}