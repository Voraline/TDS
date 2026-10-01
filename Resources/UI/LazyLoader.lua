-- Script path: ReplicatedStorage.Resources.UI.LazyLoader
-- Decompile time: 2.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Resources.UI.Fusion)
local u10 = {}
u10.__index = u10

function u10.new(a1) -- Line: 8 -- upvalues: Fusion (val), u10 (val)
    local init = a1
    if init then
        init = a1.init
    end
    return (setmetatable({
        _loading = false,
        _load = function(a1_2) -- Line: 11 -- upvalues: init (val), a1 (val)
            if init then
                init(a1, a1_2)
                return
            end
            a1_2()
        end,
        _loaded = Fusion.Value(false),
        _initialized = not init,
        _awaiters = {},
        _object = a1,
    }, u10))
end

function u10:isInitialized() -- Line: 29
    return self._initialized
end

function u10:isLoaded() -- Line: 33
    return not self._loading and self._initialized
end

function u10:resolve() -- Line: 37
    local _awaiters = self._awaiters
    self._awaiters = {}
    for i, j in _awaiters do
        coroutine.resume(j)
    end
end

function u10:await() -- Line: 46
    if not self._loaded:get(false) then
        table.insert(self._awaiters, (coroutine.running()))
        coroutine.yield()
    end
end

function u10:load() -- Line: 53
    if not self._loading and not self._initialized then
        self._loading = true
        self._load(function() -- Line: 63 -- upvalues: self (val)
            if self._initialized then
                return nil
            end
            self._initialized = true
            self._loading = false
            self._loaded:set(true)
            task.spawn(function() -- Line: 72 -- upvalues: self (upval)
                self:resolve()
            end)
        end)
        return
    end
    return nil
end

function u10:get() -- Line: 78
    if not self:isInitialized() then
        self:load()
    end
    if not self:isLoaded() then
        self:await()
    end
    return self._object
end

return function(a1) -- Line: 90 -- upvalues: u10 (val)
    local u4 = u10.new(a1)
    return (setmetatable({}, {
        __index = function(a1, a2) -- Line: 94 -- upvalues: u4 (val)
            if a2 == "LazyLoaded" then
                return u4._loaded
            end
            if a2 == "init" then
                return function() -- Line: 98 -- upvalues: u4 (upval)
                    return u4:get()
                end
            end
            return u4._object[a2]
        end,
        __newindex = function(a1, a2, a3) -- Line: 106 -- upvalues: u4 (val)
            u4._object[a2] = a3
        end,
    }))
end