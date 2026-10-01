-- Script path: ReplicatedStorage.Resources.UI.FFlag
-- Decompile time: 0.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FFlagController = require(ReplicatedStorage.Client.Modules.Universal.Compatibility.Controllers.FFlagController)
local Value = (require(ReplicatedStorage.Packages.Fusion)).Value
local u18 = {}
return function(a1, a2) -- Line: 11 -- upvalues: u18 (val), Value (val), FFlagController (val) -- types: a1: string
    if u18[a1] then
        return u18[a1]
    end
    local u8 = Value(a2)
    local v1 = FFlagController.resolve(a1)
    if v1 ~= nil then
        u8:set(v1)
    end
    FFlagController.Updated:Connect(function() -- Line: 23 -- upvalues: FFlagController (upval), a1 (val), a2 (val), u8 (val)
        local v1 = FFlagController.resolve(a1)
        if v1 == nil then
            v1 = a2
        end
        if v1 ~= u8:get(false) then
            u8:set(v1)
        end
    end)
    return u8
end