-- Script path: ReplicatedStorage.Resources.Universal.GameState
-- Decompile time: 9.96 ms

local HealthPerTeam, HealthPerTeam_2, v1
local v2 = game:GetService("RunService"):IsServer()
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameRules = require(script.Parent.GameRules)
local Signal = require(ReplicatedStorage.Resources.Common.Standalone.Signal)
local Enum = require(ReplicatedStorage.Resources.Universal.Enum)
require(ReplicatedStorage.Resources.Universal.LinearPath)
local Maid = require(ReplicatedStorage.Resources.Common.Maid)
local Network = require(ReplicatedStorage.Resources.Universal.Network)
local u54 = {
    GodMode = nil,
    Paths = {},
    RawPaths = {},
    PathsBlacklist = nil,
    PVPTemplarDefeated = {},
    RawPathsReady = false,
    Health = 100,
    Shield = 0,
    MedicOverHealLimits = {},
    HasDifficultyVote = false,
    HasDifficultyVoteCompleted = false,
    DifficultyVotes = {},
    MaxHealth = 100,
    HealthCap = nil,
    TimeScale = 1,
    TimeScaleLocked = true,
    PlayerCount = 0,
    Revives = 0,
    ServerTime = 0,
    RewardMultiplier = 1,
    PreIntermission = true,
    Invincible = false,
    Unsellable = false,
    CanVoteForModifiers = false,
    GlobalTrial = "",
    BannedTowers = {},
    BanningPlayers = {},
    BansPerPlayer = {},
    Banning = false,
    EquippingPVPTowers = false,
    VotingForMap = false,
    PVPArena = "UNSET",
    CanRestart = true,
    TimeScaleDisabled = false,
    Loadouts = nil,
    DisableCustomLoadout = nil,
    TowerLimits = {
        40,
        30,
        25,
        20,
        Max = 16,
    },
    PlayerCountPerTeam = {},
    InputDisabled = false,
    TowerLimit = 0,
    TowerInteraction = false,
    ConsumablesDisabled = false,
    RevivesDisabled = false,
    GameOver = false,
    GameDuration = 0,
    WinningTeam = nil,
    HealthPerTeam = {},
    GlobalModifiers = {},
    GlobalModifiersEnabled = {},
    ClientModifiers = {},
    Wave = 0,
    TotalWaves = 0,
    FinalWave = false,
    TotalEnemies = 0,
    GameStarted = false,
    BonusEligble = true,
}
u54.WaveChanged = Signal.new()
u54.NewGameModes = false
u54.GameMode = ""
u54.MapName = ""
u54.ChallengeTimestamp = nil
u54.ConsumableUsed = false
u54.CleanupMaid = Maid.new()
u54.Objective = nil
for i, j in Enum.Team do
    HealthPerTeam_2 = u54.HealthPerTeam
    v1 = {Current = u54.Health, Max = u54.Health}
    HealthPerTeam_2[j] = v1
end
for k, n in Enum.Team do
    HealthPerTeam = u54.HealthPerTeam
    v1 = {Current = u54.Health, Max = u54.Health}
    HealthPerTeam[n] = v1
end

function u54.getPath(a1, a2) -- Line: 119 -- upvalues: u54 (val) -- types: a1: number, a2: string
    return u54.Paths[tostring(a1)][a2]
end

if RunService:IsServer() and RunService:IsRunning() then
    local v3
    local SkillsUtil = require(ReplicatedStorage.Resources.Universal.SkillsUtil)
    local ServerTagReplicator = require(ServerStorage.Server.Modules.Universal.Controllers.ServerTagReplicator)
    ;(Network.Channel("StatePaths")):On("RequestPaths", function() -- Line: 130 -- upvalues: u54 (val)
        while u54.RawPathsReady == false do
            task.wait()
        end
        local v1 = {}
        for i, j in u54.RawPaths do
            v1[tostring(i)] = j
        end
        return v1
    end)
    local v4 = {}
    local v5 = {}
    for m, i5 in Enum.Team do
        v3 = {Current = u54.Health, Max = u54.Health}
        v4[i5] = v3
        v5[i5] = 0
    end
    u54.Replicator = ServerTagReplicator.new("GameState", {
        GameStarted = false,
        GameOver = false,
        WaveAdd = 0,
        WaveGlitch = false,
        HealthTaken = false,
        ReviveAllowed = true,
        GlitchEffect = false,
        TimeScaleDisabled = false,
        Health = u54.Health,
        MaxHealth = u54.Health,
        HealthPerTeam = v4,
        PlayerCountPerTeam = v5,
        TimeScale = u54.TimeScale,
        TimeScaleLocked = u54.TimeScaleLocked,
        NewGameModes = u54.NewGameModes,
        Wave = u54.Wave,
        ServerTime = u54.ServerTime,
        CanVoteForModifiers = u54.CanVoteForModifiers,
        GlobalTrial = u54.GlobalTrial,
        ClientModifiers = u54.ClientModifiers,
        GlobalModifiersEnabled = u54.GlobalModifiersEnabled,
    })
    if ReplicatedStorage:FindFirstChild("State") then
        ReplicatedStorage.State.Health.Current.Changed:Connect(function() -- Line: 184 -- upvalues: ReplicatedStorage (val), u54 (val), Enum (val)
            local Value = ReplicatedStorage.State.Health.Current.Value
            u54.Replicator:Set("Health", Value)
            u54.HealthPerTeam[Enum.Team.Player].Current = Value
            u54.Replicator:Set("HealthPerTeam", u54.HealthPerTeam)
        end)
        ReplicatedStorage.State.Health.Max.Changed:Connect(function() -- Line: 192 -- upvalues: ReplicatedStorage (val), u54 (val), Enum (val)
            local Value = ReplicatedStorage.State.Health.Max.Value
            u54.Replicator:Set("MaxHealth", Value)
            u54.HealthPerTeam[Enum.Team.Player].Max = Value
            u54.Replicator:Set("HealthPerTeam", u54.HealthPerTeam)
        end)
    end
    ;(u54.Replicator:GetStateChangedSignal("TowerInteraction")):Connect(function(a1) -- Line: 201 -- upvalues: u54 (val)
        u54.TowerInteraction = a1
    end)
    u54.WaveChanged:Connect(function() -- Line: 205 -- upvalues: u54 (val)
        u54.Replicator:Set("Wave", u54.Wave)
    end)

    function u54.IsModifierEnabled(a1) -- Line: 209 -- upvalues: u54 (val) -- types: a1: string
        return u54.Replicator.State.GlobalModifiersEnabled[a1] == true
    end

    function u54.SetGlobalModifierEnabled(a1, a2) -- Line: 213 -- upvalues: u54 (val)
        u54.GlobalModifiersEnabled[a1] = a2 or false
        u54.Replicator:Set("GlobalModifiersEnabled", u54.GlobalModifiersEnabled)
    end

    function u54.GetTowerCount(a1) -- Line: 218 -- upvalues: u54 (val), GameRules (val)
        local v1 = u54.PlayerCountPerTeam[a1] or 0
        local ManualTowerLimit = GameRules.Get("ManualTowerLimit") or u54.TowerLimits[v1] or u54.TowerLimits.Max
        if u54.IsModifierEnabled("The Star") then
            ManualTowerLimit = ManualTowerLimit + 5
        end
        return ManualTowerLimit
    end

    function u54.IncrementTeamHealth(a1, a2) -- Line: 232
        -- upvalues: GameRules (val), ServerStorage (val), u54 (val), Enum (val), SkillsUtil (val)
        -- upvalues: ReplicatedStorage (val)
        if a2 <= 0 and GameRules.Has("Invincible") then
            return
        end
        local v1 = 0
        local TowerClass = require(ServerStorage.Server.Modules.Game.Modules.TowerClass)
        if not u54.IsModifierEnabled("Glass") then
            local v2
            if GameRules.HasSkill(Enum.SkillTreeNode.Overhealing) then
                v1 = SkillsUtil.avgSkillEval(Enum.SkillTreeNode.Overhealing)
            end
            for i, j in u54.MedicOverHealLimits do
                v2 = TowerClass.getTowerByModel(i)
                if v2 and v2.Team == a1 then
                    v1 = v1 + j
                end
            end
        end
        local v3 = u54.HealthPerTeam[a1]
        v3.Current = math.clamp(u54.HealthPerTeam[a1].Current + a2, 0, u54.HealthPerTeam[a1].Max + v1)
        if a1 ~= Enum.Team.Player then
            u54.Replicator:Set("HealthPerTeam", u54.HealthPerTeam)
            return u54.HealthPerTeam[a1].Current
        end
        u54.Health = u54.HealthPerTeam[a1].Current
        u54.Replicator:Set("Health", u54.Health)
        ReplicatedStorage.State.Health.Current.Value = u54.Health
        return u54.Health
    end

    function u54.GetMaxHealth() -- Line: 274 -- upvalues: u54 (val), Enum (val)
        local v1 = 0
        for i, j in u54.MedicOverHealLimits do
            v1 = v1 + j
        end
        return u54.HealthPerTeam[Enum.Team.Player].Max + v1
    end

    function u54.SetTeamHealth(a1, a2, a3) -- Line: 283
        -- upvalues: u54 (val), Enum (val), ReplicatedStorage (val)
        if u54.GodMode then
            a2 = 9000000000
        end
        local v1 = a3 and math.min(a2, a3) or a2
        local v2 = a3 and math.max(a3, v1) or v1
        if a1 ~= Enum.Team.Player then
            u54.HealthPerTeam[a1].Current = v1
            u54.HealthPerTeam[a1].Max = v2
            u54.Replicator:Set("HealthPerTeam", u54.HealthPerTeam)
            return
        end
        u54.Health = v1
        u54.MaxHealth = v2
        u54.Replicator:Set("Health", u54.Health)
        u54.Replicator:Set("MaxHealth", u54.MaxHealth)
        ReplicatedStorage.State.Health.Current.Value = u54.Health
        ReplicatedStorage.State.Health.Max.Value = u54.MaxHealth
    end

    function u54.IncrementHealth(a1) -- Line: 310 -- upvalues: GameRules (val), u54 (val), Enum (val), SkillsUtil (val)
        warn("IncrementHealth is deprecated, use IncrementTeamHealth instead", debug.traceback())
        if a1 <= 0 and GameRules.Has("Invincible") then
            return
        end
        local v1 = 0
        if not u54.IsModifierEnabled("Glass") then
            if GameRules.HasSkill(Enum.SkillTreeNode.Overhealing) then
                v1 = SkillsUtil.avgSkillEval(Enum.SkillTreeNode.Overhealing)
            end
            for i, j in u54.MedicOverHealLimits do
                v1 = v1 + j
            end
        end
        u54.Health = math.clamp(u54.Health + a1, 0, u54.MaxHealth + v1)
        local v2 = u54.HealthPerTeam[Enum.Team.Player]
        v2.Current = u54.Health
        v2 = u54.HealthPerTeam[Enum.Team.Player]
        v2.Max = u54.MaxHealth + v1
        u54.Replicator:Set("Health", u54.Health)
        u54.Replicator:Set("HealthPerTeam", u54.HealthPerTeam)
    end

    function u54.SetHealth(a1) -- Line: 338 -- upvalues: u54 (val), GameRules (val), Enum (val), SkillsUtil (val)
        if u54.GodMode then
            a1 = (1 / 0)
        end
        local v1 = 0
        if not u54.IsModifierEnabled("Glass") and GameRules.HasSkill(Enum.SkillTreeNode.Overhealing) then
            v1 = SkillsUtil.avgSkillEval(Enum.SkillTreeNode.Overhealing)
        end
        warn("SetHealth is deprecated, use SetTeamHealth instead", debug.traceback())
        u54.Health = a1
        u54.MaxHealth = a1 + v1
        u54.HealthPerTeam[Enum.Team.Player] = {Current = a1, Max = a1}
        u54.Replicator:Set("Health", u54.Health)
        u54.Replicator:Set("MaxHealth", u54.MaxHealth)
        u54.Replicator:Set("HealthPerTeam", u54.HealthPerTeam)
    end

    function u54.Get(a1) -- Line: 365 -- upvalues: u54 (val)
        return u54[a1]
    end

    u54.Replicator.ReplicationFolder.Name = "GameStateReplicator"
    u54.Replicator:Hook(u54)
    return u54
end
if not RunService:IsRunning() then
    u54.Replicator = {
        GetStateChangedSignal = function(a1, a2) -- Line: 373 -- upvalues: Signal (val)
            return Signal.new()
        end,
    }
    return u54
end
local TagReplicator = require(ReplicatedStorage.Client.Modules.Universal.Utilities.TagReplicator)
local TypedPromise = require(ReplicatedStorage.Resources.Common.TypedPromise)
local Promise = if not v2 then require(ReplicatedStorage.Resources.Common.Promise) else require(ServerStorage.Server.Modules.Universal.Modules.Session.DataStore2.Promise)
local Enum_2 = require(ReplicatedStorage.Resources.Universal.Enum)
local Middleware = require(ReplicatedStorage.Resources.Universal.Middleware)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Universal.Modules.PlayerReplicator)
local GameStateReplicator = (ReplicatedStorage:WaitForChild("StateReplicators")):WaitForChild("GameStateReplicator")
local u343 = {}
u343.Updated = Signal.new()
u343.Paths = {}
u343.PlayerCountPerTeam = {}
u343.GlobalModifiers = {}
local u353 = TagReplicator.getReplicatorEntityFromFolder(GameStateReplicator)
u343.Replicator = u353
u343.State = u353
u353:Hook(u353)
u353:Hook(u343)
;(u353:GetStateChangedSignal("Wave")):Connect(function(a1) -- Line: 405 -- upvalues: Middleware (val), Enum_2 (val)
    Middleware:RunFunction(Enum_2.HookType.OnNextWave, nil, function() -- Line: 406 -- upvalues: a1 (val)
        return a1
    end)
end)
task.defer(function() -- Line: 411 -- upvalues: u343 (val), u353 (val)
    u343.Updated:Fire(u353)
end)

function u343.GetState() -- Line: 415 -- upvalues: Promise (val), u353 (val)
    return Promise.resolve(u353)
end

function u54.Get(a1) -- Line: 419 -- upvalues: u54 (val)
    return u54.Replicator:Get(a1)
end

function u343.GetTowerCount(a1) -- Line: 423 -- upvalues: u343 (val), u54 (val)
    return u54.TowerLimits[u343.PlayerCountPerTeam[a1] or 0] or u54.TowerLimits.Max
end

u343.Replicator:Set("TowerLimit", 0)

local function refreshTowerLimit(a1) -- Line: 431 -- upvalues: u343 (val)
    u343.Replicator:Set("TowerLimit", (u343.GetTowerCount(a1)))
end

;(PlayerReplicator.GetLocalPlayer()):andThen(function(a1) -- Line: 435 -- upvalues: refreshTowerLimit (val), u343 (val), u54 (val)
    (a1.Replicator:GetStateChangedSignal("Team")):Connect(refreshTowerLimit)
    ;(u343.Replicator:GetStateChangedSignal("TowerLimits")):Connect(function(a1_2) -- Line: 440 -- upvalues: u54 (upval), a1 (val), u343 (upval)
        u54.TowerLimits = a1_2
        local Team = a1.Team
        u343.Replicator:Set("TowerLimit", (u343.GetTowerCount(Team)))
    end)
    ;(u343.Replicator:GetStateChangedSignal("PlayerCountPerTeam")):Connect(function() -- Line: 445 -- upvalues: a1 (val), u343 (upval)
        local Team = a1.Team
        u343.Replicator:Set("TowerLimit", (u343.GetTowerCount(Team)))
    end)
    local Team = a1.Team
    u343.Replicator:Set("TowerLimit", (u343.GetTowerCount(Team)))
end)

function u343.IsModifierEnabled(a1) -- Line: 452 -- upvalues: u343 (val) -- types: a1: string
    return u343.Replicator.State.GlobalModifiersEnabled[a1] == true
end

function u343.GetAsync(a1) -- Line: 456 -- upvalues: TypedPromise (val), u343 (val)
    return TypedPromise.new(function(a1_2, a2, a3) -- Line: 457 -- upvalues: u343 (upval), a1 (val)
        local u3 = false
        a3(function() -- Line: 460 -- upvalues: u3 (ref)
            u3 = true
        end)
        if u343.Replicator:Get(a1) ~= nil then
            a1_2(u343.Replicator:Get(a1))
        else
            local v1
            repeat
                if not (u343.Replicator:Get(a1)) then
                    task.wait()
                end
            until v1 or u3
            v2(v1)
        end
    end)
end

function u343.getPath(a1, a2) -- Line: 479 -- upvalues: u343 (val) -- types: a1: number, a2: number
    local v1 = 0
    local v2 = u343.Paths[a1][a2]
    while v2 == nil do
        if not (v1 < 5) then
            break
        end
        task.wait(0.1)
        v2 = u343.Paths[a1][a2]
        v1 = v1 + 1
    end
    return v2
end

return u343