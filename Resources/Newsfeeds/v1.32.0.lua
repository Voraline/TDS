-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.32.0
-- Decompile time: 1.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "💥 Gatling Gun 💥",
    ImageId = 71431493567123,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "New Tower - Gatling Gun",
                        Points = {
                            function(a1, a2) -- Line: 17 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 88063996626222,
                                    Text = "New tower in action",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "Tower Placement Limit of 1",
                            "Lvl 0 Damage (6)",
                            "Lvl 1 Damage (8)",
                            "Lvl 2 Damage (12)",
                            "Lvl 3 Damage (18)",
                            "Lvl 4 Damage (28)",
                            "Lvl 5 Damage (55)",
                            "Lvl 6 Damage (100)",
                            "Lvl 0 Cooldown (0.15)",
                            "Lvl 1 Cooldown (0.15)",
                            "Lvl 2 Cooldown (0.15)",
                            "Lvl 3 Cooldown (0.12)",
                            "Lvl 4 Cooldown (0.09)",
                            "Lvl 5 Cooldown (0.09)",
                            "Lvl 6 Cooldown (0.09)",
                            "Lvl 0 Range (25)",
                            "Lvl 1 Range (30)",
                            "Lvl 2 Range (30)",
                            "Lvl 3 Range (35)",
                            "Lvl 4 Range (45)",
                            "Lvl 5 Range (50)",
                            "Lvl 6 Range (50)",
                            "Lvl 0 Cost (5,000)",
                            "Lvl 1 Cost (3,000)",
                            "Lvl 2 Cost (8,250)",
                            "Lvl 3 Cost (17,500)",
                            "Lvl 4 Cost (35,000)",
                            "Lvl 5 Cost (60,000)",
                            "Lvl 6 Cost (100,000)",
                            "Active Ability: \"FPS\"",
                            function(a1, a2) -- Line: 55 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 86803638789408,
                                    Text = "Allows the user to take control of the Gatling Gun. Bullets gain Piercing",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "<u><b>Detections:</b></u>",
                            "Lvl 0 Flying Detection",
                            "Lvl 3 Hidden Detection",
                            "Lvl 0 Ammo (50)",
                            "Lvl 1 Ammo (50)",
                            "Lvl 2 Ammo (100)",
                            "Lvl 3 Ammo (200)",
                            "Lvl 4 Ammo (200)",
                            "Lvl 5 Ammo (400)",
                            "Lvl 6 Ammo (600)",
                            "Lvl 0 Reload Time (2.5 Seconds)",
                            "Lvl 1 Reload Time (2.5 Seconds)",
                            "Lvl 2 Reload Time (2 Seconds)",
                            "Lvl 3 Reload Time (2 Seconds)",
                            "Lvl 4 Reload Time (2 Seconds)",
                            "Lvl 5 Reload Time (6 Seconds)",
                            "Lvl 6 Reload Time (6 Seconds)",
                            function(a1, a2) -- Line: 80 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 123252855110919,
                                    Text = "Gatling Gun fires based on what enemies are in its cone of vision",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                            "Lvl 0 Cone View Angle (45)",
                            "Lvl 1 Cone View Angle (45)",
                            "Lvl 2 Cone View Angle (45)",
                            "Lvl 3 Cone View Angle (60)",
                            "Lvl 4 Cone View Angle (60)",
                            "Lvl 5 Cone View Angle (75)",
                            "Lvl 6 Cone View Angle (75)",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "New Upgrade UI",
                        Points = {
                            "We have refreshed the upgrade UI to perform better and look cleaner",
                            "Upgrades now feel instant and responsive",
                            "Tower Previews now show the current upgrade and animation",
                            "Upgrade text now scrolls and shows drop-downs for more information",
                            "Other functionality has been added for an upcoming tower... watch out 👀",
                            function(a1, a2) -- Line: 108 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 123008753558365,
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
                        SubjectName = "32",
                        Points = {"This is v1.32.0", "Therefore, 32", "You know what to do..."},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "🔥 Coming Soon 🔥",
                        Points = {
                            "Pursuit Rework 🚁",
                            "Halloween in the works! 🎃",
                            "...keep an eye on our socials for more info! 📢",
                        },
                    },
                },
            },
        },
    },
}