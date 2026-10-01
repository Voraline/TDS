-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.47.0
-- Decompile time: 1.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
local VideoCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.VideoCaption)
return {
    UpdateName = "New Years",
    ImageId = 126634747453339,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🎆 New Years 2025 🎆",
                        Points = {
                            "As we wrap up 2024, we’re excited to celebrate the New Year with you! Join us on New Year’s Eve as we launch fireworks in the lobby every hour to welcome 2025.",
                            "The brand-new tower, Firework Technician, is here! The tower will be available on New Years Eve! Unlock it by completing the \"Happy New Years!\" Mission Quest",
                            "The Sledger has also been completely reworked—try it out now!",
                            "Added a community map, Retro Lighthouse, by @Ahcerz",
                            "Remastered Simplicity! You can still play the original version",
                            function(a1, a2) -- Line: 23 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 94558765586854,
                                    Text = "Firework Technician",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 31 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 116359178642825,
                                    Text = "",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 39 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 89732098484735,
                                    Text = "",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 47 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 130503512855121,
                                    Text = "",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            function(a1, a2) -- Line: 55 -- upvalues: VideoCaption (val)
                                return VideoCaption({
                                    Video = 110213766346659,
                                    Text = "Aftershock Passive deals a portion of the Sledger's base damage and applies Chill",
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
                        HeaderName = "Message from Paradoxum Games",
                        HeaderSubject = "Thank you for an incredible 2024! Your support means everything to us, and we’re thrilled to bring you even more exciting updates and surprises in 2025! ❤️",
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
                        SubjectName = "Small Changes",
                        Points = {
                            "Fixed Dark Frost Warden's torso disappearing",
                            "Fixed Dark Frost Engineer's weapon upgrade visuals and right arm",
                            "Fixed Dark Frost Mortar's custom projectiles and ducky placement",
                            "Fixed Frost Mortar's custom projectiles",
                            "Fixed emote credits",
                            "Fixed Jolly Tree hop pitch not adjusting",
                            "Freeze cooldown reduced from 2.5 to 1",
                            "Added new hit vfx to Rudolph Brawler",
                            "Fixed Ground Smash VFX",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Sledger",
                        Points = {
                            "Added a Frost Shockwave on level 5",
                            "Level 0 Cost: 800 -> 950",
                            "Level 1 Cost: 550 -> 400",
                            "Level 2 Cost: 2250 -> 1650",
                            "Level 3 Cost: 3750 -> 3200",
                            "Level 4 Cost: 7500 -> 8250",
                            "Level 5 Cost: 22500 -> 16000",
                            "Level 1 Damage: 15 -> 12",
                            "Level 2 Damage: 20 -> 25",
                            "Level 3 Damage: 40 -> 45",
                            "Level 4 Damage: 60  -> 75",
                            "Level 5 Damage: 115 -> 140",
                            "Level 0 Cooldown: 1.75 -> 1.2",
                            "Level 1 Cooldown: 1.75 -> 1.2",
                            "Level 2 Cooldown: 1.5 -> 1.2",
                            "Level 3 Cooldown: 1.5 -> 1.2",
                            "Level 4 Cooldown: 1.5 -> 1.2",
                            "Level 5 Cooldown: 1.35 -> 1.2",
                            "Level 4 Range: 7 -> 7.5",
                            "Level 0 Max Hits: 1  -> 2",
                            "Level 1 Max Hits: 2  -> 3",
                            "Level 2 Max Hits: 3  -> 4",
                            "Level 3 Max Hits: 3  -> 4",
                            "Level 5 Max Hits: 5  -> 6",
                            "Level 0 Slow Percent on Hit: 30%  -> 15%",
                            "Level 1 Slow Percent on Hit: 30%  -> 25%",
                            "Level 2 Slow Percent on Hit: 30%  -> 25%",
                            "Level 3 Slow Percent on Hit: 60%  -> 30%",
                            "Level 4 Slow Percent on Hit: 60%  -> 45%",
                            "Level 5 Slow Percent on Hit: 60%  -> 80%",
                            "Level 0 Max Slow Percentage: 80%  -> 45%",
                            "Level 1 Max Slow Percentage: 80%  -> 45%",
                            "Level 2 Max Slow Percentage: 80%  -> 45%",
                            "Level 3 Max Slow Percentage: 80%  -> 60%",
                            "Level 4 Max Slow Percentage: 80%  -> 65%",
                            "Level 5 Max Slow Percentage: 80%  -> 80%",
                            "Level 3 Freeze Time: 2 Seconds  -> 1.5 Seconds",
                            "Level 4 Freeze Time: 2 Seconds  -> 1.5 Seconds",
                            "Level 5 Freeze Time: 2.5 Seconds  -> 1.75 Seconds",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Elementalist",
                        Points = {
                            "Level 3 Damage: 12 -> 13",
                            "Level 4 Damage: 15 -> 18",
                            "Level 3 Ice Turret Range: 10 -> 12.5",
                            "Level 4 Ice Turret Range: 10 -> 15",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Molten Mode",
                        Points = {
                            "Tanker Buff",
                            "Molten Warlord Buff",
                            "Molten Titan",
                            "Molten Summoner",
                            "Molten Mech",
                            "Molten Hound Buff",
                            "Boomer Slight Nerf",
                            "Wave 5 Adjusted",
                            "Wave 9 Buff",
                            "Wave 16 Nerf",
                            "Wave 17 Buff",
                            "Wave 18 Buff",
                            "Wave 20 Slight Nerf",
                            "Wave 21 Slight Nerf",
                            "Wave 23 Buff",
                            "Wave 24 Adjusted",
                            "Wave 25 Buff",
                            "Wave 27 Buff",
                            "Wave 28 Buff",
                            "Wave 29 Buff",
                            "Wave 31 Buff",
                            "Wave 32 Buff",
                        },
                    },
                },
            },
        },
    },
}