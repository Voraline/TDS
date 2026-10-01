-- Script path: ReplicatedStorage.Resources.Common.Emitter
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Signal = require(ReplicatedStorage.Resources.Common.Standalone.Signal)
local u11 = {}
u11.__index = u11

function u11.new() -- Line: 8 -- upvalues: u11 (val)
    return (setmetatable({Events = {}}, u11))
end

function u11:Get(a2) -- Line: 14 -- upvalues: Signal (val)
    if not self.Events[a2] then
        self.Events[a2] = (Signal.new())
    end
    return self.Events[a2]
end

function u11.On(a1, a2, a3) -- Line: 22
    return (a1:Get(a2)):Connect(a3)
end

function u11.Emit(a1, a2, ...) -- Line: 26
    (a1:Get(a2)):Fire(...)
end

return u11