-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.44.0
-- Decompile time: 1.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VideoCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.VideoCaption)
return {
    UpdateName = "Small Update",
    ImageId = 133521365788414,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Holiday Update",
                        Points = {
                            "At Paradoxum Games, we prioritize delivering quality updates to our community. In order to uphold that value, we've made the decision to push back the Molten launch by a week. While the game mode itself is complete, our development team agrees that the mode needs more time for balancing. Since this update touches a core mode in the current game's progression, we also need a little more time to adjust Intermediate and Fallen mode to fill for Old Molten's place. We hope you understand ❤️",
                            function(a1, a2) -- Line: 18 -- upvalues: VideoCaption (val)
                                return VideoCaption({
                                    Video = 94400754301355,
                                    Text = "Here's a look at the new Molten Warlord (model WIP)!",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "Operation I.C.E. coming <font color=\"#FFFF00\"><b>December 16th, 2024</b></font>! Are you ready?",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Coming Up 🔥",
                        Points = {
                            "Molten Rework",
                            "Admin Mode",
                            "Operation I.C.E. ❄️",
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
                    Props = {SubjectName = "Pursuit", Points = {"Lvl 5(A) Cost: (35,000 -> 45,000)"}},
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Gatling Gun",
                        Points = {
                            "Lvl 2 Cost: 8250 -> 7250",
                            "Lvl 6 Cost: 115000 -> 100000",
                            "Lvl 3 Cooldown: 0.13 -> 0.12",
                            "Lvl 3 Damage: 14 -> 15",
                            "Lvl 4 Damage: 20 -> 25",
                            "Lvl 5 Damage: 38 -> 45",
                            "Lvl 6 Damage: 65 -> 75",
                            "Lvl 0 Range Angle: 30 -> 40",
                            "Lvl 1 Range Angle: 30 -> 40",
                            "Lvl 2 Range Angle: 35 -> 45",
                            "Lvl 3 Range Angle: 40 -> 55",
                            "Lvl 4 Range Angle: 45 -> 55",
                            "Lvl 5 Range Angle: 50 -> 65",
                            "Lvl 6 Range Angle: 60 -> 70",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Trapper",
                        Points = {
                            "Lvl 0 Cost: 550 -> 500",
                            "Lvl 0 Spike Cooldown: 5.5 -> 5.25",
                            "Lvl 3 Spike Cooldown: 4 -> 7.5",
                            "Lvl 4 Spike Cooldown: 2 -> 6",
                            "Lvl 2 landmine Cooldown: 7 -> 5",
                            "Lvl 3 landmine Cooldown: 6 -> 4",
                            "Lvl 4 landmine Cooldown: 4.5 -> 2",
                            "Lvl 4 Bear Trap Cooldown: 7.5 -> 3.5",
                            "Lvl 2 Spike Health: 40 -> 60",
                            "Lvl 3 Spike Health: 75 -> 250",
                            "Lvl 4 Spike Health: 100 -> 450",
                            "Lvl 3 Spike Damage: 75 -> 25",
                            "Lvl 4 Spike Damage: 100 -> 40",
                            "Lvl 2 landmine Explosion Radius: 3 -> 5",
                            "Lvl 3 landmine Explosion Radius: 4 -> 5",
                            "Lvl 4 landmine Explosion Radius: 6 -> 7",
                            "Lvl 3 landmine Damage: 100 -> 80",
                            "Lvl 4 landmine Damage: 175 -> 140",
                            "Lvl 3 landmine Burn Damage: 0 -> 5",
                            "Lvl 3 landmine Burn Tick Rate: 0 -> 0.25",
                            "Lvl 3 landmine Burn Time: 0 -> 2",
                            "Lvl 4 landmine Burn Tick Rate: 0.5 -> 0.25",
                            "Lvl 4 landmine Burn Time: 8 -> 5",
                            "Lvl 4 Beartrap Damage: 400 -> 300",
                        },
                    },
                },
            },
        },
    },
}