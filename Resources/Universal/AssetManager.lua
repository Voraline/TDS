-- Script path: ReplicatedStorage.Resources.Universal.AssetManager
-- Decompile time: 5.35 ms

local InsertService = game:GetService("InsertService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local GameType = require(ReplicatedStorage.Resources.Universal.GameType)
local SharedGameConstants = require(ReplicatedStorage.Resources.Universal.SharedGameConstants)
local BoneUtil = require(ReplicatedStorage.Resources.Universal.BoneUtil)
local Promise = require(ReplicatedStorage.Resources.Common.Promise)
local v1 = {}

local function streamAssetsSync(a1, a2, a3) -- Line: 18
    -- upvalues: InsertService (val), ServerStorage (val), ReplicatedStorage (val)
    local Assets_2, Folder_2, Folder_3, Skins, v1, v2, v3, v4, v5, v6
    local Folder = if not a1 then Instance.new("Folder") else (InsertService:LoadAsset(a1)):WaitForChild(a2)
    local v7 = ServerStorage.Assets:FindFirstChild((("Dev%*"):format(a2)))
    if not a1 then
        Folder.Name = a2
    end
    local v8 = {}
    if not v7 then
        v1, v6 = a2, a3
    else
        local v9
        v1, v6 = a2, a3
        for i, j in v7:GetChildren() do
            v8[j.Name] = {}
            v2 = false
            for k, n in j:GetChildren() do
                if n.Name == "Skins" then
                    v2 = true
                    for m, i5 in n:GetChildren() do
                        v9 = v8[j.Name]
                        v9[i5.Name] = i5
                    end
                end
            end
            if not v2 then
                v8[j.Name] = j
            end
        end
    end
    local v10 = nil
    local v11 = nil
    for i6, i7 in v8, v10, v11 do
        if typeof(i7) ~= "table" then
            v2 = Folder:FindFirstChild(i6)
            if v2 then
                v2:Destroy()
            end
            i7.Parent = Folder
        else
            v3 = nil
            v4 = nil
            for i8, i9 in i7, v3, v4 do
                Skins = Folder:FindFirstChild(i6) and Folder[i6]:FindFirstChild("Skins") or nil
                if not Skins then
                    Folder_2 = Instance.new("Folder")
                    Folder_2.Name = i6
                    Folder_3 = Instance.new("Folder")
                    Folder_3.Name = "Skins"
                    Folder_3.Parent = Folder_2
                    Folder_2.Parent = Folder
                    Skins = Folder_3
                end
                v5 = Skins:FindFirstChild(i8)
                if v5 then
                    v5:Destroy()
                end
                i9.Parent = Skins
            end
        end
    end
    if v7 then
        v7:Destroy()
    end
    if Folder:FindFirstChild("PackageLink") then
        Folder.PackageLink:Destroy()
    end
    v10 = (if not v6 then ServerStorage.Assets else ReplicatedStorage.Assets):FindFirstChild(v1)
    if v10 then
        v10:Destroy()
    end
    Folder.Parent = Assets_2
end

local function streamAssetsAsync(a1, a2, a3) -- Line: 102
    -- upvalues: Promise (val), streamAssetsSync (val)
    return Promise.promisify(function() -- Line: 103 -- upvalues: streamAssetsSync (upval), a1 (val), a2 (val), a3 (val)
        streamAssetsSync(a1, a2, a3)
    end)()
end

local function streamMaterialsAsync(a1) -- Line: 110
    -- upvalues: Promise (val), InsertService (val)
    return Promise.new(function(a1_2) -- Line: 111 -- upvalues: InsertService (upval), a1 (val)
        local CustomMaterials = (InsertService:LoadAsset(a1)):WaitForChild("CustomMaterials")
        CustomMaterials.Parent = game:GetService("MaterialService")
        a1_2()
    end)
end

function v1.init(a1) -- Line: 118
    -- upvalues: RunService (val), streamAssetsAsync (val), streamAssetsSync (val), SharedGameConstants (val)
    -- upvalues: GameType (val), streamMaterialsAsync (val), ServerStorage (val), BoneUtil (val), Promise (val)
    local v1
    if RunService:IsClient() then
        return
    end
    local v2 = streamAssetsAsync or streamAssetsSync
    local v3 = {}
    local v4 = v2(SharedGameConstants.TROOPS_PACKAGE_ID, "Troops")
    local v5 = v2(SharedGameConstants.UNITS_PACKAGE_ID, "Units")
    local v6 = v2(SharedGameConstants.CRATES_PACKAGE_ID, "Crates", true)
    local v7 = v2(SharedGameConstants.LEGACY_ENEMIES_PACKAGE_ID, "LegacyEnemies")
    local v8 = v2(SharedGameConstants.ENEMIES_PACKAGE_ID, "Enemies")
    if not GameType:IsA("Game") then
        v1 = nil
    else
        local v9 = {v2(nil, "Maps"), (streamMaterialsAsync(SharedGameConstants.MATERIALS_PACKAGE_ID))}
        v1 = unpack(v9)
    end
    v3[1] = v4
    v3[2] = v5
    v3[3] = v6
    v3[4] = v7
    v3[5] = v8
    v3[6] = v1
    task.spawn(function() -- Line: 140 -- upvalues: ServerStorage (upval)
        local v1 = {"Troops", "Units", "Enemies", "LegacyEnemies"}
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            for k, n in ServerStorage.Assets:WaitForChild(j):GetDescendants() do
                if n:IsA("BasePart") then
                    n.CollisionGroup = "Players"
                end
            end
        end
    end)
    task.spawn(function() -- Line: 151 -- upvalues: ServerStorage (upval), BoneUtil (upval)
        local RootPart, v1
        for i, j in ServerStorage.Assets:WaitForChild("Troops"):GetChildren() do
            for k, n in j.Skins:GetChildren() do
                RootPart = n:FindFirstChild("RootPart") or n.PrimaryPart
                if RootPart and RootPart:FindFirstChildOfClass("Bone") then
                    v1 = BoneUtil.mapBoneVFXToParts(RootPart, true)
                    if #v1:GetChildren() ~= 0 then
                        v1.Name = "BoneVFX"
                        v1.Parent = n
                    else
                        v1:Destroy()
                    end
                end
            end
        end
    end)
    Promise.all(v3):catch(function(a1) -- Line: 176
        warn("Error streaming assets", a1)
    end)
end

v1:init()
return v1