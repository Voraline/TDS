-- Script path: ReplicatedStorage.Resources.Universal.GameRules
-- Decompile time: 1.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Resources.Universal.Enum)
local u22 = RunService:IsServer()
local u23 = {
    Invincible = false,
    InfiniteCash = false,
    InfiniteTowers = false,
    InfiniteConsumables = false,
    NoConsumableCooldowns = false,
    GoldenPerks = true,
    ProgressionDisabled = false,
    NoBumPenalty = false,
    GroupTax = true,
    EconomyOnHit = false,
    MusicEnabled = true,
    VoteSkipEnabled = true,
    HiddenWave = false,
    PVPEcoOnQueue = true,
    SkillsEnabled = true,
    Skills = {},
}
local u25 = nil
local v1 = {
    Get = function(a1) -- Line: 58 -- upvalues: u23 (val) -- types: a1: string
        return u23[a1]
    end,
    GetAll = function() -- Line: 63 -- upvalues: u23 (val)
        local v1
        local v2 = {}
        local v3 = nil
        local v4 = nil
        for i, j in u23, v3, v4 do
            v1 = if i ~= "Skills" then j else table.clone(j)
            v2[i] = v1
        end
        table.freeze(v2)
        return v2
    end,
    GetSkill = function(a1) -- Line: 75 -- upvalues: u23 (val), Enum (val)
        return u23.SkillsEnabled and u23.Skills[Enum.SkillTreeNode.ToString(a1)]
    end,
    SetSkill = function(a1, a2) -- Line: 81 -- upvalues: u23 (val), Enum (val), u22 (val), u25 (ref) -- types: a2: boolean
        local Skills = u23.Skills
        local v1 = Enum.SkillTreeNode.ToString(a1)
        if not Skills then
            u23.Skills = {}
            Skills = u23.Skills
        end
        if Skills[v1] == a2 then
            return
        end
        Skills[v1] = a2
        if u22 then
            u25:Set("Skills", Skills)
        end
    end,
    Set = function(a1, a2) -- Line: 103 -- upvalues: u23 (val), u22 (val), u25 (ref) -- types: a1: string
        assert(a1 ~= "Skills", "Use GameRules.SetSkill to set skills")
        u23[a1] = a2
        if u22 then
            u25:Set(a1, a2)
        end
    end,
    HasSkill = function(a1) -- Line: 114 -- upvalues: u23 (val), Enum (val)
        return u23.SkillsEnabled and u23.Skills and u23.Skills[Enum.SkillTreeNode.ToString(a1)] == true
    end,
    Has = function(a1) -- Line: 122 -- upvalues: u23 (val) -- types: a1: string
        return u23[a1] == true
    end,
    Changed = function() -- Line: 127 -- upvalues: u25 (ref)
        return u25.Changed
    end,
    GetRuleChangedEvent = function(a1) -- Line: 132 -- upvalues: u25 (ref) -- types: a1: string
        return u25:GetStateChangedSignal(a1)
    end,
}
if not RunService:IsRunning() then
    return v1
end
if not u22 then
    u25 = (require(ReplicatedStorage.Client.Modules.Universal.Utilities.TagReplicator)).getReplicatorEntityFromFolder(((ReplicatedStorage:WaitForChild("StateReplicators")):WaitForChild("GameRulesReplicator")))
    u25:Hook(u23)
else
    local ServerTagReplicator = require(ServerStorage.Server.Modules.Universal.Controllers.ServerTagReplicator)
    for i, j in Enum.SkillTreeNode do
        u23.Skills[i] = true
    end
    u25 = ServerTagReplicator.new("GameRules", u23)
    u25.ReplicationFolder.Name = "GameRulesReplicator"
end
return v1