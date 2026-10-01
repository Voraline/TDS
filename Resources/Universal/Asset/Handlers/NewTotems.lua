-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.NewTotems
-- Decompile time: 0.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Totem = require(ReplicatedStorage.Resources.Universal.Content)("Totem")
local Totems = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Totems")
local u21 = {}
return function(a1) -- Line: 11 -- upvalues: u21 (val), Totem (val), Totems (val) -- types: a1: string
    local v1 = u21[a1]
    if v1 then
        return v1
    end
    local v2 = require(Totem:WaitForChild(a1))
    v2.Model = Totems:WaitForChild(a1)
    u21[a1] = v2
    return v2
end