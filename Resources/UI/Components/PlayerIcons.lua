-- Script path: ReplicatedStorage.Resources.UI.Components.PlayerIcons
-- Decompile time: 0.84 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Value = (require(ReplicatedStorage.Resources.UI.Fusion)).Value

local function getIcon(a1, a2) -- Line: 7 -- upvalues: Players (val)
    a2:set((Players:GetUserThumbnailAsync(a1.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)))
end

local v1 = {
    __index = function(a1, a2) -- Line: 17 -- upvalues: Value (val), getIcon (val)
        if a2 and typeof(a2) == "Instance" and a2:IsA("Player") then
            local v1 = Value("")
            rawset(a1, a2, v1)
            task.spawn(getIcon, a2, v1)
            return v1
        end
        return error("Expected a Player instance")
    end,
}
local u21 = setmetatable({}, v1)
Players.PlayerRemoving:Connect(function(a1) -- Line: 30 -- upvalues: u21 (val)
    rawset(u21, a1, nil)
end)
return u21