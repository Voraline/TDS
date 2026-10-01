-- Script path: ReplicatedStorage.Resources.Common.Standalone.Signal
-- Decompile time: 1.78 ms

local u0 = {}
u0.__index = u0

function u0.__tostring() -- Line: 3
    return "Signal"
end

local u2 = {}
u2.__index = u2

function u2.__tostring() -- Line: 24
    return "Connection"
end

function u2.new(a1) -- Line: 28 -- upvalues: u2 (val)
    return (setmetatable(a1, u2))
end

function u0.new(a1) -- Line: 32 -- upvalues: u0 (val)
    return (setmetatable({_active = true, logging = a1 == true, _functions = {}}, u0))
end

function u0:Connect(a2) -- Line: 42 -- upvalues: u2 (val)
    if self.logging == true then
        print("Signal connection made:\n", debug.traceback())
    end
    local v1 = debug.info(2, "n")
    if not v1 or v1 == "" then
        v1 = "anonymous"
    end
    local v2 = u2.new({Connected = true, _signal = self, _function = a2, _name = v1})
    self._functions[v2] = true
    return v2
end

function u2:Disconnect() -- Line: 64
    local _signal = self._signal
    if _signal then
        local _functions = _signal._functions
        if _functions[self] then
            _functions[self] = nil
            self._signal = nil
        end
    end
    self.Connected = false
end

function u0.Fire(a1, ...) -- Line: 78
    local v1 = table.clone(a1._functions)
    local v2 = nil
    local v3 = nil
    for i in v1, v2, v3 do
        if a1.logging then
            print("Signal fired:\n", debug.traceback())
        end
        if i.Connected then
            local _function = i._function
            local _name = i._name
            task.spawn(function(...) -- Line: 93 -- upvalues: _name (val), _function (val)
                debug.profilebegin(_name)
                _function(...)
            end, ...)
        end
    end
end

function u0.Once(a1, a2) -- Line: 100
    local u2 = nil
    local u3 = false
    u2 = (a1:Connect(function(...) -- Line: 103 -- upvalues: u3 (ref), u2 (ref), a2 (val)
        if u3 then
            return
        end
        u3 = true
        u2:Disconnect()
        a2(...)
    end))
    return u2
end

function u0.Wait(a1) -- Line: 116
    local u2 = coroutine.running()
    local u3 = nil
    local v1 = a1:Connect(function(...) -- Line: 120 -- upvalues: u3 (ref), u2 (val)
        u3:Disconnect()
        coroutine.resume(u2, ...)
    end)
    return (coroutine.yield())
end

function u0.Destroy(a1) -- Line: 128
    for i in a1._functions do
        i:Disconnect()
    end
end

return u0