-- Script path: ReplicatedStorage.Resources.Universal.LightingUtil
-- Decompile time: 1.01 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Resources.Common.Standalone.Create)
local Stores = require(ReplicatedStorage.Client.Interfaces.Stores)
local TweenService = require(ReplicatedStorage.Client.Modules.Universal.Modules.TweenService)
return {
    getColorCorrection = function() -- Line: 21 -- upvalues: Create (val), Lighting (val), TweenService (val)
        local v1 = {}
        local ColorCorrectionEffect = Create("ColorCorrectionEffect")
        ColorCorrectionEffect.Name = "CustomColorCorrection"
        ColorCorrectionEffect.Parent = Lighting

        function v1.animate(a1, a2) -- Line: 27 -- upvalues: TweenService (upval), ColorCorrectionEffect (val)
            TweenService:Create(ColorCorrectionEffect, a2.tweenInfo, {
                Brightness = a2.brightness,
                Contrast = a2.contrast,
                Saturation = a2.saturation,
                TintColor = a2.tintColor,
            }):Play()
        end

        function v1.update(a1, a2) -- Line: 36 -- upvalues: ColorCorrectionEffect (val) -- types: a1: table, a2: table
            for i, j in {
                Brightness = a2.brightness,
                Contrast = a2.contrast,
                Saturation = a2.saturation,
                TintColor = a2.tintColor,
            } do
                ColorCorrectionEffect[i] = j
            end
        end

        function v1.destroy(a1) -- Line: 49 -- upvalues: ColorCorrectionEffect (val)
            ColorCorrectionEffect:Destroy()
        end

        return v1
    end,
    animateVignette = function(a1) -- Line: 56 -- upvalues: Stores (val) -- types: a1: table
        Stores.VignetteStore.store:dispatch({
            type = "setAnimationData",
            transparency = a1.transparency,
            tweenInfo = a1.tweenInfo,
            color = a1.color,
        })
    end,
    clearVignette = function(a1) -- Line: 65 -- upvalues: Stores (val) -- types: a1: userdata?
        local v1 = {
            transparency = 1,
            color = Color3.new(0, 0, 0),
            tweenInfo = a1 or TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        }
        Stores.VignetteStore.store:dispatch({
            type = "setAnimationData",
            transparency = v1.transparency,
            tweenInfo = v1.tweenInfo,
            color = v1.color,
        })
    end,
}