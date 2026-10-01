-- Script path: ReplicatedStorage.Resources.Universal.Raycast
-- Decompile time: 1.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
require(ReplicatedStorage.Resources.Globals.math)
local table = require(ReplicatedStorage.Resources.Globals.table)
local CurrentCamera = workspace.CurrentCamera
local u22 = {}
u22.All = workspace.FindPartOnRay
u22.Whitelist = workspace.FindPartOnRayWithWhitelist
u22.Blacklist = workspace.FindPartOnRayWithIgnoreList
local u29 = {}
u29.__index = u29

function u29.new(a1, a2) -- Line: 19 -- upvalues: u29 (val)
    return (setmetatable({Mode = a1 or "All", List = a2 or {}}, u29))
end

function u29:Cast(a2) -- Line: 26 -- upvalues: u22 (val)
    local v1, v2, v3, v4
    local v5 = u22[self.Mode]
    if v5 ~= u22.All then
        v2, v3, v4, v1 = v5(workspace, a2, self.List)
    else
        v2, v3, v4, v1 = v5(workspace, a2)
    end
    return {Hit = v2, Position = v3, Normal = v4, Material = v1}
end

function u29.CastMouse(a1, a2) -- Line: 44 -- upvalues: UserInputService (val), CurrentCamera (val)
    local MouseLocation = UserInputService:GetMouseLocation()
    local v1 = CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
    return a1:Cast((Ray.new(v1.Origin, v1.Direction * (a2 or 500))))
end

function u29.Add(a1, a2) -- Line: 53 -- upvalues: table (val)
    table.insert(a1.List, a2)
end

function u29.Remove(a1, a2) -- Line: 57 -- upvalues: table (val)
    table.pull(a1.List, a2)
end

function u29.Clear(a1) -- Line: 61
    a1.List = {}
end

return u29