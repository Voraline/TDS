-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.NewEmotes
-- Decompile time: 3.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local SoundService = game:GetService("SoundService")
local u22 = RunService:IsServer()
local Content = require(ReplicatedStorage.Resources.Universal.Content)
local Create = require(ReplicatedStorage.Resources.Common.Standalone.Create)
local Enum = require(ReplicatedStorage.Resources.Universal.Enum)
local table = require(ReplicatedStorage.Resources.Globals.table)
local Emote = Content("Emote")
local u47 = {}
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Emotes = Assets:WaitForChild("Emotes")
local Client = (Assets:WaitForChild("Effects")):WaitForChild("Client")
local Emotes_2 = SoundService:WaitForChild("Emotes")
return function(a1) -- Line: 21
    -- upvalues: u47 (val), Emote (val), Emotes (val), u22 (val), ServerStorage (val), Create (val), Enum (val)
    -- upvalues: Emotes_2 (val), Client (val), table (val)
    if a1 == "XmasGift" then
        a1 = "Gift"
    end
    local v1 = u47[a1]
    if v1 then
        return v1
    end
    local v2 = nil
    local v3 = nil
    local v4 = Emote:FindFirstChild(a1)
    local u22_2 = v4
    if u22_2 then
        u22_2 = Emotes:WaitForChild(a1, 1)
    end
    if v4 and u22_2 then
        local v5, v6
        local Children = u22_2:FindFirstChild("Accessories") and u22_2.Accessories:GetChildren() or {}
        if not v4:IsA("Folder") then
            local Effects_2 = u22_2:FindFirstChild("Effects")
            v5 = require(v4)
            v6 = Effects_2 and require(Effects_2)
        else
            v5 = require(v4:WaitForChild("Data"))
            local Effects = v4:FindFirstChild("Effects")
            v6 = Effects and require(Effects)
            if not u22 then
                local Animator = v4:FindFirstChild("Animator")
                v2 = Animator and require(Animator)
            else
                local v7 = a1
                local v8 = ((ServerStorage:WaitForChild("Animators")):WaitForChild("Emotes")):FindFirstChild(v7)
                v3 = v8 and require(v8)
            end
        end
        local AnimationId = if v5.Track then Create("Animation", {AnimationId = ("rbxassetid://%*"):format(v5.Track or v5.AnimationId)}) else v5.AnimationId and Create("Animation", {AnimationId = ("rbxassetid://%*"):format(v5.Track or v5.AnimationId)})
        local v9 = v5.Interaction or Enum.EmoteInteractType.None
        task.defer(function() -- Line: 81 -- upvalues: u22_2 (val), Emotes_2 (upval), a1 (ref), Client (upval)
            for i, v in ipairs(u22_2:GetDescendants()) do
                if v:IsA("Sound") then
                    v.SoundGroup = Emotes_2
                end
            end
            if a1 == "Firework" then
                for i2, i3 in ipairs((Client:WaitForChild("Firework")):GetDescendants()) do
                    if i3:IsA("Sound") then
                        i3.SoundGroup = Emotes_2
                    end
                end
            end
        end)
        local merge = table.merge
        local v10 = {
            Name = a1,
            Track = AnimationId,
            Interaction = v9,
            Accessories = Children,
            WalkSpeed = v5.WalkSpeed or 0,
            JumpPower = v5.JumpPower or 0,
        }
        local SoundId = v5.SoundId or v5.Sound
        v10.Sound = SoundId
        local Rarity = v5.Rarity or Enum.SkinRarity.Common
        v10.Rarity = Rarity
        local Category = v5.Category or Enum.TowerCategory.Starter
        v10.Category = Category
        v10.Controller = v3
        v10.Animator = v2
        v10.Effects = v6
        local v11 = merge(v10, v5)
        u47[a1] = v11
        return v11
    end
    return nil
end