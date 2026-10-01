-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.67.3
-- Decompile time: 0.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🛠️ Skill Tree Update",
    ImageId = 135749242115238,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "💻 Skill Tree Migration & Resetting",
                        Points = {
                            "Because prices for skills have been dramatically changed players will be given a refund based on the difference",
                            "Major reduction in skill prices across the board.",
                            "A new currency is introduced where you can reset your skill points to skill credits.",
                            "You can use this credit to purchase skill points back at the same price as the original cost.",
                            function(a1, a2) -- Line: 20 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 126444680593093,
                                    Text = "You can now use a prompt to reset yor skill points to skill credits!",
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
                            "☀️ Summer Battlepass",
                            "🥊 PVP Gamemode",
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
                            "Fixed the currency displayed for buying the hacker to be correct",
                            "Fixed enemies not dying to the hacker tower in Hardcore mode",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Skill Tree",
                        Points = {
                            "Total Unlock price (1,500,000+ Coins > 780,000+ Coins)",
                            "Reduced total levels of Fortify (50 > 40)",
                            "Max health at max Fortify (400 > 300)",
                            "Max additional health at max Over Heal (100 > 200)",
                            "Improved Gunpowder Max Explosion (20% > 12.5%)",
                            "Expanded Barracks Max Unit Cooldown (20% > 15%)",
                            "Beefed Up Minions Max Unit Health Increase (18.75% > 15%)",
                            "Precision Number of shots required for critical hit at Max Level (25 > 15)",
                        },
                    },
                },
            },
        },
    },
}