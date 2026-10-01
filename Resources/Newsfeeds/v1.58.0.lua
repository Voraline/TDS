-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.58.0
-- Decompile time: 2.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "Titles & Achievements",
    ImageId = 80160895304928,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "NEW Achivement System!",
                        Points = {
                            "Achievements are earned through completing specific in-game challenges.",
                            "Each achievement you unlock adds to your profile, and many come with fantastic rewards like Coins, Crates, Spin Tickets, Time-scale Tickets, and even Gems.",
                            "Custom Titles: As you progress and earn achievements, you'll unlock exclusive custom titles in your inventory. These titles can be equipped to your profile to show off your accomplishments!",
                            "Equip your favorite title and wear it with pride to stand out from the crowd.",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Damage Achievements:",
                        Points = {
                            "First Contact: Deal 100,000 Damage",
                            "Decimator: Deal 1,000,000 Damage",
                            "Doom-bringer: Deal 10,000,000 Damage",
                            "Harbinger: Deal 100,000,000 Damage",
                            "Scorched Earth: Deal 1,000,000,000 Damage",
                            "Living Weapon: Deal 10,000,000,000 Damage",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Triumph Achievements:",
                        Points = {
                            "Recruit: Triumph in Easy mode",
                            "Average Joe: Triumph in Casual mode",
                            "Battle Hardened: Triumph in Intermediate mode",
                            "Warlord: Triumph in Molten mode",
                            "Usurper: Triumph in Fallen mode",
                            "Security Guard: Triumph in Pizza Party",
                            "Buckshot: Triumph in Badlands",
                            "Plague Doctor: Triumph in Polluted Wastelands 2",
                            "Cursed Soul: Triumph in Pizza Party (Solo)",
                            "Outlaw: Triumph in Badlands (Solo)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Logbook Achievements:",
                        Points = {
                            "Student: Collect 10 Logbooks",
                            "Undergrad: Collect 35 Logbooks",
                            "Scholar: Collect 75 Logbooks",
                            "Keeper of Knowledge: Collect 150 Logbooks",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Triumph Count Achievements:",
                        Points = {
                            "Officer: 50 Triumphs in any map or gamemode",
                            "Warhawk: 100 Triumphs in any map or gamemode",
                            "The Gambit: 250 Triumphs in any map or gamemode",
                            "Mastermind: 500 Triumphs in any map or gamemode",
                            "Commander in Chief: 1000 Triumphs in any map or gamemode",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Solo Match Achievements:",
                        Points = {
                            "Paladin: Complete a match of Molten on a Hard map (Solo)",
                            "Slayer: Complete a match of Molten on an Insane map (Solo)",
                            "Sentinel: Complete a match of Fallen on a Hard map (Solo)",
                            "Ascended: Complete a match of Fallen on an Insane map (Solo)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Tower Achievements:",
                        Points = {
                            "Fully Loaded: Collect 5 Towers",
                            "Arsenal: Collect 10 Towers",
                            "Weaponsmith: Collect 20 Towers",
                            "Master of Arms: Collect 30 Towers",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Tower Skins Achievements:",
                        Points = {
                            "Thrifty: Collect 5 Tower Skins",
                            "Stylist: Collect 10 Tower Skins",
                            "Hype Beast: Collect 20 Tower Skins",
                            "Collector: Collect 40 Tower Skins",
                            "The Vault: Collect 80 Tower Skins",
                            "One of a Kind: Collect 120 Tower Skins",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Mission Quest Achievements:",
                        Points = {
                            "Errand Boy: Complete 1 Mission Quest",
                            "Special Agent: Complete 3 Mission Quests",
                            "Black Ops: Complete 5 Mission Quests",
                            "Commander's Favorite: Complete 10 Mission Quests",
                            "Task Master: Complete 20 Mission Quests",
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "Some Titles", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {Type = "flair", Name = "Living Weapon"},
                            {Type = "flair", Name = "Cursed Soul"},
                            {Type = "flair", Name = "Outlaw"},
                            {Type = "flair", Name = "The Cure"},
                            {Type = "flair", Name = "Commander in Chief"},
                            {Type = "flair", Name = "tH3 GL1tcH"},
                            {Type = "flair", Name = "One of a kind"},
                            {Type = "flair", Name = "Task Master"},
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Soon 🔥",
                        Points = {
                            function(a1, a2) -- Line: 184 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 120455413169383,
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
                        SubjectName = "Improvements",
                        Points = {
                            "Fixed Maid Commander's bow being incorrectly welded",
                            "Fixed Lovestriker Brawler's max boots being visible on upgrade 0",
                            "Fixed Plushie Minigunner selection issue",
                            "Fixed Max Cookie Scout selection issue",
                            "Fixed Steampunk Rocketeer's hair z-fighting",
                            "Fixed Korblox Electroshocker being unavailable for a short period of time",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Golden Scout",
                        Points = {
                            "Lvl 0 Cost: 250 > 300",
                            "Lvl 1 Cost: 200 > 100",
                            "Lvl 2 Cost: 650 > 500",
                            "Lvl 0 Range: 12 > 14",
                            "Lvl 1 Range: 12 > 14",
                            "Lvl 2 Range: 14 > 16",
                            "Lvl 3 Range: 16.5 > 18",
                            "Lvl 4 Range: 16.5 > 18",
                            "Lvl 0 Cooldown: 1.2 > 1",
                            "Lvl 1 Cooldown: 1.2 > 1",
                            "Lvl 2 Cooldown: 1 > 0.75",
                            "Lvl 3 Cooldown: 0.8 > 0.6",
                            "Lvl 4 Cooldown: 0.4 > 0.3",
                            "Lvl 2 Damage: 8 > 6",
                            "Lvl 3 Damage: 15 > 12",
                            "Lvl 4 Damage: 20 > 16",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Scout",
                        Points = {
                            "Lvl 0 Cost: 200 > 150",
                            "Lvl 1 Cost: 25 > 50",
                            "Lvl 2 Cost: 250 > 200",
                            "Lvl 3 Cost: 750 > 950",
                            "Lvl 4 Cost: 2250 > 2500",
                            "Lvl 0 Cooldown: 1.2 > 1.1",
                            "Lvl 1 Cooldown: 1 > 0.8",
                            "Lvl 2 Cooldown: 1 > 0.8",
                            "Lvl 3 Cooldown: 0.6 > 0.7",
                            "Lvl 4 Cooldown: 0.3 > 0.35",
                            "Lvl 3 Damage: 4 > 6",
                            "Lvl 4 Damage: 5 > 8",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Toxic Gunner",
                        Points = {
                            "Lvl 0 Cost: 675 > 525",
                            "Lvl 2 Cost: 750 > 800",
                            "Lvl 4 Cost: 9250 > 1400",
                            "Lvl 0 Cooldown: 0.12 > 0.1",
                            "Lvl 3 Cooldown: 0.1 > 0.085",
                            "Lvl 4 Cooldown: 0.1 > 0.085",
                            "Lvl 0 Burst: 6 > 4",
                            "Lvl 2 Burst: 6 > 8",
                            "Lvl 3 Burst: 10 > 20",
                            "Lvl 0 Reload Speed: 10 > 12",
                            "Lvl 1 Reload Speed: 5 > 6",
                            "Lvl 0 Poison Length: 0 > 6",
                            "Lvl 1 Poison Length: 0 > 6",
                            "Lvl 0 Poison Damage: 0 > 1",
                            "Lvl 1 Poison Damage: 0 > 1",
                            "Lvl 2 Poison Damage: 2 > 4",
                            "Lvl 3 Poison Damage: 3 > 4",
                            "Lvl 4 Poison Damage: 5 > 10",
                            "Poison Tick Rate: 0.5s > 1s",
                            "Lvl 0 Defense Melt: 1 > 0",
                            "Lvl 1 Defense Melt: 1 > 0",
                            "Lvl 2 Defense Melt: 1 > 0",
                            "Lvl 3 Defense Melt: 1 > 3",
                            "Lvl 4 Defense Melt: 1 > 3",
                            "Lvl 2 Slowness on Hit: 10% > 20%",
                            "Lvl 3 Slowness on Hit: 10% > 20%",
                            "Lvl 4 Slowness on Hit: 10% > 30%",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Pursuit",
                        Points = {
                            "Lvl 3 Cost: 4750 > 5000",
                            "Lvl 4A Cost: 17500 > 16000",
                            "Lvl 4B Cost: 13500 > 10000",
                            "Lvl 5A Cost: 45000 > 42500",
                            "Lvl 5B Cost: 40000 > 28500",
                            "Lvl 4A Removed Hidden Detection",
                            "Lvl 4B Gained Hidden Detection",
                            "Lvl 4A Range: 10.5 > 11",
                            "Lvl 4B Range: 10.5 > 11",
                            "Lvl 5B Range: 10.5 > 12",
                            "Lvl 4B Explosion Damage: 45 > 25",
                            "Lvl 4B Explosion Radius: 5 > 6",
                            "Lvl 4B Missile Cooldown: 5 > 3",
                            "Lvl 5B Missile Cooldown: 3.5 > 3",
                            "Lvl 5A Damage: 28 > 26",
                            "Lvl 5B Damage: 20 > 12",
                            "Lvl 4B Reload Speed: 2.25 > 3.5",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Militant",
                        Points = {
                            "Lvl 1 Cost: 250 > 200",
                            "Lvl 2 Cost: 1250 > 900",
                            "Lvl 3 Cost: 3000 > 2750",
                            "Lvl 4 Cost: 7500 > 9000",
                            "Lvl 0 Cooldown: 0.25 > 0.2",
                            "Lvl 1 Cooldown: 0.25 > 0.18",
                            "Lvl 0 Range: 14 > 13",
                            "Lvl 1 Range: 17 > 16",
                            "Lvl 2 Range: 17 > 16",
                            "Lvl 3 Range: 19 > 18",
                            "Lvl 4 Damage: 8 > 12",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Ace Pilot",
                        Points = {
                            "Reverse Cooldown 10s > 8s",
                            "Lvl 0 Cost: 450 > 550",
                            "Lvl 1 Cost: 300 > 200",
                            "Lvl 3 Cost: 1500 > 1850",
                            "Lvl 4 Cost: 3500 > 3200",
                            "Lvl 5 Cost: 7500 > 8000",
                            "Lvl 0 Damage: 1 > 2",
                            "Lvl 1 Damage: 2 > 3",
                            "Lvl 3 Damage: 3 > 4",
                            "Lvl 4 Damage: 6 > 7",
                            "Lvl 5 Damage: 10 > 14",
                            "Lvl 0 Cooldown: 0.15 > 0.2",
                            "Lvl 1 Cooldown: 0.15 > 0.2",
                            "Lvl 2 Cooldown: 0.15 > 0.2",
                            "Lvl 3 Cooldown: 0.125 > 0.1",
                            "Lvl 4 Cooldown: 0.125 > 0.1",
                            "Lvl 0 Range: 7 > 7.5",
                            "Lvl 1 Range: 7 > 7.5",
                            "Lvl 2 Range: 7 > 7.5",
                            "Lvl 3 Range: 7.5 > 8",
                            "Lvl 4 Range: 8 > 8.5",
                            "Lvl 5 Range: 9 > 9.5",
                            "Lvl 2 Explosion Radius: 2 > 2.5",
                            "Lvl 3 Explosion Radius: 2.25 > 2.5",
                            "Lvl 4 Explosion Radius: 2.25 > 2.75",
                            "Lvl 5 Explosion Radius: 2 > 3",
                            "Lvl 4 Bomb Time: 1.75 > 2",
                            "Lvl 5 Bomb Time: 1.25 > 1.5",
                            "Lvl 3 Explosion Damage: 18 > 20",
                            "Lvl 4 Explosion Damage: 25 > 30",
                            "Lvl 5 Explosion Damage: 35 > 40",
                        },
                    },
                },
            },
        },
    },
}