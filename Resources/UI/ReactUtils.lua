-- Script path: ReplicatedStorage.Resources.UI.ReactUtils
-- Decompile time: 0.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Resources.UI.React)
require(ReplicatedStorage.Resources.UI.ReactTypes)
return {
    isBinding = function(a1) -- Line: 9
        local v1 = false
        if type(a1) == "table" then
            v1 = a1.getValue ~= nil
        end
        return v1
    end,
    mapMultiple = function(a1, a2) -- Line: 21 -- upvalues: React (val) -- types: a1: table, a2: function
        local v1 = a1[1]
        local v2 = false
        if type(v1) == "table" then
            v2 = v1.getValue ~= nil
        end
        if v2 then
            return (React.joinBindings(a1)):map(function(a1) -- Line: 23 -- upvalues: a2 (val)
                return a2(unpack(a1))
            end)
        end
        return a2(unpack(a1))
    end,
    map = function(self, a2) -- Line: 13 -- types: a2: function
        local v1 = false
        if type(self) == "table" then
            v1 = self.getValue ~= nil
        end
        if v1 then
            return (self:map(a2))
        end
        return a2(self)
    end,
}