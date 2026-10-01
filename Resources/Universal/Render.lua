-- Script path: ReplicatedStorage.Resources.Universal.Render
-- Decompile time: 0.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Scheduler = require(ReplicatedStorage.Resources.Scheduler)
local RenderStepped = if not RunService:IsClient() then RunService.Stepped else RunService.RenderStepped
local u19 = {}
local u20 = 0

local function getId() -- Line: 16 -- upvalues: u20 (ref)
    u20 = u20 + 1
    return string.format("%02x", u20)
end

return {
    Add = function(a1, a2, a3, a4) -- Line: 31 -- upvalues: u20 (ref), u19 (val), Scheduler (val), RenderStepped (val)
        local v1 = a2
        if not v1 then
            u20 = u20 + 1
            v1 = string.format("%02x", u20)
        end
        local v2 = v1
        if u19[v2] then
            u19[v2]()
            u19[v2] = nil
        end
        u19[v2] = (Scheduler.add(("Render_%*"):format(v2), RenderStepped, a4))
        return v2
    end,
    Remove = function(a1, a2) -- Line: 21 -- upvalues: u19 (val)
        if not u19[a2] then
            return
        end
        u19[a2]()
        u19[a2] = nil
        return true
    end,
}