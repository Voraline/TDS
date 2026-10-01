-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.33.0
-- Decompile time: 0.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "Easy Gamemode Refresh",
    ImageId = 135749242115238,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Cyber City Refresh",
                        Points = {
                            function(a1, a2) -- Line: 17 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 135749242115238,
                                    Text = "Completely new feel!",
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
                        SubjectName = "Upgrade UI Changes",
                        Points = {
                            "Changed mobile touch to use tap in world",
                            "Changed button activation event for proper mobile clicks",
                            "Optimized Tooltip component",
                            "Added Upgrade UI toggle upon clicking selected tower",
                            "Added setting to Always Show Options in Upgrades UI",
                            "Implemented console keybinds",
                            "Fixed Upgrades UI memory leaking on selecting certain towers",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Gamemode Changes",
                        Points = {
                            function(a1, a2) -- Line: 48 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 111655722531143,
                                    Text = "Some enemies got a refresh",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "Added ambience music to Easy and Intermediate",
                            "Molten Triumphs Coin rewards (450 -> 400)",
                            "Molten Triumphs EXP rewards (75 -> 90)",
                            "Intermediate Triumphs Coin rewards (450 -> 500)",
                            "Intermediate Triumphs EXP rewards (75 -> 120)",
                            "Fallen Triumphs Coin rewards (800 -> 1000)",
                            "Fallen Triumphs EXP rewards (125 -> 250)",
                            "Hardcore Triumphs EXP rewards (180 -> 400)",
                            "Pizza Party Triumphs Coin rewards (975 -> 900)",
                            "Pizza Party Triumphs EXP rewards (150 -> 175)",
                            "Paintballer Coin Price (150 -> 100)",
                            "Demoman Coin Price (250 -> 200)",
                            "Adjustments to Easy mode wave structure",
                            "Grave Digger gained new abilities!",
                            "Grave Digger Health (15000 -> 20000)",
                            "Speedy Boss returns to Easy mode",
                            "Speedy Boss Health (1800 -> 1300)",
                            "Speedy Boss comes to intermediate mode",
                            "Necromancer Easy Health (250 -> 300)",
                            "Speedy Easy Health (3 -> 4)",
                            "Breaker 2 Easy Health (15 -> 20)",
                            "Breaker 4 Easy Health (140 -> 160)",
                            "Hidden Easy Health (10 -> 15)",
                            "Slow Boss Easy Health (1600 -> 1750)",
                            "Normal Boss Easy Health (160 -> 180)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "New Patient Zero Skin",
                        Points = {
                            "Free gift with the new Patient Zero Plushie",
                            "Plushie goes on sale September 28th @ 12:00 PM ET",
                            function(a1, a2) -- Line: 91 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 76997295686336,
                                    Text = "🧟‍♂️ Accelerator Skin 🧟‍♂️",
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
                        Points = {
                            "Halloween in the works! 🎃",
                            "New Lobby??? 🤔",
                            "...keep an eye on our socials for more info! 📢",
                        },
                    },
                },
            },
        },
    },
}