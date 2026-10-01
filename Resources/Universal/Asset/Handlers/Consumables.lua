-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.Consumables
-- Decompile time: 1.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Content = require(ReplicatedStorage.Resources.Universal.Content)
local table = require(ReplicatedStorage.Resources.Globals.table)
local u27 = RunService:IsServer()
local u28 = {}
local Consumables = Content("Consumables")
local Value = workspace.Type.Value
return function(a1) -- Line: 13
    -- upvalues: u28 (val), Consumables (val), Value (val), u27 (val), ServerStorage (val), table (val)
    local v1 = u28[a1]
    if v1 then
        return v1
    end
    local v2 = nil
    local v3 = nil
    local v4 = Consumables:WaitForChild(a1)
    assert(v4, (("Consumable \"%*\" does not exist in the Consumables folder."):format(a1)))
    assert(v4:IsA("Folder"), (("Consumable \"$%*\" is not a folder."):format(a1)))
    local Data = require(v4:WaitForChild("Data"))
    if Value ~= "Lobby" then
        if not u27 then
            local Animator = v4:FindFirstChild("Animator")
            v2 = Animator and require(Animator)
        else
            local v5 = (ServerStorage:WaitForChild("Animators")):WaitForChild("Consumables"):FindFirstChild(a1)
            v3 = v5 and require(v5)
        end
    end
    local v6 = table.merge({Name = a1, Controller = v3, Animator = v2}, Data)
    u28[a1] = v6
    return v6
end