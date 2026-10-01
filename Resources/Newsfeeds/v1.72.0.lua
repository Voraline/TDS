-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.72.0
-- Decompile time: 3.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🗡️ Silent But Deadly 🎯",
    ImageId = 106780289490146,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🗡️ Assassin Tower",
                        Points = {
                            "A new intermediate tower joins the roster! Send fatal stabs and whirlwind slashes towards enemies and throw knives! Get him in the shop for 800 coins!",
                            "Assassin is an early game tower that returns to the roots of the tower defense genre, capable of handling single-target threats and crowds with its various combo attacks!",
                            "At level 2, Assassin unlocks a whirlwind slash, dealing AOE damage to all enemies in range every third hit.",
                            "At max level, Assassin unlocks fan of knives, charging up a deadly attack to throw 3 projectiles in an arc that pierce multiple enemies.",
                            function(a1, a2) -- Line: 21 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 128714941591715,
                                    Text = "Assassin's Wirlwind Slash",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 29 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 88586516371510,
                                    Text = "Assassin's Fan of Knives",
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
                        HeaderName = "🎯 Archer Rework",
                        Points = {
                            "The Archer event tower is now sharper than ever! Enjoy a new fresh new look, bouncing arrows, and new animations!",
                            function(a1, a2) -- Line: 46 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 82649031563159,
                                    Text = "Archer's game pass will be on sale for 649  (Available for 1 week)",
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
                        HeaderName = "🎆 Pier Pressure",
                        Points = {
                            function(a1, a2) -- Line: 62 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 79881122630664,
                                    Text = "Defeat the newest map, inspired by the Chicago Pier -- Pier Pressure!",
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
                        HeaderName = "🔥 Coming Soon 🔥",
                        Points = {
                            "❤️ Medic Rework",
                            "⚔️ PVP Clans & Quests",
                            "...keep an eye on our socials for more info! 📢",
                            function(a1, a2) -- Line: 81 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 95517534898824,
                                    Text = "💥 Turret Refresh",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
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
                        SubjectName = "Improvements",
                        Points = {
                            "Multiple adjustments to enemy sends in Basic, Molten, and Fallen arenas!",
                            "Bug fixes regarding how elo is calculated in PVP.",
                            "Heavier penalties for leaving PVP matches.",
                            "Fixed some win trading issues in PVP matches",
                            "Fixed an issue with the Beach nametag",
                            "Expect more fundamental changes to PVP coming soon to improve\nthe experience!",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Assassin",
                        Points = {
                            "Lvl 0 Cost: 300",
                            "Lvl 1 Cost: 150",
                            "Lvl 2 Cost: 600",
                            "Lvl 3 Cost: 1500",
                            "Lvl 4 Cost: 4250",
                            "Lvl 0 Range: 5.5",
                            "Lvl 1 Range: 6.5",
                            "Lvl 4 Range: 7",
                            "Lvl 0 Cooldown: 0.75",
                            "Lvl 2 Cooldown: 0.6",
                            "Lvl 3 Cooldown: 0.5",
                            "Lvl 0 Damage: 2",
                            "Lvl 1 Damage: 3",
                            "Lvl 2 Damage: 8",
                            "Lvl 3 Damage: 18",
                            "Lvl 4 Damage: 30",
                            "Lvl 2 Whirlwind Slash Damage: 8",
                            "Lvl 2 Whirlwind Slash Range: 6",
                            "Lvl 3 Whirlwind Slash Damage: 18",
                            "Lvl 4 Whirlwind Slash Damage: 30",
                            "Lvl 4 Whirlwind Range: 7",
                            "Lvl 4 Fan Of Knives Damage: 25",
                            "Lvl 4 Fan Of Knives Range: 10",
                            "Lvl 4 Fan Of Knives Pierce: 3",
                            "Lvl 4 Fan Of Knives Damage Threshold: 150",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Assassin (PVP)",
                        Points = {
                            "Lvl 0 Cost: 300",
                            "Lvl 1 Cost: 150",
                            "Lvl 2 Cost: 600",
                            "Lvl 3 Cost: 1700",
                            "Lvl 4 Cost: 4750",
                            "Lvl 0 Range: 5.5",
                            "Lvl 1 Range: 6.5",
                            "Lvl 4 Range: 7",
                            "Lvl 3 Cooldown: 0.5",
                            "Lvl 0 Damage: 2",
                            "Lvl 1 Damage: 3",
                            "Lvl 2 Damage: 8",
                            "Lvl 3 Damage: 14",
                            "Lvl 4 Damage: 25",
                            "Lvl 2 Whirlwind Slash Damage: 6",
                            "Lvl 2 Whirlwind Slash Range: 6",
                            "Lvl 3 Whirlwind Slash Damage: 14",
                            "Lvl 4 Whirlwind Slash Damage: 25",
                            "Lvl 4 Whirlwind Range: 7",
                            "Lvl 4 Fan Of Knives Damage: 25",
                            "Lvl 4 Fan Of Knives Range: 10",
                            "Lvl 4 Fan Of Knives Pierce: 3",
                            "Lvl 4 Fan Of Knives Damage Threshold: 150",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Archer",
                        Points = {
                            "Limit: 15",
                            "Lvl 0 Cost: 400 > 600",
                            "Lvl 1 Cost: 50 > 100",
                            "Lvl 3 Cost: 800 > 1000",
                            "Lvl 5 Cost: 7000 > 7375",
                            "Lvl 0 Range: 18 > 16",
                            "Lvl 4 Burn Damage: 2 > 4",
                            "Lvl 5 Burn Damage: 4 > 8",
                            "Lvl 5 Burn Max Hits: 6 > 5",
                            "Lvl 4 Stun Time: 0.25 > 0.3",
                            "Lvl 5 Stun Time: 0.3 > 0.45",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Warden (PVP)",
                        Points = {
                            "Lvl 0 Cost: 800 > 1000",
                            "Lvl 0 Cooldown: 0.6 > 0.65",
                            "Lvl 1 Cooldown: 0.6 > 0.65",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Scout (PVP)",
                        Points = {
                            "Lvl 3 Cost: 1600 > 1800",
                            "Lvl 3 Range: 18 > 17",
                            "Lvl 4 Range: 18 > 17",
                            "Lvl 4 Damage: 16 > 14",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Mercenary Base (PVP)",
                        Points = {
                            "Lvl 1 Cost: 1000 > 1800",
                            "Lvl 0 Grenadier Damage: 35 > 28",
                            "Lvl 1 Grenadier Damage: 65 > 50",
                            "Lvl 2 Grenadier Damage: 100 > 80",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Ranger (PVP)",
                        Points = {
                            "Lvl 0 Cost: 3000 > 2000",
                            "Lvl 2 Cost: 3250 > 2400",
                            "Lvl 3 Cost: 10000 > 8500",
                            "Lvl 4 Cost: 20000 > 17000",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Brawler (PVP)",
                        Points = {
                            "Lvl 4 Cost: 6000 > 5200",
                            "Lvl 0 Cooldown: 1 > 0.9",
                            "Lvl 1 Cooldown: 0.75 > 0.6",
                            "Lvl 4 Reposition Damage: 50 > 80",
                            "Lvl 5 Reposition Damage: 100 > 150",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Necromancer (PVP)",
                        Points = {
                            "Lvl 0 Cost: 1100 > 1500",
                            "Lvl 1 Cost: 750 > 1000",
                            "Lvl 2 Cost: 1750 > 3500",
                            "Lvl 3 Cost: 7500 > 10000",
                            "Lvl 4 Cost: 30000 > 40000",
                            "Sword Skeleton Range: 8 > 6",
                            "Skeleton Knight Range: 8 > 6",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Pursuit (PVP)",
                        Points = {
                            "Lvl 0 Cost: 3000 > 2500",
                            "Lvl 1 Cost: 1200 > 750",
                            "Lvl 2 Cost: 1850 > 1500",
                            "Lvl 3 Cost: 5000 > 3500",
                            "Lvl 4A Cost: 16000 > 12500",
                            "Lvl 5A Cost: 42500 > 30000",
                            "Lvl 4B Cost: 10000 > 7500",
                            "Lvl 5B Cost: 28500 > 22500",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Mortar (PVP)",
                        Points = {
                            "Lvl 1 Cost: 400 > 300",
                            "Lvl 3 Cost: 3000 > 2500",
                            "Lvl 4 Cost: 10000 > 12500",
                            "Lvl 5 Cost: 20000 > 22500",
                            "Lvl 0 Cooldown: 3.75 > 4",
                            "Lvl 3 Cooldown: 3 > 3.25",
                            "Lvl 4 Cooldown: 3 > 3.25",
                            "Lvl 5 Cooldown: 3 > 3.25",
                            "Lvl 2 Damage: 28 > 25",
                            "Lvl 3 Damage: 60 > 50",
                            "Lvl 0 Explosion Range: 6 > 5.5",
                            "Lvl 1 Explosion Range: 6 > 5.5",
                            "Lvl 2 Explosion Range: 7.5 > 7",
                            "Lvl 3 Explosion Range: 8.5 > 8",
                            "Lvl 4 Explosion Range: 8.5 > 8",
                            "Lvl 5 Explosion Range: 9 > 8.5",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Accelerator (PVP)",
                        Points = {
                            "Lvl 0 Cost: 3000 > 4250",
                            "Lvl 2 Cost: 2125 > 2000",
                            "Lvl 3 Cost: 3250 > 4500",
                            "Lvl 4 Cost: 8250 > 12000",
                            "Lvl 5 Cost: 30000 > 28500",
                            "Lvl 2 Range: 20 > 18",
                            "Lvl 4 Range: 22.5 > 20",
                            "Lvl 5 Range: 25 > 23",
                            "Lvl 3 Cooldown: 0.2 > 0.15",
                            "Lvl 4 Cooldown: 0.15 > 0.1",
                            "Lvl 0 Damage: 10 > 12",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Cowboy (PVP)",
                        Points = {
                            "Lvl 4 Cost: 3825 > 3500",
                            "Lvl 5 Cost: 7500 > 7000",
                            "Lvl 0 Cooldown: 1.25 > 1",
                            "Lvl 1 Cooldown: 1 > 0.8",
                            "Lvl 2 Cooldown: 1 > 0.8",
                            "Lvl 3 Cooldown: 0.6 > 0.5",
                            "Lvl 4 Cooldown: 0.3 > 0.25",
                            "Lvl 5 Cooldown: 0.3 > 0.25",
                            "Lvl 0 Income: 45 > 50",
                            "Lvl 1 Income: 45 > 50",
                            "Lvl 2 Income: 55 > 60",
                            "Lvl 3 Income: 65 > 75",
                            "Lvl 4 Income: 125 > 175",
                            "Lvl 5 Income: 225 > 300",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Sniper (PVP)",
                        Points = {
                            "Lvl 2 Cost: 1500 > 800",
                            "Lvl 3 Cost: 2750 > 3250",
                            "Lvl 4 Cost: 5500 > 5000",
                            "Lvl 0 Range: 25 > 20",
                            "Lvl 1 Range: 25 > 20",
                            "Lvl 2 Range: 30 > 22.5",
                            "Lvl 3 Range: 30 > 25",
                            "Lvl 4 Range: 35 > 30",
                            "Lvl 0 Cooldown: 2.5 > 1.65",
                            "Lvl 1 Cooldown: 1.5 > 1.3",
                            "Lvl 2 Cooldown: 1.5 > 1.3",
                            "Lvl 3 Cooldown: 0.75 > 0.5",
                            "Lvl 4 Cooldown: 0.75 > 0.5",
                            "Lvl 0 Damage: 8 > 6",
                            "Lvl 2 Damage: 20 > 15",
                            "Lvl 3 Damage: 20 > 15",
                            "Lvl 5 Damage: 40 > 30",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Hunter (PVP)",
                        Points = {
                            "Lvl 0 Cost: 1750 > 1600",
                            "Lvl 1 Cost: 650 > 750",
                            "Lvl 2 Cost: 2000 > 1800",
                            "Lvl 3 Cost: 8000 > 6250",
                            "Lvl 4 Cost: 16500 > 12000",
                            "Lvl 0 Range: 20 > 18",
                            "Lvl 1 Range: 22.5 > 21",
                            "Lvl 2 Range: 25 > 21",
                            "Lvl 3 Range: 25 > 21",
                            "Lvl 4 Range: 30 > 24",
                            "Lvl 0 Cooldown: 2 > 1.7",
                            "Lvl 1 Cooldown: 1.5 > 1.2",
                            "Lvl 2 Cooldown: 1.5 > 1.2",
                            "Lvl 3 Cooldown: 1.5 > 1.2",
                            "Lvl 4 Cooldown: 1.5 > 1.2",
                            "Lvl 3 Damage: 100 > 85",
                            "Lvl 4 Damage: 225 > 165",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Militant (PVP)",
                        Points = {
                            "Lvl 0 Cost: 1600 > 1400",
                            "Lvl 1 Cost: 700 > 600",
                            "Lvl 2 Cost: 1000 > 2600",
                            "Lvl 3 Cost: 3500 > 5000",
                            "Lvl 0 Range: 16 > 15",
                            "Lvl 1 Range: 18 > 17",
                            "Lvl 2 Range: 18 > 17",
                            "Lvl 2 Cooldown: 0.15 > 0.1",
                            "Lvl 3 Damage: 4 > 6",
                            "Lvl 4 Damage: 10 > 12",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Crook Boss (PVP)",
                        Points = {
                            "Lvl 0 Cost: 700 > 800",
                            "Lvl 2 Cost: 1100 > 1000",
                            "Lvl 4 Cost: 15250 > 16000",
                            "Lvl 0 Cooldown: 0.9 > 1",
                            "Pistol Crook Range: 20 > 18",
                            "Pistol Crook Cooldown: 0.9 > 0.8",
                            "Pistol Crook Damage: 3 > 2",
                            "Tommy Crook Range: 17.5 > 20",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Consumables",
                        Points = {
                            "Protein Shake Cost: 250 > 1000",
                            "Energy Drink Cost: 550 > 1400",
                            "Energy Drink Cooldown: 60 > 50",
                        },
                    },
                },
            },
        },
    },
}