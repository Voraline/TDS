-- Script path: ReplicatedStorage.Resources.Skills.Versions.SkillsV0
-- Decompile time: 3.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Resources.Universal.Enum)
local math = require(ReplicatedStorage.Resources.Globals.math)

local function costPerEV(a1, a2, a3) -- Line: 6 -- upvalues: math (val) -- types: a1: string, a2: number, a3: number
    return {
        currency = a1,
        calculate = function(a1) -- Line: 9 -- upvalues: a2 (val), a3 (val), math (upval) -- types: a1: number
            return (math.roundToNearest(math.floor((a2 * a1) ^ a3), 5))
        end,
    }
end

local v1 = {}
local EnhancedOptics = Enum.SkillTreeNode.EnhancedOptics
local v2 = {currency = "coins"}
local u20 = 9
local u21 = 1.78

function v2.calculate(a1) -- Line: 9 -- upvalues: u20 (val), u21 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u20 * a1) ^ u21), 5))
end

v1[EnhancedOptics] = v2
local ResellValue = Enum.SkillTreeNode.ResellValue
v2 = {currency = "coins"}
local u26 = 7
local u27 = 1.74

function v2.calculate(a1) -- Line: 9 -- upvalues: u26 (val), u27 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u26 * a1) ^ u27), 5))
end

v1[ResellValue] = v2
local Scholar = Enum.SkillTreeNode.Scholar
v2 = {currency = "coins"}
local u32 = 9
local u33 = 1.85

function v2.calculate(a1) -- Line: 9 -- upvalues: u32 (val), u33 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u32 * a1) ^ u33), 5))
end

v1[Scholar] = v2
local Fortify = Enum.SkillTreeNode.Fortify
v2 = {currency = "coins"}
local u38 = 5
local u39 = 1.425

function v2.calculate(a1) -- Line: 9 -- upvalues: u38 (val), u39 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u38 * a1) ^ u39), 5))
end

v1[Fortify] = v2
local Overhealing = Enum.SkillTreeNode.Overhealing
v2 = {currency = "coins"}
local u44 = 8
local u45 = 1.65

function v2.calculate(a1) -- Line: 9 -- upvalues: u44 (val), u45 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u44 * a1) ^ u45), 5))
end

v1[Overhealing] = v2
local FightDirty = Enum.SkillTreeNode.FightDirty
v2 = {currency = "coins"}
local u50 = 8
local u51 = 1.78

function v2.calculate(a1) -- Line: 9 -- upvalues: u50 (val), u51 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u50 * a1) ^ u51), 5))
end

v1[FightDirty] = v2
local ExtremeConditioning = Enum.SkillTreeNode.ExtremeConditioning
v2 = {currency = "coins"}
local u56 = 8
local u57 = 1.7

function v2.calculate(a1) -- Line: 9 -- upvalues: u56 (val), u57 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u56 * a1) ^ u57), 5))
end

v1[ExtremeConditioning] = v2
local Stonks = Enum.SkillTreeNode.Stonks
v2 = {currency = "coins"}
local u62 = 10
local u63 = 1.8

function v2.calculate(a1) -- Line: 9 -- upvalues: u62 (val), u63 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u62 * a1) ^ u63), 5))
end

v1[Stonks] = v2
local ExpandedBarracks = Enum.SkillTreeNode.ExpandedBarracks
v2 = {currency = "coins"}
local u68 = 9
local u69 = 1.85

function v2.calculate(a1) -- Line: 9 -- upvalues: u68 (val), u69 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u68 * a1) ^ u69), 5))
end

v1[ExpandedBarracks] = v2
local SplashDamage = Enum.SkillTreeNode.SplashDamage
v2 = {currency = "coins"}
local u74 = 7
local u75 = 1.78

function v2.calculate(a1) -- Line: 9 -- upvalues: u74 (val), u75 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u74 * a1) ^ u75), 5))
end

v1[SplashDamage] = v2
local BeefedUpMinions = Enum.SkillTreeNode.BeefedUpMinions
v2 = {currency = "coins"}
local u80 = 9
local u81 = 1.7

function v2.calculate(a1) -- Line: 9 -- upvalues: u80 (val), u81 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u80 * a1) ^ u81), 5))
end

v1[BeefedUpMinions] = v2
local Precision = Enum.SkillTreeNode.Precision
v2 = {currency = "coins"}
local u86 = 11
local u87 = 1.98

function v2.calculate(a1) -- Line: 9 -- upvalues: u86 (val), u87 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u86 * a1) ^ u87), 5))
end

v1[Precision] = v2
local Scavenger = Enum.SkillTreeNode.Scavenger
v2 = {currency = "coins"}
local u92 = 10
local u93 = 1.85

function v2.calculate(a1) -- Line: 9 -- upvalues: u92 (val), u93 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u92 * a1) ^ u93), 5))
end

v1[Scavenger] = v2
local SkillAccelerator = Enum.SkillTreeNode.SkillAccelerator
v2 = {currency = "coins"}
local u98 = 6
local u99 = 1.8

function v2.calculate(a1) -- Line: 9 -- upvalues: u98 (val), u99 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u98 * a1) ^ u99), 5))
end

v1[SkillAccelerator] = v2
local Reenforcements = Enum.SkillTreeNode.Reenforcements
v2 = {currency = "coins"}
local u104 = 100
local u105 = 1.5

function v2.calculate(a1) -- Line: 9 -- upvalues: u104 (val), u105 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u104 * a1) ^ u105), 5))
end

v1[Reenforcements] = v2
local BiggerBudget = Enum.SkillTreeNode.BiggerBudget
v2 = {currency = "coins"}
local u110 = 7
local u111 = 1.775

function v2.calculate(a1) -- Line: 9 -- upvalues: u110 (val), u111 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u110 * a1) ^ u111), 5))
end

v1[BiggerBudget] = v2
local Bandages = Enum.SkillTreeNode.Bandages
v2 = {currency = "coins"}
local u116 = 8
local u117 = 1.685

function v2.calculate(a1) -- Line: 9 -- upvalues: u116 (val), u117 (val), math (val) -- types: a1: number
    return (math.roundToNearest(math.floor((u116 * a1) ^ u117), 5))
end

v1[Bandages] = v2
return v1