-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.36.0
-- Decompile time: 1.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🎃 Halloween Countdown 🎃",
    ImageId = 107789968183999,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Countdown to Halloween 🎃",
                        Points = {
                            "Only 1 week left until Halloween!",
                            "Releases on October 23rd @ 3PM ET",
                            "New lobby coming out with the event",
                            "New battle pass with exclusive skins",
                            "Are you ready for the spookiest event of the year?",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Bug Fixes 🛠️",
                        Points = {
                            "Restocked gingerbread cookies (Lazy Couch)",
                            "Fixed Trapper cooldown bug",
                            "Adjusted Trapper's throw to scale with cooldown buffs",
                            "Patched Mercenary Airdrop when time-scale is set to 0",
                            "Fixed Frost Blaster animations",
                            "Fixed Toxic Gunner animations",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🔥 Next Week 🔥",
                        Points = {
                            "Halloween is coming next week 🎃",
                            "New lobby",
                            "New HUD in lobby",
                            function(a1, a2) -- Line: 47 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 124344140117784,
                                    Text = "New lobby 🔥",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 55 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 128571966721237,
                                    Text = "👀",
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
        {
            Name = "🔨 Game Changes:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Ranger",
                        Points = {
                            "Lvl 4 Damage (1125 -> 1050)",
                            "Lvl 4 Cost (27500 -> 30000)",
                            "Lvl 4 Splash Damage (200 -> 150)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Accelerator",
                        Points = {
                            "Lvl 0 Cost (4250 -> 5000)",
                            "Lvl 1 Cost (800 -> 1200)",
                            "Lvl 2 Cost (1350 -> 2250)",
                            "Lvl 4 Cost (10500 -> 9500)",
                            "Lvl 5 Cost (34000 -> 30000)",
                            "Lvl 0 Damage (10 -> 12)",
                            "Lvl 1 Damage (15 -> 20)",
                            "Lvl 2 Damage (15 -> 20)",
                            "Lvl 3 Damage (20 -> 30)",
                            "Lvl 5 Damage (45 -> 40)",
                            "Lvl 0 Max Ammo (180 -> 240)",
                            "Lvl 1 Max Ammo (180 -> 240)",
                            "Lvl 2 Max Ammo (300 -> 420)",
                            "Lvl 4 Max Ammo (1200 -> 1050)",
                            "Lvl 5 Max Ammo (3600 -> 4800)",
                            "Lvl 0 Charge Time (3 -> 2.5)",
                            "Lvl 1 Charge Time (3 -> 2.5)",
                            "Lvl 2 Charge Time (3 -> 2.5)",
                            "Lvl 3 Charge Time (3 -> 2.5)",
                            "Lvl 4 Charge Time (3 -> 1.5)",
                            "Lvl 5 Charge Time (2 -> 1.5)",
                            "Lvl 2 Range (17.5 -> 19)",
                            "Lvl 4 Range (17.5 -> 20.5)",
                            "Lvl 5 Range (20 -> 22)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Ace Pilot",
                        Points = {
                            "Lvl 1 Cost (225 -> 300)",
                            "Lvl 3 Cost (2200 -> 1500)",
                            "Lvl 4 Cost (4000 -> 3500)",
                            "Lvl 5 Cost (10000 -> 7500)",
                            "Lvl 0 Range (7.5 -> 7)",
                            "Lvl 1 Range (7.5 -> 7)",
                            "Lvl 2 Range (7.5 -> 7)",
                            "Lvl 4 Range (9 -> 8 )",
                            "Lvl 5 Range (10 -> 9)",
                            "Lvl 3 Damage (4 -> 3)",
                            "Lvl 4 Damage (7 -> 6)",
                            "Lvl 5 Damage (12 -> 10)",
                            "Lvl 3 Cooldown (0.12 -> 0.125)",
                            "Lvl 4 Cooldown (0.12 -> 0.125)",
                            "Lvl 5 Cooldown (0.09 -> 0.1)",
                            "Lvl 0 Bomb Radius (4 -> 2)",
                            "Lvl 3 Bomb Radius (4.5 -> 2.25)",
                            "Lvl 4 Bomb Radius (4.5 -> 2.25)",
                            "Lvl 5 Bomb Radius (4 -> 2)",
                            "Lvl 5 Bomb Damage (25 -> 35)",
                            "Lvl 5 Bomb Cooldown (0.8 -> 1.25)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Pyromancer",
                        Points = {
                            "Lvl 0 Cost (900 -> 850)",
                            "Lvl 1 Cost (400 -> 350)",
                            "Lvl 3 Cost (2200 -> 1500)",
                            "Lvl 5 Cost (8000 -> 9000)",
                            "Lvl 0 Max Hits (1 -> 3)",
                            "Lvl 1 Max Hits (2 -> 3)",
                            "Lvl 2 Max Hits (2 -> 5)",
                            "Lvl 3 Max Hits (3 -> 5)",
                            "Lvl 4 Max Hits (4 -> 5)",
                            "Lvl 5 Max Hits (5 -> 8 )",
                            "Lvl 4 Damage (2 -> 3)",
                            "Lvl 5 Damage (3-> 6)",
                            "Lvl 0 Fire Width (0.5 -> 1.25)",
                            "Lvl 1 Burn Tick Time (0.8 -> 0.75)",
                            "Lvl 2 Burn Tick Time (0.8 -> 0.75)",
                            "Lvl 2 Burn Damage (1 -> 2)",
                            "Lvl 3 Burn Damage (2 -> 3)",
                            "Lvl 3 Burn Duration (4-> 5)",
                            "Lvl 4 Burn Duration (5 -> 7.5)",
                            "Lvl 5 Burn Duration (8 -> 10)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Golden Pyromancer",
                        Points = {
                            "Lvl 3 Cost (1500 -> 1750)",
                            "Lvl 4 Cost (6000 -> 5750)",
                            "Lvl 5 Cost (10000 -> 9500)",
                            "Lvl 0 Max Hits (1 -> 4)",
                            "Lvl 1 Max Hits (2 -> 4)",
                            "Lvl 2 Max Hits (2 -> 6)",
                            "Lvl 3 Max Hits (3 -> 6)",
                            "Lvl 4 Max Hits (4 -> 6)",
                            "Lvl 5 Max Hits (5 -> 10)",
                            "Lvl 4 Damage (2 -> 3)",
                            "Lvl 5 Damage (3-> 6)",
                            "Lvl 0 Fire Width (0.5 -> 1.25)",
                            "Lvl 3 Burn Tick Time (0.75 -> 0.5)",
                            "Lvl 2 Burn Damage (1 -> 2)",
                            "Lvl 3 Burn Damage (2 -> 3)",
                            "Lvl 3 Burn Duration (4.5 -> 6)",
                        },
                    },
                },
            },
        },
    },
}