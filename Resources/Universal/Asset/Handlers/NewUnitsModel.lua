-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.NewUnitsModel
-- Decompile time: 1.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Towers = game:GetService("SoundService"):WaitForChild("Towers")
local u24 = {}

local function resolveUnitModel(a1, a2) -- Line: 9
    -- upvalues: RunService (val), ServerStorage (val), ReplicatedStorage (val), Towers (val), u24 (val)
    local u71, v1
    local Units = if not RunService:IsServer() then (ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Units") else ServerStorage.Assets:WaitForChild("Units")
    if not RunService:IsServer() then
        v1 = Units:WaitForChild(a1):WaitForChild("Skins")
        u71 = v1:WaitForChild(a2, 0.2) or v1:WaitForChild("Default")
    else
        v1 = Units:FindFirstChild(a1):FindFirstChild("Skins")
        u71 = v1:FindFirstChild(a2) or v1:FindFirstChild("Default")
    end
    if not u71 then
        return
    end
    for i, j in u71:GetDescendants() do
        if j:IsA("Sound") then
            j.SoundGroup = Towers
        end
    end
    u71.Destroying:Connect(function() -- Line: 41 -- upvalues: u24 (upval), a1 (val), a2 (val), u71 (ref)
        if not u24[a1] then
            return
        end
        if u24[a1][a2] then
            local v1 = u24[a1][a2]
            if v1 == u71 then
                v1 = u24[a1]
                v1[a2] = nil
                return
            end
        end
    end)
    return u71
end

return function(a1, a2) -- Line: 56 -- upvalues: u24 (val), resolveUnitModel (val) -- types: a1: string, a2: string?
    local v1 = a2 or "Default"
    if not u24[a1] then
        u24[a1] = {}
    end
    if not u24[a1][v1] then
        local v2 = u24[a1]
        v2[v1] = (resolveUnitModel(a1, v1))
    end
    return u24[a1][v1]
end