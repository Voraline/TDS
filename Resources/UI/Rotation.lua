-- Script path: ReplicatedStorage.Resources.UI.Rotation
-- Decompile time: 0.54 ms

local Resources = game:GetService("ReplicatedStorage").Resources
local Value = (require(Resources.UI.Fusion)).Value
local Rotation = require(Resources.UI.Network).Channel("Rotation")
local u18 = {}
return function(a1) -- Line: 13 -- upvalues: u18 (val), Value (val), Rotation (val) -- types: a1: string
    if u18[a1] then
        return u18[a1]
    end
    local u7 = Value({})
    u18[a1] = u7
    task.spawn(function() -- Line: 21 -- upvalues: Rotation (upval), a1 (val), u7 (val)
        local v1
        while true do
            v1 = Rotation:InvokeServer("Request", a1)
            if not v1 then
                break
            end
            u7:set(v1.Data)
            task.wait(v1.Expires.UnixTimestamp - v1.Now.UnixTimestamp)
        end
    end)
    return u7
end