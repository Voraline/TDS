-- Script path: ReplicatedStorage.Resources.Universal.PVPConstants
-- Decompile time: 1.79 ms

local Content = require(script.Parent.Content)
local PVPRanks = require(script.PVPRanks)
local PVPSeasons = require(script.PVPSeasons)
local PVP = Content("Gamemodes"):WaitForChild("PVP")

local function getPVPDifficulty(a1) -- Line: 10 -- upvalues: PVP (val) -- types: a1: string?
    if not a1 then
        a1 = "PVP_lowRanks"
    end
    local v1 = PVP.Difficulties:FindFirstChild(a1)
    assert(v1, (("Difficulty not found: %*"):format(a1)))
    return v1
end

return {
    RATING_PERIOD_LENGTH = 4,
    MATCHES_UNTIL_RANKED = 0,
    getPVPWaveData = function(a1) -- Line: 28 -- upvalues: PVP (val) -- types: a1: string?
        local v1 = a1 or "PVP_lowRanks"
        local v2 = PVP.Difficulties:FindFirstChild(v1)
        assert(v2, (("Difficulty not found: %*"):format(v1)))
        local Waves = v2:FindFirstChild("Waves")
        assert(Waves, (("WaveData not found in %*"):format(a1)))
        return require(Waves)
    end,
    getSpawnableEnemies = function(a1) -- Line: 20 -- upvalues: PVP (val) -- types: a1: string
        local v1 = a1 or "PVP_lowRanks"
        local v2 = PVP.Difficulties:FindFirstChild(v1)
        assert(v2, (("Difficulty not found: %*"):format(v1)))
        local SpawnableEnemies = v2:FindFirstChild("SpawnableEnemies")
        assert(SpawnableEnemies, (("SpawnableEnemies not found in %*"):format(a1)))
        return require(SpawnableEnemies)
    end,
    getWaveTime = function(a1) -- Line: 36 -- upvalues: PVP (val) -- types: a1: string?
        local v1 = a1 or "PVP_lowRanks"
        local v2 = PVP.Difficulties:FindFirstChild(v1)
        assert(v2, (("Difficulty not found: %*"):format(v1)))
        local Waves = v2:FindFirstChild("Waves")
        assert(Waves, (("WaveData not found in %*"):format(a1)))
        return require(Waves).ExtraOptions.WaveTime or 40
    end,
    getLoadoutSize = function(a1) -- Line: 40 -- upvalues: PVP (val) -- types: a1: string?
        local v1 = a1 or "PVP_lowRanks"
        local v2 = PVP.Difficulties:FindFirstChild(v1)
        assert(v2, (("Difficulty not found: %*"):format(v1)))
        local Waves = v2:FindFirstChild("Waves")
        assert(Waves, (("WaveData not found in %*"):format(a1)))
        return require(Waves).ExtraOptions.LoadoutSize or 4
    end,
    getConsumableLoadoutSize = function(a1) -- Line: 44 -- upvalues: PVP (val) -- types: a1: string?
        local v1 = a1 or "PVP_lowRanks"
        local v2 = PVP.Difficulties:FindFirstChild(v1)
        assert(v2, (("Difficulty not found: %*"):format(v1)))
        local Waves = v2:FindFirstChild("Waves")
        assert(Waves, (("WaveData not found in %*"):format(a1)))
        return require(Waves).ExtraOptions.ConsumableLoadoutSize or 4
    end,
    getActiveSeason = function() -- Line: 48 -- upvalues: PVPSeasons (val)
        local ServerTimeNow = workspace:GetServerTimeNow()
        for k, v in pairs(PVPSeasons) do
            if v.startsAt
                and v.endsAt
                and v.startsAt.UnixTimestamp <= ServerTimeNow
                and ServerTimeNow <= v.endsAt.UnixTimestamp then
                return v
            end
        end
        return nil
    end,
    getLastSeason = function() -- Line: 64 -- upvalues: PVPSeasons (val)
        local v1 = {}
        for i, j in PVPSeasons do
            table.insert(v1, j)
        end
        table.sort(v1, function(a1, a2) -- Line: 71
            return a1.endsAt.UnixTimestamp < a2.endsAt.UnixTimestamp
        end)
        return v1[#v1]
    end,
    RANK_DATA = PVPRanks,
    SEASON_DATA = PVPSeasons,
    RANK_DIFFICULTIES = {
        PVP_lowRanks = NumberRange.new(0, 499),
        PVP_midRanks = NumberRange.new(500, 1799),
        PVP_highRanks = NumberRange.new(1800, (1 / 0)),
    },
    ARENA_IMAGES = {
        PVP_lowRanks = "rbxassetid://96068039844843",
        PVP_midRanks = "rbxassetid://111007445869339",
        PVP_highRanks = "rbxassetid://88240765692605",
    },
    ARENA_NAMES = {PVP_lowRanks = "Basic Arena", PVP_midRanks = "Molten Arena", PVP_highRanks = "Fallen Arena"},
}