-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.TroopsModel
-- Decompile time: 1.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local SoundService = game:GetService("SoundService")
local u22 = RunService:IsRunning()
local u25 = RunService:IsServer()
local Towers = SoundService:WaitForChild("Towers")
local u30 = {}

local function resolveTroopModel(a1, a2) -- Line: 12
    -- upvalues: u22 (val), u25 (val), ServerStorage (val), ReplicatedStorage (val), Towers (val), u30 (val)
    local u44 = (if not u22 then ServerStorage.Assets.DevTroops else u25 and ServerStorage.Assets:WaitForChild("Troops") or (ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Troops")):WaitForChild(a1):WaitForChild("Skins"):WaitForChild(
        a2,
        5
    )
    if not u44 then
        return
    end
    for i, j in u44:GetDescendants() do
        if j:IsA("Sound") then
            j.SoundGroup = Towers
        end
    end
    u44.Destroying:Connect(function() -- Line: 38 -- upvalues: u30 (upval), a1 (val), a2 (val), u44 (val)
        if not u30[a1] then
            return
        end
        if u30[a1][a2] then
            local v1 = u30[a1][a2]
            if v1 == u44 then
                v1 = u30[a1]
                v1[a2] = nil
                return
            end
        end
    end)
    return u44
end

return function(a1, a2) -- Line: 53 -- upvalues: u30 (val), resolveTroopModel (val) -- types: a1: string, a2: string?
    local v1 = a2 or "Default"
    if not u30[a1] then
        u30[a1] = {}
    end
    if not u30[a1][v1] then
        local v2 = u30[a1]
        v2[v1] = (resolveTroopModel(a1, v1))
    end
    return u30[a1][v1]
end