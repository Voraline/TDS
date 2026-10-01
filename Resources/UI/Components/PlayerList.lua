-- Script path: ReplicatedStorage.Resources.UI.Components.PlayerList
-- Decompile time: 2.25 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local Value = require(ReplicatedStorage.Resources.UI.Fusion).Value
local u24 = Value({})
local u27 = Value({})
local u30 = Value({})
local v1 = {}
u27:set(v1)
for i, v in ipairs(Players:GetPlayers()) do
    table.insert(v1, v)
end
pcall(function() -- Line: 21 -- upvalues: StarterGui (val), u30 (val)
    (StarterGui:GetCore("PlayerBlockedEvent")).Event:Connect(function(a1) -- Line: 22 -- upvalues: u30 (upval)
        local v1 = u30:get()
        if not table.find(v1, a1) then
            table.insert(v1, a1)
            u30:set(v1)
        end
    end)
    ;(StarterGui:GetCore("PlayerUnblockedEvent")).Event:Connect(function(a1) -- Line: 30 -- upvalues: u30 (upval)
        local v1 = u30:get()
        local v2 = table.find(v1, a1)
        if v2 then
            table.remove(v1, v2)
            u30:set(v1)
        end
    end)
end)
pcall(function() -- Line: 42 -- upvalues: StarterGui (val), u24 (val)
    (StarterGui:GetCore("PlayerFriendedEvent")).Event:Connect(function(a1) -- Line: 43 -- upvalues: u24 (upval)
        local v1 = u24:get()
        if not table.find(v1, a1) then
            table.insert(v1, a1)
            u24:set(v1)
        end
    end)
    ;(StarterGui:GetCore("PlayerUnfriendedEvent")).Event:Connect(function(a1) -- Line: 51 -- upvalues: u24 (upval)
        local v1 = u24:get()
        local v2 = table.find(v1, a1)
        if v2 then
            table.remove(v1, v2)
            u24:set(v1)
        end
    end)
end)

local function addPlayer(a1) -- Line: 62
    -- upvalues: u27 (val), u24 (val), u30 (val), LocalPlayer (val), StarterGui (val)
    local v1 = u27:get()
    local u8 = u24:get()
    local u12 = u30:get()
    table.insert(v1, a1)
    u27:set(v1)
    pcall(function() -- Line: 70 -- upvalues: a1 (val), LocalPlayer (upval), u8 (val), u24 (upval)
        if a1 ~= LocalPlayer and a1:IsFriendsWith(LocalPlayer.UserId) then
            table.insert(u8, a1)
            u24:set(u8)
        end
    end)
    pcall(function() -- Line: 77 -- upvalues: StarterGui (upval), a1 (val), u12 (val), u30 (upval)
        if table.find(StarterGui:GetCore("GetBlockedUserIds"), a1.UserId) then
            table.insert(u12, a1)
            u30:set(u12)
        end
    end)
end

for i2, j in Players:GetPlayers() do
    task.spawn(addPlayer, j)
end
Players.PlayerAdded:Connect(addPlayer)
Players.PlayerRemoving:Connect(function(a1) -- Line: 91 -- upvalues: u27 (val), u24 (val), u30 (val)
    local v1 = u27:get()
    local v2 = u24:get()
    local v3 = u30:get()
    local v4 = table.find(v1, a1)
    local v5 = table.find(v2, a1)
    local v6 = table.find(v3, a1)
    if v4 then
        table.remove(v1, v4)
        u27:set(v1)
    end
    if v5 then
        table.remove(v2, v5)
        u24:set(v2)
    end
    if v6 then
        table.remove(v3, v6)
        u30:set(v3)
    end
end)
return {Players = u27, Friends = u24, Blocked = u30}