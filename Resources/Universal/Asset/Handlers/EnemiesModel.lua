-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.EnemiesModel
-- Decompile time: 0.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local SoundService = game:GetService("SoundService")
local u22 = RunService:IsRunning()
local u25 = RunService:IsServer()
local Enemies = SoundService:WaitForChild("Enemies")
local u30 = {}

local function resolveEnemyModel(a1, a2) -- Line: 12
    -- upvalues: u22 (val), u25 (val), ServerStorage (val), ReplicatedStorage (val), Enemies (val), u30 (val)
    local v1 = if not a2 then "NewEnemies" else "Enemies"
    local u43 = (if not u22 then ServerStorage.Assets[("Dev%*"):format(v1)] else u25 and ServerStorage.Assets:WaitForChild(v1) or (ReplicatedStorage:WaitForChild("Assets")):WaitForChild(v1)):WaitForChild(
        a1,
        5
    )
    if not u43 then
        return
    end
    for i, j in u43:GetDescendants() do
        if j:IsA("Sound") then
            j.SoundGroup = Enemies
        end
    end
    u43.Destroying:Connect(function() -- Line: 36 -- upvalues: u30 (upval), a1 (val), u43 (val)
        if u30[a1] and u30[a1] == u43 then
            u30[a1] = nil
            return
        end
    end)
    return u43
end

return function(a1, a2) -- Line: 47 -- upvalues: u30 (val), resolveEnemyModel (val) -- types: a1: string, a2: boolean?
    local v1 = a2 == true
    if not u30[a1] then
        u30[a1] = (resolveEnemyModel(a1, v1))
    end
    return u30[a1]
end