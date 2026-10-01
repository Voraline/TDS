-- Script path: ReplicatedStorage.Resources.Universal.SkillsUtil
-- Decompile time: 4.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local CharmUtil = require(ReplicatedStorage.Resources.Universal.CharmUtil)
local Enum = require(ReplicatedStorage.Resources.Universal.Enum)
local SharedAtoms = require(ReplicatedStorage.Resources.Universal.SharedAtoms)
local Skills = require(ReplicatedStorage.Resources.Skills)
local skills = SharedAtoms.skills
local u31 = Charm.atom({})

local function getPlayerSkill(a1, a2) -- Line: 19
    -- upvalues: skills (val), Skills (val), Enum (val)
    local v1 = (skills())[tostring(a1.UserId)] or {}
    local v2 = Skills.nodes[a2]
    local v3 = math.max(0, v1[(Enum.SkillTreeNode.ToString(a2))] or 0)
    if v2.skillLevelCap then
        v3 = math.min(v3, v2.skillLevelCap)
    end
    return v3
end

local function getAveragePlayerSkill(a1) -- Line: 33 -- upvalues: Skills (val), skills (val), Enum (val)
    local v1
    local v2 = 0
    local v3 = 0
    local v4 = Skills.nodes[a1]
    for i, j in skills() do
        v1 = j[Enum.SkillTreeNode.ToString(a1)]
        if v1 then
            if v4.skillLevelCap then
                v1 = math.min(v1, v4.skillLevelCap)
            end
            v2 = v2 + v1
            v3 = v3 + 1
        end
    end
    local v5 = math.max(0, (math.round(v3 > 0 and v2 / v3 or 0)))
    if v4.skillLevelCap then
        v5 = math.min(v5, v4.skillLevelCap)
    end
    return v5
end

local function getTotalCost(a1, a2) -- Line: 88 -- upvalues: Skills (val) -- types: a2: number
    local v1
    local v2 = Skills.nodes[a1]
    local v3 = 0
    local currency = nil
    if not v2 then
        return currency, 0
    end
    if v2.skillLevelCap then
        a2 = math.min(a2, v2.skillLevelCap)
    end
    for i = 1, a2 do
        v1 = v2.costPerLevel(i)
        currency = v1.currency
        v3 = v3 + math.floor(v1.amount)
    end
    return currency, v3
end

local function evaluateSkill(a1, a2) -- Line: 141 -- upvalues: Skills (val) -- types: a2: number
    local v1 = Skills.nodes[a1]
    if not v1 then
        return 0
    end
    if v1.skillLevelCap then
        a2 = math.min(a2, v1.skillLevelCap)
    end
    return v1.valuePerLevel((math.max(0, a2)))
end

return {
    skill = getPlayerSkill,
    avgSkill = getAveragePlayerSkill,
    skillEval = function(a1, a2) -- Line: 155 -- upvalues: getPlayerSkill (val), evaluateSkill (val) -- types: a1: userdata
        return evaluateSkill(a2, (getPlayerSkill(a1, a2)))
    end,
    avgSkillEval = function(a1) -- Line: 160 -- upvalues: getAveragePlayerSkill (val), evaluateSkill (val)
        return evaluateSkill(a1, (getAveragePlayerSkill(a1)))
    end,
    evaluate = evaluateSkill,
    getSkillState = function(a1, a2) -- Line: 165 -- upvalues: u31 (val) -- types: a1: userdata
        local v1 = (u31())[tostring(a1.UserId)]
        if not v1 then
            return nil
        end
        return v1[tostring(a2)]
    end,
    setSkillState = function(a1, a2, a3) -- Line: 174 -- upvalues: u31 (val), CharmUtil (val) -- types: a1: userdata
        local u5 = tostring(a1.UserId)
        local u8 = tostring(a2)
        u31(function(a1) -- Line: 178 -- upvalues: u5 (val), CharmUtil (upval), u8 (val), a3 (val)
            if not a1[u5] then
                a1[u5] = {}
            end
            return CharmUtil.set(a1, u5, CharmUtil.set(a1[u5], u8, a3))
        end)
    end,
    resetSkillStates = function() -- Line: 187 -- upvalues: u31 (val)
        u31({})
    end,
    getVersionedTotalCost = function(a1, a2, a3) -- Line: 61 -- upvalues: Skills (val) -- types: a2: number, a3: number
        local v1 = Skills.previousVersions[a2]
        local v2 = v1 and v1[a1]
        local v3 = Skills.nodes[a1]
        if v2 and v3 then
            local v4 = 0
            for i = 1, if not v3.skillLevelCap then a3 else math.min(a3, v3.skillLevelCap) do
                v4 = v4 + v2.calculate(i, a2)
            end
            return v2.currency, v4
        end
        return nil, 0
    end,
    getRefundUpfrontCost = function(a1) -- Line: 137 -- types: a1: number
        return (math.min(5000, a1 * 200 + 200))
    end,
    getRefund = function(a1) -- Line: 121 -- upvalues: Enum (val), getTotalCost (val) -- types: a1: table
        local v1, v2, v3, v4
        local v5 = 0
        local v6 = nil
        local v7 = nil
        for i, j in a1, v6, v7 do
            v2 = Enum.SkillTreeNode[i]
            if v2 and not (j < 1) then
                v4, v1 = getTotalCost(v2, j)
                if v4 ~= "coins" then
                    assert(false, (("Expected currency to be \"coins\", got %*"):format(v4)))
                    v3 = nil
                else
                    v3 = v1
                end
                v5 = v5 + v3 * 0.95
            end
        end
        return v5
    end,
    getTotalSkillCreditCost = function(a1, a2) -- Line: 112 -- upvalues: getTotalCost (val) -- types: a2: number
        local v1, v2 = getTotalCost(a1, a2)
        if v1 == "coins" then
            return v2
        end
        assert(false, (("Expected currency to be \"coins\", got %*"):format(v1)))
    end,
    getTotalCost = getTotalCost,
}