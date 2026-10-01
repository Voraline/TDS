-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.Troops
-- Decompile time: 4.46 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Content = require(ReplicatedStorage.Resources.Universal.Content)
local GameState = require(ReplicatedStorage.Resources.Universal.GameState)
local Enum = require(ReplicatedStorage.Resources.Universal.Enum)
local table = require(ReplicatedStorage.Resources.Globals.table)
local Tower = Content("Tower")
local u45 = RunService:IsClient()
local u48 = RunService:IsRunning()
local u49 = {}
local Fusion = require(ReplicatedStorage:WaitForChild("Resources").UI.Fusion)
local Icons = require((ReplicatedStorage:WaitForChild("Resources")):WaitForChild("Icons"))
local Value = Fusion.Value

local function getEligible(a1) -- Line: 119
    -- upvalues: Value (val), u45 (val), u48 (val), Players (val)
    local u3 = Value(false)
    if u45 and u48 then
        task.spawn(function() -- Line: 125 -- upvalues: a1 (val), Players (upval), u3 (val)
            local success, result = pcall(function() -- Line: 126 -- upvalues: a1 (upval), Players (upval)
                return a1.Eligible(Players.LocalPlayer)
            end)
            u3:set(success and result)
        end)
        return u3
    end
    return u3
end

local function getPaths(a1) -- Line: 136 -- types: a1: table
    local v1 = 0
    for k, v in pairs(a1) do
        if not v[1] then
            if v1 > 0 then
                warn("Multiple paths have been detected, and stat does not have multiple paths")
            end
        elseif not (#v < v1) then
            v1 = #v
        else
            warn("Upgrade path has less upgrades than the previous path")
        end
    end
    return v1, a1
end

local function formatStats(a1) -- Line: 158 -- upvalues: getPaths (val), table (val) -- types: a1: table
    for k, v in pairs(a1) do
        v.Paths = getPaths(v.Upgrades)
        if not v.Paths or not (0 < v.Paths) then
            table.sort(v.Upgrades or {}, function(a1, a2) -- Line: 165
                return a1.Cost < a2.Cost
            end)
        end
    end
    return a1
end

local function resolveTroop(a1, a2) -- Line: 173
    -- upvalues: Tower (val), GameState (val), u48 (val), u45 (val), formatStats (val), table (val), Enum (val)
    -- upvalues: Icons (val), Value (val), Players (val), HttpService (val)
    local v1
    if not a1 then
        return nil
    end
    local v2 = Tower:FindFirstChild(a1)
    local Stats = v2
    if Stats then
        Stats = v2:FindFirstChild("Stats")
    end
    if not Stats then
        return nil
    end
    local v3 = require(Stats)
    local TowerInformation = v2:FindFirstChild("TowerInformation")
    local Animator = v2 and v2:WaitForChild("Animator")
    local Upgrade = v2 and v2:FindFirstChild("Upgrade")
    local UpgradeOptions = v2 and v2:FindFirstChild("UpgradeOptions")
    if GameState.GameMode == "PVP" then
        v1 = v2 and v2:FindFirstChild("Stats-PVP")
        if v1 then
            Stats = v1
        end
    end
    if a2 then
        v1 = v2 and v2:FindFirstChild((("Stats-%*"):format(a2)))
        if v1 then
            Stats = v1
        end
    end
    local u78 = require(Stats)
    if workspace:FindFirstChild("Type").Value ~= "Lobby" then
        u78.Upgrades = Upgrade and u48 and require(Upgrade)
        u78.Animator = if not u45 then {} else if not u48 then {} else require(Animator)
    end
    u78.Stats = formatStats(table.reconcile(v3.Stats, u78.Stats))
    u78.TowerInformation = TowerInformation and require(TowerInformation) or {}
    local v4 = {Default = true}
    for i in u78.Properties.SkinData or {} do
        v4[i] = true
    end
    local SkinData_2 = u78.Properties.SkinData or {}
    if not u78.Properties.SkinData then
        u78.Properties.SkinData = SkinData_2
    end
    if not SkinData_2.Default then
        SkinData_2.Default = {
            Icon = u78.Properties.Preview.Icon,
            Rarity = Enum.SkinRarity.Common,
        }
    end
    if Icons.Towers[a1] then
        local v5
        for j, k in SkinData_2 do
            v5 = Icons.Towers[a1][j]
            if v5 then
                k.Icon = v5
            end
        end
        if Icons.Towers[a1].Default then
            u78.Properties.Preview.Icon = Icons.Towers[a1].Default
        end
    end
    local Price = u78.Properties.Price
    if Price then
        if not Price.Eligible then
            Price.IsEligible = Value(true)
        else
            local u225 = Value(false)
            if u45 and u48 then
                task.spawn(function() -- Line: 125 -- upvalues: Price (val), Players (upval), u225 (val)
                    local success, result = pcall(function() -- Line: 126 -- upvalues: Price (upval), Players (upval)
                        return Price.Eligible(Players.LocalPlayer)
                    end)
                    u225:set(success and result)
                end)
            end
            Price.IsEligible = u225
        end
    end
    local Attribute = Stats:GetAttribute("_DATA")
    if Attribute then
        u78.Stats = formatStats(HttpService:JSONDecode(Attribute))
    end
    if u48 then
        (Stats:GetAttributeChangedSignal("_DATA")):Connect(function() -- Line: 263 -- upvalues: Stats (ref), u78 (val), formatStats (upval), HttpService (upval)
            local Attribute = Stats:GetAttribute("_DATA")
            if Attribute then
                u78.Stats = formatStats(HttpService:JSONDecode(Attribute))
            end
        end)
    end
    u78.Skins = v4
    u78.UpgradeOptions = UpgradeOptions and require(UpgradeOptions) or {}
    return u78
end

return function(a1, a2, a3, a4) -- Line: 277
    -- upvalues: u49 (val), resolveTroop (val)
    local v1 = u49[("%*%*"):format(a1, a3 or "")]
    if not v1 or a4 then
        v1 = resolveTroop(a1, a3)
        u49[("%*%*"):format(a1, a3 or "")] = v1
    end
    local v2 = v1
    if a2 and v1 then
        v2 = v1.Skins[a2]
    end
    return v2
end