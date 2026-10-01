-- Script path: ReplicatedStorage.Resources.Universal.Asset.Handlers.NewTags
-- Decompile time: 0.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Nametag = require(ReplicatedStorage.Resources.Universal.Content)("Nametag")
local u13 = {}

local function WaitForDescendant(a1, a2) -- Line: 8 -- types: a1: userdata, a2: string
    local v1
    local v2, v3 = a2, a1
    repeat
        if not (v3:FindFirstChild(v2, true)) then
            v3.DescendantAdded:Wait()
        end
    until v1
    return v1
end

return function(a1) -- Line: 21 -- upvalues: u13 (val), WaitForDescendant (val), Nametag (val) -- types: a1: string
    local v1 = u13[a1]
    if v1 then
        return v1
    end
    local v2 = require((WaitForDescendant(Nametag, a1)))
    u13[a1] = v2
    return v2
end