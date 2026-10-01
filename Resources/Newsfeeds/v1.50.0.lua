-- Script path: ReplicatedStorage.Resources.Newsfeeds.v1.50.0
-- Decompile time: 0.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageCaption = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ImageCaption)
return {
    UpdateName = "🍕 Mini Pizza Party Rework 🍕",
    ImageId = 78995519865059,
    Sections = {
        {
            Name = "📜 Update Log:",
            Content = {
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🍕 Pizza Party 🍕",
                        Points = {
                            "Changes to wave structure",
                            "Returning event enemies",
                            "Updated Pizza Party to new eco system",
                            function(a1, a2) -- Line: 20 -- upvalues: ImageCaption (val)
                                return ImageCaption({
                                    Image = 75630058605544,
                                    Text = "Wox is back with a new legion of haunted and tormented minions",
                                    Transparency = a2.Transparency,
                                    LayoutOrder = a1,
                                })
                            end,
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {HeaderName = "💥 New Skin 💥", Points = {"New Deluxe crate skin"}},
                },
                {
                    Type = "Items",
                    Props = {
                        Items = {{Type = "tower", Name = "Military Base", Skin = "Cyber", Details = "Cyber"}},
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        HeaderName = "🔥 Next Week 🔥",
                        Points = {"Badlands Mini-Rework", "...keep an eye on our socials for more info! 📢"},
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
                            "Legacy map modifiers ported to the new system, modifier rewards\nwill now display properly for legacy maps",
                            "Added molten corpse to sandbox mode",
                            "Fixed towers not being selectable if a challenge force changes your\nloadout in sandbox mode",
                            "Fixed “Data” very rarely showing up as a map in elevators",
                            "Fixed gamemodes not properly ending after successful completion in\nsandbox mode",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Mortar",
                        Points = {
                            "Level 3 Cost: 3500 -> 3250",
                            "Level 3 Damage: 50 -> 60",
                            "Level 4 Cost: 10000 -> 12000",
                            "Level 4 Cluster Count: 4 -> 3",
                            "Level 5 Cost: 22500 -> 25000",
                            "Level 5 Cluster Damage: 75 -> 50",
                        },
                    },
                },
                {
                    Type = "Log",
                    Props = {
                        SubjectName = "Necromancer",
                        Points = {
                            "Level 3 Damage: 20 -> 30",
                            "Level 3 Soul Meter: 320 -> 450",
                            "Level 4 Cost: 48000 -> 44000",
                            "Level 4 Damage Per Beam: 15 -> 20",
                        },
                    },
                },
            },
        },
    },
}