-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.57.0
-- Decompile time: 1.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "The Hunt: Mega Edition",
    ImageId = 80684444601566,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "The Deathwalker Returns...",
                        HeaderSubject = "The Hunt returns to T.D.S along with the Korblox empire. Group up with your friends to stand against this ancient undead empire!",
                        Points = {
                            "<b>The Hunt: Mega Edition</b> will go live on <u>March 13 @ 7:00PM ET</u>",
                            "<b>Director's Cut</b> (aka hard mode) will be live on <u>Friday, March 14th</u>",
                        },
                    },
                },
                {Type = "Log", Props = {HeaderName = "Coming To The Event", Points = {}}},
                {
                    Type = "Items",
                    Props = {
                        Items = {
                            {Type = "tower", Name = "Soldier", Skin = "Korblox", Details = "Korblox"},
                            {
                                Type = "tower",
                                Name = "Electroshocker",
                                Skin = "Korblox",
                                Details = "Korblox",
                            },
                            {Type = "tower", Name = "Warden", Skin = "Korblox", Details = "Korblox"},
                            {Type = "nametag", Name = "KorbloxHunter"},
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Spring Lobby 🌳",
                        Points = {
                            "New spring lobby theme",
                            "Like goal has been added to the lobby",
                            function(a1, a2) -- Line: 67 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 111468503494867,
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 74 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 85944174728286,
                                    Text = "At 1.7M likes we will be giving away the long awaited Lemonade Stand farm skin!",
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
                        HeaderName = "Game Improvements 🛠️",
                        Points = {
                            "Added a new settings category called \"Gameplay\"",
                            "Added a new setting called \"Low Quality Rings\"",
                            "Fixed tower stats stacking",
                            "Statues now utilize the matchmaking UI",
                            "Disabled the lobby tutorial",
                            "Updated game tutorial to give out demoman on win, alongside the cash",
                            "We're running an experiment for matchmaking, some players may not see the survival difficulty menu and will be forced to vote for difficulty in a match rather than using the matchmaking menu for difficulty, this is to compare match pair times",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Soon 🔥",
                        Points = {
                            function(a1, a2) -- Line: 105 -- upvalues: ImageCaption (val)
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
                        SubjectName = "Medic",
                        Points = {
                            "Lvl 0 Cost 900 -> 450",
                            "Lvl 1 Cost 400 -> 200",
                            "Lvl 2 Cost 900 -> 400",
                            "Lvl 3 Cost 2400 -> 800",
                            "Lvl 4 Cost 4500 -> 1750",
                            "Lvl 5 Cost 6500 -> 5000",
                            "Lvl 0 Range 10 -> 12",
                            "Lvl 1 Range 11 -> 13",
                            "Lvl 2 Range 12 -> 13",
                            "Lvl 3 Range 15 -> 16",
                            "Lvl 0 Damage 2 -> 3",
                            "Lvl 2 Damage 6 -> 5",
                            "Lvl 3 Damage 6 -> 8",
                            "Lvl 4 Damage 8 -> 12",
                            "Lvl 1 Cooldown 1 -> 0.75",
                            "Lvl 2 Cooldown 0.8 -> 0.75",
                            "Lvl 3 Cooldown 0.8 -> 0.65",
                            "Lvl 4 Cooldown 0.65 -> 0.5",
                            "Cleaning Cooldown 30 -> 20",
                            "Lvl 2 Healing 7 -> 10",
                            "Lvl 3 Healing 7 -> 10",
                            "Lvl 4 Healing 10 -> 25",
                            "Lvl 5 Healing 10 -> 100",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Brawler",
                        Points = {
                            "Lvl 1 Cost 350 -> 300",
                            "Lvl 3 Cost 2250 -> 2000",
                            "Lvl 4 Cost 6000 -> 5000",
                            "Lvl 5 Cost 17500 -> 12500",
                            "Lvl 0 Damage 10 -> 6",
                            "Lvl 1 Damage 10 -> 9",
                            "Lvl 2 Damage 15 -> 12",
                            "Lvl 3 Damage 30 -> 20",
                            "Lvl 4 Damage 50 -> 40",
                            "Lvl 5 Damage 100 -> 85",
                            "Lvl 0 Cooldown 1 -> 0.6",
                            "Lvl 1 Cooldown 0.75 -> 0.6",
                            "Reposition Level Unlock 4 -> 3",
                            "Lvl 2 Final Hit Damage 30 -> 24",
                            "Lvl 3 Final Hit Damage 60 -> 40",
                            "Lvl 4 Final Hit Damage 85 -> 80",
                            "Lvl 5 Final Hit Damage 200 -> 170",
                            "Lvl 3 Reposition Damage 0",
                            "Lvl 4 Reposition Damage 80 -> 100",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Minigunner",
                        Points = {
                            "Lvl 0 Cost 2000 -> 1850",
                            "Lvl 1 Cost 950 -> 400",
                            "Lvl 2 Cost 2250 -> 1500",
                            "Lvl 4 Cost 15000 -> 17500",
                            "Lvl 0 Range 13 -> 15",
                            "Lvl 1 Range 13 -> 15",
                            "Lvl 2 Range 14 -> 18",
                            "Lvl 3 Range 14 -> 18",
                            "Lvl 4 Range 15 -> 20",
                            "Lvl 0 Cooldown 0.14 -> 0.15",
                            "Lvl 1 Cooldown 0.14 -> 0.12",
                            "Lvl 2 Cooldown 0.14 -> 0.12",
                            "Lvl 3 Cooldown 0.12 -> 0.1",
                            "Lvl 1 Damage 3 -> 2",
                            "Lvl 2 Damage 5 -> 3",
                            "Lvl 3 Damage 10 -> 7",
                            "Lvl 0 Rev Time 1.5 -> 1.4",
                            "Lvl 1 Rev Time 1.25 -> 1.2",
                            "Lvl 3 Rev Time 0.75 -> 1",
                            "Lvl 4 Rev Time 0.75 -> 1",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Golden Minigunner",
                        Points = {
                            "Limit 15 -> 12",
                            "Lvl 1 Cost 800 -> 900",
                            "Lvl 2 Cost 2400 -> 2000",
                            "Lvl 3 Cost 7750 -> 8500",
                            "Lvl 4 Cost 24000 -> 30000",
                            "Lvl 0 Range 13 -> 15",
                            "Lvl 1 Range 13 -> 15",
                            "Lvl 2 Range 14 -> 18",
                            "Lvl 3 Range 16 -> 18",
                            "Lvl 4 Range 18 -> 20",
                            "Lvl 2 Damage 6 -> 5",
                            "Lvl 4 Damage 24 -> 28",
                            "Lvl 0 Rev Time 1.25 -> 1.4",
                            "Lvl 1 Rev Time 0.75 -> 1.2",
                            "Lvl 2 Rev Time 0.75 -> 1.2",
                            "Lvl 3 Rev Time 0.75 -> 1",
                            "Lvl 4 Rev Time 2.25 -> 1",
                        },
                    },
                },
            },
        },
    },
}