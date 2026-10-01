-- Script path: ReplicatedStorage.Resources.UI.Components.ScreenQuery
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Value = require(ReplicatedStorage.Resources.UI.Fusion).Value
local MediaQuery = require(script.Parent.MediaQuery)
local u18 = Value(false)
local u21 = Value(Vector2.zero)
local u23 = Value()
MediaQuery(function(a1, a2) -- Line: 13 -- upvalues: u18 (val), u21 (val), u23 (val)
    u18:set(a1.X <= 1200)
    u21:set(a1)
    u23:set(a2)
end)
return {IsMobile = u18, ScreenSize = u21, DeviceType = u23}