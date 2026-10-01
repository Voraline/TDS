-- Script path: ReplicatedStorage.Resources.Skills
-- Decompile time: 14.23 ms

local v1, v2
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Resources.Universal.Enum)
local Icons = require(ReplicatedStorage.Client.Interfaces.NewInterface.Icons)
local math = require(ReplicatedStorage.Resources.Globals.math)

local function cost(a1, a2) -- Line: 29 -- types: a1: string, a2: number
    return {currency = a1, amount = a2}
end

local function costPerEV(a1, a2, a3) -- Line: 36 -- upvalues: math (val) -- types: a1: string, a2: number, a3: number
    return function(a1_2) -- Line: 37 -- upvalues: a2 (val), a3 (val), math (upval), a1 (val) -- types: a1_2: number
        local v1 = math.floor((a2 * a1_2) ^ a3)
        return {currency = a1, amount = math.roundToNearest(v1, 5)}
    end
end

local function playerCount() -- Line: 44 -- upvalues: ReplicatedStorage (val)
    return require(ReplicatedStorage.Resources.Universal.GameState).PlayerCount or 4
end

local function valuePerEV(a1, a2, a3) -- Line: 49 -- upvalues: math (val) -- types: a1: number, a2: number, a3: number?
    return function(a1_2) -- Line: 50 -- upvalues: math (upval), a1 (val), a2 (val), a3 (val) -- types: a1_2: number
        return math.round((a1 * a1_2) ^ a2, a3 or 3)
    end
end

local function valuePerLinear(a1, a2, a3) -- Line: 55
    -- upvalues: math (val)
    return function(a1_2) -- Line: 56 -- upvalues: math (upval), a1 (val), a2 (val), a3 (val) -- types: a1_2: number
        return math.round(a1 + a2 * a1_2, a3 or 3)
    end
end

local function formatter(a1) -- Line: 61 -- upvalues: Enum (val), math (val)
    if a1 == Enum.SkillTreeFormat.Percentage then
        return function(a1) -- Line: 63 -- upvalues: math (upval) -- types: a1: number
            return (("%*%%"):format((math.round(a1, 3))))
        end
    end
    if a1 == Enum.SkillTreeFormat.Number then
        return function(a1) -- Line: 67 -- upvalues: math (upval) -- types: a1: number
            return (("%*"):format((math.round(a1, 3))))
        end
    end
    if a1 == Enum.SkillTreeFormat.Integer then
        return function(a1) -- Line: 71 -- types: a1: number
            return (("%*"):format((math.floor(a1))))
        end
    end
    if a1 == Enum.SkillTreeFormat.Currency then
        return function(a1) -- Line: 75 -- upvalues: math (upval) -- types: a1: number
            return (("$%*"):format((math.round(a1, 2))))
        end
    end
    if a1 == Enum.SkillTreeFormat.Enemies then
        return function(a1) -- Line: 79 -- types: a1: number
            return (("%* Enemies"):format((math.floor(a1))))
        end
    end
    error("Invalid format type: " .. tostring(a1))
end

local function makeDescription(a1) -- Line: 87 -- types: a1: string
    return function(a1_2, a2) -- Line: 88 -- upvalues: a1 (val) -- types: a2: number
        if a2 == 0 then
            a2 = a2 + 1
        end
        return a1:gsub("X", (a1_2.displayText((a1_2.valuePerLevel(a2))):gsub("%%", "%%%%")))
    end
end

local v3 = {}
local v4 = {}
local EnhancedOptics = Enum.SkillTreeNode.EnhancedOptics
local v5 = {
    displayName = "Enhanced Optics",
    skillLevelCap = 20,
    playerLevelUnlocked = 1,
    icon = Icons.EnhancedOptics,
    category = Enum.SkillTreeCategory.Offense,
}
local u36 = "Tower range is increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u36 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u36:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

local u38 = 6
local u39 = 1.73
local u40 = "coins"

function v5.costPerLevel(a1) -- Line: 37 -- upvalues: u38 (val), u39 (val), math (val), u40 (val) -- types: a1: number
    return {
        currency = u40,
        amount = math.roundToNearest(math.floor((u38 * a1) ^ u39), 5),
    }
end

local u42 = 0.5
local u43 = 1
local u44 = nil

function v5.valuePerLevel(a1) -- Line: 50 -- upvalues: math (val), u42 (val), u43 (val), u44 (val) -- types: a1: number
    return math.round((u42 * a1) ^ u43, u44 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[EnhancedOptics] = v5
local ResellValue = Enum.SkillTreeNode.ResellValue
v5 = {
    displayName = "Resourcefulness",
    skillLevelCap = 25,
    playerLevelUnlocked = 1,
    icon = Icons.ResellValue,
    category = Enum.SkillTreeCategory.Economy,
}
local u56 = "Selling towers returns <b><font color=\"#fff344\">X</font></b> more money."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u56 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u56:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

local u58 = 4
local u59 = 1.75
local u60 = "coins"

function v5.costPerLevel(a1) -- Line: 37 -- upvalues: u58 (val), u59 (val), math (val), u60 (val) -- types: a1: number
    return {
        currency = u60,
        amount = math.roundToNearest(math.floor((u58 * a1) ^ u59), 5),
    }
end

local u62 = 1.2
local u63 = 1
local u64 = nil

function v5.valuePerLevel(a1) -- Line: 50 -- upvalues: math (val), u62 (val), u63 (val), u64 (val) -- types: a1: number
    return math.round((u62 * a1) ^ u63, u64 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[ResellValue] = v5
local Scholar = Enum.SkillTreeNode.Scholar
v5 = {
    displayName = "Scholar",
    skillLevelCap = 20,
    previousNodeLevel = 10,
    icon = Icons.Scholar,
    category = Enum.SkillTreeCategory.Strategy,
}
local u76 = "Logbook drop rate is increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u76 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u76:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.SkillAccelerator
local u80 = 5
local u81 = 1.83
local u82 = "coins"

function v5.costPerLevel(a1) -- Line: 37 -- upvalues: u80 (val), u81 (val), math (val), u82 (val) -- types: a1: number
    return {
        currency = u82,
        amount = math.roundToNearest(math.floor((u80 * a1) ^ u81), 5),
    }
end

local u84 = 1
local u85 = 1
local u86 = nil

function v5.valuePerLevel(a1) -- Line: 50 -- upvalues: math (val), u84 (val), u85 (val), u86 (val) -- types: a1: number
    return math.round((u84 * a1) ^ u85, u86 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Number)
v4[Scholar] = v5
local Fortify = Enum.SkillTreeNode.Fortify
v5 = {
    displayName = "Fortify",
    skillLevelCap = 40,
    playerLevelUnlocked = 1,
    icon = Icons.Fortify,
    category = Enum.SkillTreeCategory.Defense,
}
local u98 = "Increases the player’s health pool by <b><font color=\"#fff344\">X</font></b>. (In groups, the highest HP is used.)"

function v5.description(a1, a2) -- Line: 88 -- upvalues: u98 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u98:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

local u100 = 3
local u101 = 1.4
local u102 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u100 (val), u101 (val), math (val), u102 (val)
    return {
        currency = u102,
        amount = math.roundToNearest(math.floor((u100 * a1) ^ u101), 5),
    }
end

local u104 = 5
local u105 = 1
local u106 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u104 (val), u105 (val), u106 (val)
    return math.round((u104 * a1) ^ u105, u106 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Number)
v4[Fortify] = v5
local Overhealing = Enum.SkillTreeNode.Overhealing
v5 = {
    displayName = "Over-Heal",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.Overhealing,
    category = Enum.SkillTreeCategory.Defense,
}
local u118 = "Increases how much extra HP can be kept from over-healing by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u118 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u118:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.Fortify
local u122 = 5
local u123 = 1.7
local u124 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u122 (val), u123 (val), math (val), u124 (val)
    return {
        currency = u124,
        amount = math.roundToNearest(math.floor((u122 * a1) ^ u123), 5),
    }
end

local u126 = 8
local u127 = 1
local u128 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u126 (val), u127 (val), u128 (val)
    return math.round((u126 * a1) ^ u127, u128 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Number)
v4[Overhealing] = v5
local FightDirty = Enum.SkillTreeNode.FightDirty
v5 = {
    displayName = "Fight Dirty",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.FightDirty,
    category = Enum.SkillTreeCategory.Offense,
}
local u140 = "Debuff durations applied to enemies are increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u140 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u140:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.SplashDamage
local u144 = 5
local u145 = 1.77
local u146 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u144 (val), u145 (val), math (val), u146 (val)
    return {
        currency = u146,
        amount = math.roundToNearest(math.floor((u144 * a1) ^ u145), 5),
    }
end

local u148 = 1
local u149 = 1
local u150 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u148 (val), u149 (val), u150 (val)
    return math.round((u148 * a1) ^ u149, u150 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[FightDirty] = v5
local ExtremeConditioning = Enum.SkillTreeNode.ExtremeConditioning
v5 = {
    displayName = "Extreme Conditioning",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.ExtremeConditioning,
    category = Enum.SkillTreeCategory.Defense,
}
local u162 = "Reduces stun and debuff durations from enemies by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u162 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u162:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.Bandages
local u166 = 5
local u167 = 1.725
local u168 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u166 (val), u167 (val), math (val), u168 (val)
    return {
        currency = u168,
        amount = math.roundToNearest(math.floor((u166 * a1) ^ u167), 5),
    }
end

local u170 = 0.8
local u171 = 1
local u172 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u170 (val), u171 (val), u172 (val)
    return math.round((u170 * a1) ^ u171, u172 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[ExtremeConditioning] = v5
local Stonks = Enum.SkillTreeNode.Stonks
v5 = {
    displayName = "Stonks",
    skillLevelCap = 20,
    previousNodeLevel = 10,
    icon = Icons.Stonks,
    category = Enum.SkillTreeCategory.Economy,
}
local u184 = "Wave rewards are increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u184 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u184:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.BiggerBudget
local u188 = 7
local u189 = 1.78
local u190 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u188 (val), u189 (val), math (val), u190 (val)
    return {
        currency = u190,
        amount = math.roundToNearest(math.floor((u188 * a1) ^ u189), 5),
    }
end

local u192 = 0.5
local u193 = 1
local u194 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u192 (val), u193 (val), u194 (val)
    return math.round((u192 * a1) ^ u193, u194 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[Stonks] = v5
local ExpandedBarracks = Enum.SkillTreeNode.ExpandedBarracks
v5 = {
    displayName = "Expanded Barracks",
    skillLevelCap = 20,
    previousNodeLevel = 10,
    icon = Icons.ExpandedBarracks,
    category = Enum.SkillTreeCategory.Strategy,
}
local u206 = "Cooldown for spawning units is reduced by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u206 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u206:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.SkillAccelerator
local u210 = 6
local u211 = 1.86
local u212 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u210 (val), u211 (val), math (val), u212 (val)
    return {
        currency = u212,
        amount = math.roundToNearest(math.floor((u210 * a1) ^ u211), 5),
    }
end

local u214 = 0.75
local u215 = 1
local u216 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u214 (val), u215 (val), u216 (val)
    return math.round((u214 * a1) ^ u215, u216 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[ExpandedBarracks] = v5
local SplashDamage = Enum.SkillTreeNode.SplashDamage
v5 = {
    displayName = "Improved Gunpowder",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.SplashDamage,
    category = Enum.SkillTreeCategory.Offense,
}
local u228 = "AOE explosion radius is increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u228 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u228:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.EnhancedOptics
local u232 = 5
local u233 = 1.725
local u234 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u232 (val), u233 (val), math (val), u234 (val)
    return {
        currency = u234,
        amount = math.roundToNearest(math.floor((u232 * a1) ^ u233), 5),
    }
end

local u236 = 0.5
local u237 = 1
local u238 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u236 (val), u237 (val), u238 (val)
    return math.round((u236 * a1) ^ u237, u238 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[SplashDamage] = v5
local BeefedUpMinions = Enum.SkillTreeNode.BeefedUpMinions
v5 = {
    displayName = "Beefed Up Minions",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.BeefedUpMinions,
    category = Enum.SkillTreeCategory.Defense,
}
local u250 = "Health of summoned units is increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u250 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u250:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.ExtremeConditioning
local u254 = 6
local u255 = 1.68
local u256 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u254 (val), u255 (val), math (val), u256 (val)
    return {
        currency = u256,
        amount = math.roundToNearest(math.floor((u254 * a1) ^ u255), 5),
    }
end

local u258 = 0.6
local u259 = 1
local u260 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u258 (val), u259 (val), u260 (val)
    return math.round((u258 * a1) ^ u259, u260 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[BeefedUpMinions] = v5
local Precision = Enum.SkillTreeNode.Precision
v5 = {
    displayName = "Precision",
    skillLevelCap = 15,
    previousNodeLevel = 10,
    icon = Icons.Precision,
    category = Enum.SkillTreeCategory.Offense,
}
local u272 = "Every <b><font color=\"#fff344\">X</font></b> shots, towers deal a critical hit (1.25x damage). Cannot stack with other critical hit towers."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u272 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u272:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.FightDirty
local u276 = 7
local u277 = 2.035
local u278 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u276 (val), u277 (val), math (val), u278 (val)
    return {
        currency = u278,
        amount = math.roundToNearest(math.floor((u276 * a1) ^ u277), 5),
    }
end

local u280 = 30
local u281 = -1
local u282 = nil

function v5.valuePerLevel(a1) -- Line: 56
    -- upvalues: math (val), u280 (val), u281 (val), u282 (val)
    return math.round(u280 + u281 * a1, u282 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Enemies)
v4[Precision] = v5
local Scavenger = Enum.SkillTreeNode.Scavenger
v5 = {
    displayName = "Scavenger",
    skillLevelCap = 20,
    previousNodeLevel = 10,
    icon = Icons.Scavenger,
    category = Enum.SkillTreeCategory.Economy,
}
local u294 = "Every <b><font color=\"#fff344\">X</font></b> kills grants 1.5x rewards from enemies."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u294 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u294:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.Stonks
local u298 = 7
local u299 = 1.865
local u300 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u298 (val), u299 (val), math (val), u300 (val)
    return {
        currency = u300,
        amount = math.roundToNearest(math.floor((u298 * a1) ^ u299), 5),
    }
end

local u302 = 30
local u303 = -1
local u304 = nil

function v5.valuePerLevel(a1) -- Line: 56
    -- upvalues: math (val), u302 (val), u303 (val), u304 (val)
    return math.round(u302 + u303 * a1, u304 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Enemies)
v4[Scavenger] = v5
local SkillAccelerator = Enum.SkillTreeNode.SkillAccelerator
v5 = {
    displayName = "Accelerator",
    skillLevelCap = 25,
    playerLevelUnlocked = 1,
    icon = Icons.SkillAccelerator,
    category = Enum.SkillTreeCategory.Strategy,
}
local u316 = "Reduces cooldown of active abilities by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u316 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u316:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

local u318 = 4
local u319 = 1.77
local u320 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u318 (val), u319 (val), math (val), u320 (val)
    return {
        currency = u320,
        amount = math.roundToNearest(math.floor((u318 * a1) ^ u319), 5),
    }
end

local u322 = 0.5
local u323 = 1
local u324 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u322 (val), u323 (val), u324 (val)
    return math.round((u322 * a1) ^ u323, u324 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[SkillAccelerator] = v5
local Reenforcements = Enum.SkillTreeNode.Reenforcements
v5 = {
    displayName = "Re-enforcements",
    skillLevelCap = 10,
    previousNodeLevel = 10,
    icon = Icons.Reenforcements,
    category = Enum.SkillTreeCategory.Strategy,
}
local u336 = "Increases the tower placement limit by <b><font color=\"#fff344\">X</font></b>. (Scales with number of players.)"

function v5.description(a1, a2) -- Line: 88 -- upvalues: u336 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u336:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.ExpandedBarracks
local u340 = 100
local u341 = 1.5
local u342 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u340 (val), u341 (val), math (val), u342 (val)
    return {
        currency = u342,
        amount = math.roundToNearest(math.floor((u340 * a1) ^ u341), 5),
    }
end

function v5.valuePerLevel(a1) -- Line: 328 -- upvalues: ReplicatedStorage (val) -- types: a1: number
    local v1 = require(ReplicatedStorage.Resources.Universal.GameState).PlayerCount or 4
    local v2 = 1
    if workspace.Type.Value ~= "Lobby" then
        if v1 >= 3 then
            v2 = 0.5
        elseif v1 >= 2 then
            v2 = 0.8
        end
    end
    return (math.floor(a1 * v2))
end

v5.displayText = formatter(Enum.SkillTreeFormat.Number)
v4[Reenforcements] = v5
local BiggerBudget = Enum.SkillTreeNode.BiggerBudget
v5 = {
    displayName = "Bigger Budget",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.BiggerBudget,
    category = Enum.SkillTreeCategory.Economy,
}
local u355 = "Starting cash is increased by <b><font color=\"#fff344\">X</font></b>."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u355 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u355:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.ResellValue
local u359 = 4
local u360 = 1.82
local u361 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u359 (val), u360 (val), math (val), u361 (val)
    return {
        currency = u361,
        amount = math.roundToNearest(math.floor((u359 * a1) ^ u360), 5),
    }
end

local u363 = 1
local u364 = 1
local u365 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u363 (val), u364 (val), u365 (val)
    return math.round((u363 * a1) ^ u364, u365 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Percentage)
v4[BiggerBudget] = v5
local Bandages = Enum.SkillTreeNode.Bandages
v5 = {
    displayName = "Bandages",
    skillLevelCap = 25,
    previousNodeLevel = 10,
    icon = Icons.Bandages,
    category = Enum.SkillTreeCategory.Defense,
}
local u377 = "Regenerates <b><font color=\"#fff344\">X</font></b> health at the start of every wave."

function v5.description(a1, a2) -- Line: 88 -- upvalues: u377 (val) -- types: a2: number
    if a2 == 0 then
        a2 = a2 + 1
    end
    return u377:gsub("X", (a1.displayText((a1.valuePerLevel(a2))):gsub("%%", "%%%%")))
end

v5.previousNode = Enum.SkillTreeNode.Overhealing
local u381 = 5
local u382 = 1.7
local u383 = "coins"

function v5.costPerLevel(a1) -- Line: 37
    -- upvalues: u381 (val), u382 (val), math (val), u383 (val)
    return {
        currency = u383,
        amount = math.roundToNearest(math.floor((u381 * a1) ^ u382), 5),
    }
end

local u385 = 1
local u386 = 1
local u387 = nil

function v5.valuePerLevel(a1) -- Line: 50
    -- upvalues: math (val), u385 (val), u386 (val), u387 (val)
    return math.round((u385 * a1) ^ u386, u387 or 3)
end

v5.displayText = formatter(Enum.SkillTreeFormat.Integer)
v4[Bandages] = v5
for i, j in script.Versions:GetChildren() do
    v1 = j.Name:match("^SkillsV(%d+)$")
    if v1 then
        v2 = tonumber(v1)
        v3[v2] = (require(j))
    else
        warn("Invalid version name, please ensure it matches \"SkillsV<number>\"")
    end
end
return {level = 15, version = 1, nodes = v4, previousVersions = v3}