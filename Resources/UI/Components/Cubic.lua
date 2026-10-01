-- Script path: ReplicatedStorage.Resources.UI.Components.Cubic
-- Decompile time: 1.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Resources = ReplicatedStorage.Resources
local Bezier = require(Resources.Common.Tween.Bezier)
local Fusion = require(Resources.UI.Fusion)
require(Resources.UI.Fusion.PubTypes)
local u31 = require(Resources.UI.Fusion.Animation.packType)
local unpackType = require(Resources.UI.Fusion.Animation.unpackType)
local State = Fusion.State
local Observer = Fusion.Observer
local u40 = {}

local function tweenType(a1, a2, a3) -- Line: 25 -- upvalues: unpackType (val), u31 (val) -- types: a3: number
    local v1 = typeof(a1)
    assert(v1 == typeof(a2), "Start and end goals must be of the same type")
    local v2 = unpackType(a1, v1)
    local v3 = unpackType(a2, v1)
    local v4 = {}
    for i, v in ipairs(v2) do
        v4[i] = v + ((v3[i] or v2) - v) * a3
    end
    return u31(v4, v1)
end

RunService:BindToRenderStep("UPDATE_CURVES", Enum.RenderPriority.First.Value, function(a1) -- Line: 49 -- upvalues: u40 (val), tweenType (val) -- types: a1: number
    local duration, endValue, startValue, v1, v2
    for k, v in pairs(u40) do
        startValue = v.startValue
        endValue = v.endValue
        duration = v.duration
        v1 = math.clamp(((tick()) - v.delta) / duration, 0, 1)
        if v1 == 1 then
            u40[k] = nil
        end
        v2 = tweenType(startValue, endValue, (v.bezier(v1)))
        k:set(v2)
    end
end)
return function(a1, a2, a3) -- Line: 65
    -- upvalues: Bezier (val), State (val), Observer (val), u40 (val)
    local u13 = Bezier.new(a3.x1, a3.y1, a3.x2, a3.y2)
    local u19 = State(a1:get(false))
    return u19, (Observer(a1)):onChange(function() -- Line: 76 -- upvalues: a1 (val), u19 (val), u40 (upval), a2 (val), u13 (val)
        local v1 = a1:get(false)
        local v2 = u19:get(false)
        if v1 == v2 then
            return
        end
        u40[v2] = {
            startValue = v2,
            endValue = v1,
            duration = a2,
            delta = tick(),
            bezier = u13,
        }
    end)
end