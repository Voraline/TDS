-- Script path: ReplicatedStorage.Resources.Common.FastSignal
-- Decompile time: 0.31 ms

local v1 = false
local BindableEvent = Instance.new("BindableEvent")
local u5 = false
BindableEvent.Event:Connect(function() -- Line: 16 -- upvalues: u5 (ref)
    u5 = true
end)
BindableEvent:Fire()
BindableEvent:Destroy()
if not u5 then
    v1 = true
end
return v1 and require(script.Deferred) or require(script.Immediate)