-- Script path: ReplicatedStorage.Resources.Universal.Enum
-- Decompile time: 2.62 ms

local u205 = Enum
local v1 = {
    Team = {Player = 10, Enemy = 11, Red = 12, Blue = 13},
    DamageType = {
        Normal = 1,
        LeadBullet = 2,
        Explosion = 3,
        Energy = 4,
        Fire = 5,
        Melee = 6,
        UnitCollision = 7,
        FlyDetectMelee = 8,
    },
    DamageDisplayType = {
        Normal = 1,
        Explosion = 2,
        Posion = 3,
        Energy = 4,
        Melee = 5,
        Heal = 6,
        Frost = 7,
    },
    TargetingMode = {
        First = 1,
        Last = 2,
        Strongest = 3,
        Weakest = 4,
        Closest = 5,
        Farthest = 6,
        Random = 7,
    },
    StunType = {
        Normal = 1,
        Poison = 2,
        Fire = 3,
        Frozen = 4,
        Ducky = 5,
        Spooky = 6,
        Boomer = 7,
        Legacy = 8,
        Golden = 9,
    },
    JesterBomb = {Fire = 1, Ice = 2, Poison = 3, Confusion = 4},
    Element = {Frost = 1, Fire = 2},
    AcePilotMode = {Normal = 1, Figure8 = 2},
    ArrowType = {Normal = 1, Flame = 2, Shock = 3, Explosive = 4},
    BuffType = {Range = 1, Damage = 2, Cooldown = 3},
    CharacterScale = {Normal = 1, Small = 2, Large = 3},
    UIScale = {Small = 1, Default = 2, Large = 3, Huge = 4},
    Modifier = {
        God = 1,
        Hidden = 2,
        Flying = 3,
        Stunned = 4,
        Lead = 5,
        CliffUnit = 6,
        StunImmune = 7,
        Ignore = 8,
        HiddenDetection = 9,
        Boss = 10,
        ExplosionImmune = 11,
        EnergyImmune = 12,
        FreezeImmune = 13,
        FireImmune = 14,
        Ghost = 15,
        Invincible = 16,
        HealthRegen = 17,
        Slime = 18,
        Nimble = 19,
        Bloated = 20,
        LastSlime = 21,
        Tank = 22,
        Explosive = 23,
        Jailed = 24,
        Aggro = 25,
        DoubleDamage = 26,
        MoltenCorpse = 27,
        Frozen = 28,
        FullRefund = 29,
        FireworkBuff = 30,
        Hologram = 31,
        Blessed = 32,
        Shield = 33,
        SpeedBoost = 34,
        HiddenExposed = 35,
    },
}
v1.DetectionModifiers = {
    Hidden = v1.Modifier.Hidden,
    Lead = v1.Modifier.Lead,
    Flying = v1.Modifier.Flying,
}
v1.HookType = {
    SpawnEnemy = 1,
    EnemyRequestSpawn = 2,
    OnDialogue = 3,
    OnMapLoad = 4,
    OnMapHealthCalculated = 5,
    OnNextWave = 6,
    ManagerCreatedEnemy = 7,
    OnRewardCalculated = 8,
    OnWaveEnemiesGenerated = 9,
    OnWaveMusicCreated = 10,
    OnGameRewarded = 11,
    OnPlayerLoadout = 12,
    OnStartingCashReward = 13,
    OnCashReward = 14,
    OnEcoScale = 15,
    OnDialogueOverride = 16,
    OnWavesGenerated = 17,
    OnBattlepassRewardMultiplier = 18,
    OnFarmIncome = 19,
    OnWaveLayout = 20,
    OnWaveEnd = 21,
    OnWaveBonus = 22,
    OnDebuffCreated = 23,
    OnBuffCreated = 24,
}
v1.ItemPickupType = {
    PhilipsRazor = 1,
    Shell = 2,
    CandyCane = 3,
    Cookie = 3,
    Battery = 4,
    Cash = 5,
    Coin = 6,
    XP = 7,
    Gem = 8,
    Pumpkin = 9,
    CandyCorn = 10,
    EnemyLorebook = 11,
    Bell = 12,
    Duck = 13,
    BeachBall = 14,
    Gumdrop = 15,
    StarBattery = 16,
    SnowCharm = 17,
}
v1.GameModifier = {
    PollutedWasteland = 1,
    DoubleHealth = 2,
    Fallen = 3,
    Small = 4,
    Birthday = 5,
    Cowboy = 6,
    AllPaths = 7,
    NewModels = 8,
    HealthLock = 9,
    Mutation = 10,
    BadTranslation = 11,
    ClassicDeath = 12,
    PirateHat = 13,
    Halloween = 14,
    Christmas = 15,
    Valentines = 16,
    Easter = 17,
    NewYear = 18,
    JulyFourth = 19,
    Astronaut = 20,
    Scuba = 21,
    Glass = 22,
    Boss = 23,
    BadlandsEnemies = 24,
    Blood = 25,
    PizzaParty = 26,
    Redemption = 27,
    Weekend = 28,
    MemeMode = 29,
    Juggernaut = 30,
    Vanguard = 31,
    OopsAllSlimes = 32,
    ClassicRoblox = 33,
    ClassicOof = 34,
    BackToBasics = 35,
    BossRush = 36,
    Legion = 37,
    JailedTower = 38,
    Battlepass = 39,
    BanFarm = 40,
    BanGatlingGun = 41,
    Legacy = 42,
    UseEnemySpawner = 43,
}
v1.BuffType = {Range = 1, Damage = 2, Cooldown = 3}
v1.DebuffType = {
    Burn = 1,
    Posion = 2,
    Sting = 3,
    Freeze = 5,
    Shock = 6,
    Stun = 7,
    Scale = 8,
    Slowness = 9,
    Confuse = 10,
    Frost = 11,
    Bleed = 12,
    Bees = 13,
}
v1.Result = {Success = 1, Error = 2}
v1.TowerType = {Flying = 1, Ground = 2, Cliff = 3, Both = 4}
v1.TowerCategory = {
    Starter = 1,
    Intermediate = 2,
    Advanced = 3,
    Hardcore = 4,
    Exclusive = 5,
    Event = 6,
}
v1.TowerRole = {Offense = 1, Defense = 2, Support = 3}
v1.SkinRarity = {
    Common = 1,
    Uncommon = 2,
    Rare = 3,
    Legendary = 4,
    Golden = 5,
    Ultimate = 9,
    Exclusive = 6,
    Event = 7,
    Developer = 8,
}
v1.FlairRarity = {
    Common = 1,
    Uncommon = 2,
    Rare = 3,
    Legendary = 4,
    Exclusive = 6,
}
v1.StickerRarity = {
    Common = 1,
    Uncommon = 2,
    Rare = 3,
    Legendary = 4,
    Exclusive = 6,
}
v1.CrateItemRarity = {
    Common = 1,
    Uncommon = 2,
    Rare = 3,
    Epic = 4,
    Legendary = 5,
    Mythic = 6,
    Exclusive = 7,
}
v1.ConsumableRarity = {
    Common = 1,
    Uncommon = 2,
    Rare = 3,
    Epic = 4,
    Legendary = 5,
    Exclusive = 6,
}
v1.CurrencyType = {Free = 1, Coins = 2, Gems = 3, Robux = 4}
v1.CrateCategory = {Default = 1, Consumables = 2, Robux = 3, Event = 4}
v1.Difficulty = {
    Easy = 1,
    Medium = 2,
    Normal = 3,
    Hard = 4,
    Insane = 5,
    Event = 6,
    Special = 7,
    VeryEasy = 8,
}
v1.Gamemode = {
    Survival = 1,
    Hardcore = 2,
    DefendTheCenter = 3,
    Halloween = 4,
    Winter = 5,
    Tutorial = 6,
    EggHunt2024 = 7,
    Event = 8,
    PVP = 9,
    Halloween2024 = 10,
    PlsDonate = 11,
    Sandbox = 12,
    FrostInvasion = 13,
    Special = 14,
    EggHunt2025 = 15,
    Hunt2025 = 16,
    DuckEvent = 17,
    Summer2025 = 18,
    Halloween2025 = 19,
    Christmas2025 = 20,
}
v1.MapType = {Standard = 1, Exclusive = 2, Community = 3}
v1.CutSceneTiming = {PreWave = 1, PostWave = 2}
v1.EmoteInteractType = {None = 1, Single = 2, Multi = 3}
v1.TutorialStage = {Start = 1, Game = 2, Lobby = 3, Completed = 4}
v1.UGCState = {InProgress = 1, Completed = 2}
v1.UGCPurchaseResult = {Purchased = 1, NotPurchased = 2, NoItemsLeft = 3}
v1.BanReason = {
    Exploiting = 1,
    Toxicity = 2,
    Scamming = 3,
    Abusing = 4,
    Other = 100,
}
v1.TweenPriority = {Stepped = 1, Heartbeat = 2, RenderStepped = 3}
v1.ConsumableState = {Ready = 1, Queued = 2, Consuming = 3}
v1.ConsumableQueue = {None = 1, Global = 2, PerPlayer = 3}
v1.CooldownType = {None = 1, Post = 2, Instant = 3}
v1.MiddlewarePriority = {Stack = 1, Replace = 2}
v1.MatchResult = {Lose = 1, Win = 2, Draw = 3}
v1.CameraMode = {Default = 1, BirdsEye = 2, Spectate = 3}
v1.Rank = {
    Unranked = -1,
    PrivateI = 1,
    PrivateII = 2,
    PrivateIII = 3,
    SergeantI = 4,
    SergeantII = 5,
    SergeantIII = 6,
    LieutenantI = 7,
    LieutenantII = 8,
    LieutenantIII = 9,
    MajorI = 10,
    MajorII = 11,
    MajorIII = 12,
    GeneralI = 13,
    GeneralII = 14,
    GeneralIII = 15,
}
v1.SkillTreeCategory = {Offense = 1, Defense = 2, Economy = 3, Strategy = 4}
v1.SkillTreeNode = {
    EnhancedOptics = 1,
    ResellValue = 2,
    Fortify = 3,
    Overhealing = 4,
    FightDirty = 5,
    ExtremeConditioning = 6,
    Stonks = 7,
    ExpandedBarracks = 8,
    SplashDamage = 9,
    BeefedUpMinions = 10,
    Precision = 11,
    Scavenger = 12,
    SkillAccelerator = 13,
    Reenforcements = 14,
    BiggerBudget = 15,
    Bandages = 16,
    Scholar = 17,
}
v1.SkillTreeFormat = {
    Percentage = 1,
    Number = 2,
    Integer = 3,
    Currency = 4,
    Enemies = 5,
}
v1.SkillTileState = {Locked = 1, Unlocked = 2, Owned = 3, MaxedOut = 4}
for k, v in pairs(v1) do
    for k2, i in pairs(v) do
        v[k2] = (tostring(i))
    end
    local u169 = {}
    for k3, j in pairs(v) do
        u169[tonumber(j)] = k3
    end
    local u183 = {}

    function u183.__newindex(a1, a2, a3) -- Line: 1073
        error("Enum." .. a2 .. " is read-only", 2)
    end

    function u183.Next(a1) -- Line: 1077 -- upvalues: u169 (val), v (val)
        local v1 = tonumber(a1) + 1
        if #u169 < v1 then
            v1 = 1
        end
        return v[u169[v1]]
    end

    function u183.ToString(a1) -- Line: 1086 -- upvalues: u169 (val)
        return u169[tonumber(a1)]
    end

    function u183.HasValue(a1) -- Line: 1090 -- upvalues: u169 (val)
        return u169[tonumber(a1)] ~= nil
    end

    function u183.HasKey(a1) -- Line: 1093 -- upvalues: v (val)
        return rawget(v, a1) ~= nil
    end

    function u183.__index(a1, a2) -- Line: 1098 -- upvalues: u183 (val), k (val)
        if u183[a2] then
            return u183[a2]
        end
        error(string.format("%q is not a valid member of %s", tostring(a2), k), 2)
    end

    setmetatable(v, u183)
end
local v2 = {
    __index = function(a1, a2) -- Line: 1110 -- upvalues: u205 (val)
        if u205[a2] then
            return u205[a2]
        end
        error(string.format("%q is not a valid member of Enum", (tostring(a2))), 2)
    end,
    __newindex = function() -- Line: 1117
        error("Enum is read-only", 2)
    end,
}
setmetatable(v1, v2)
return v1