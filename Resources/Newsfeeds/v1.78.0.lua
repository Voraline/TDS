-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.78.0
-- Decompile time: 1.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "👻 NULL & VOID - NIGHT 2 🎃",
    ImageId = 83165824794200,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "👻 Null & Void Night 2 is LIVE! 👻",
                        HeaderSubject = "<font color=\"rgb(224,0,75)\">A dreadful night isn't it?..</font> Welcome to the Outer Nil Zone - where all the forgotten and discarded end up, including you! Revisit some forgotten faces and fight for your life against the Null Guardian! I wonder where we can be going next?..",
                        Points = {
                            "Defend against 25 waves or be erased from existence!",
                            function(a1, a2) -- Line: 19 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 83165824794200,
                                    Text = "Night 2 Hard and Easy are live!",
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
                        HeaderName = "🔥 Night 3 - Preview 🔥",
                        Points = {
                            function(a1, a2) -- Line: 36 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 136695255194910,
                                    Text = "October 30, 2025 @ 5:00 PM (ET)",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {Type = "EventButton", Props = {eventId = "1298481815492493931"}},
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "Harvester returns on sale!",
                        HeaderSubject = "The previous Halloween event tower will return as a gamepass until <b><font color=\"rgb(255,33,0)\">Nov. 5, 2025</font></b>.",
                        Points = {
                            "Slasher will be extended until <b><font color=\"rgb(255,33,0)\">Nov. 5, 2025</font></b>. ",
                        },
                    },
                },
                {
                    Type = "Items",
                    Props = {
                        Items = {{Type = "tower", Name = "Harvester", Skin = "Default", Details = "Harvester"}},
                    },
                },
                {Type = "GamepassButton", Props = {gamepassId = 953808062}},
                {
                    Type = "Items",
                    Props = {
                        Items = {{Type = "tower", Name = "Slasher", Skin = "Default", Details = "Slasher"}},
                    },
                },
                {Type = "GamepassButton", Props = {gamepassId = 7386135}},
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔨 Major Optimizations",
                        HeaderSubject = "After a lot of hard work, our team has been able to make major break throughs with optimization!.. <b>It was a lot harder than we thought..</b> Thanks Roblox for giving a really hard time! 😭",
                        Points = {},
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
                        SubjectName = "Fixed Skins:",
                        Points = {
                            "Updated Null Crook Boss",
                            "Updated Ghost Engineer",
                            "Updated Null Soldier",
                            "Updated Cursed Minigunner",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Mercenary Base",
                        Points = {
                            "<b>Lv. 3</b> Cost: <font color=\"rgb(255,100,100)\">6500</font> > <font color=\"rgb(100,255,100)\">7500</font>",
                            "<b>Lv. 5</b> Cost: <font color=\"rgb(255,100,100)\">12650</font> > <font color=\"rgb(100,255,100)\">13500</font>",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Rifleman",
                        Points = {
                            "<b>Lv. 3/4/5</b> Damage: <font color=\"rgb(255,100,100)\">12</font> > <font color=\"rgb(100,255,100)\">11</font>",
                            "<b>Lv. 6</b> Damage: <font color=\"rgb(255,100,100)\">30</font> > <font color=\"rgb(100,255,100)\">25</font>",
                            "<b>Lv. 6</b> Spawn Time: <font color=\"rgb(255,100,100)\">35s</font> > <font color=\"rgb(100,255,100)\">40s</font>",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Grenadier",
                        Points = {
                            "<b>Lv. 3/4/5</b> HP: <font color=\"rgb(255,100,100)\">125</font> > <font color=\"rgb(100,255,100)\">135</font>",
                            "<b>Lv. 6</b> HP: <font color=\"rgb(255,100,100)\">300</font> > <font color=\"rgb(100,255,100)\">325</font>",
                            "<b>Lv. 3/4/5</b> Damage: <font color=\"rgb(255,100,100)\">45</font> > <font color=\"rgb(100,255,100)\">40</font>",
                            "<b>Lv. 6</b> Damage: <font color=\"rgb(255,100,100)\">80</font> > <font color=\"rgb(100,255,100)\">75</font>",
                            "<b>Lv. 6</b> Range: <font color=\"rgb(255,100,100)\">22</font> > <font color=\"rgb(100,255,100)\">22.5</font>",
                            "<b>Lv. 3/4/5</b> Spawn Time: <font color=\"rgb(255,100,100)\">37.5s</font> > <font color=\"rgb(100,255,100)\">35s</font>",
                            "<b>Lv. 6</b> Spawn Time: <font color=\"rgb(255,100,100)\">40s</font> > <font color=\"rgb(100,255,100)\">35s</font>",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Field Medic",
                        Points = {
                            "<b>Lv. 6</b> HP: <font color=\"rgb(255,100,100)\">750</font> > <font color=\"rgb(100,255,100)\">700</font>",
                            "<b>Lv. 5</b> Max Targets: <font color=\"rgb(255,100,100)\">6</font> > <font color=\"rgb(100,255,100)\">8</font>",
                            "<b>Lv. 6</b> Max Targets: <font color=\"rgb(255,100,100)\">8</font> > <font color=\"rgb(100,255,100)\">10</font>",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Golden Scout",
                        Points = {
                            "<b>Placement Limit</b>: <font color=\"rgb(255,100,100)\">None</font> > <font color=\"rgb(100,255,100)\">16</font>",
                        },
                    },
                },
            },
        },
    },
}