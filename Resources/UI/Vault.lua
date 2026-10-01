-- Script path: ReplicatedStorage.Resources.UI.Vault
-- Decompile time: 4.13 ms

local deepCompare, deepCopy
local Value = (require(game.ReplicatedStorage.Resources.UI.Fusion)).Value
local u8 = {}
u8.__index = u8

function u8.new(...) -- Line: 20 -- upvalues: u8 (val)
    local v1 = setmetatable({}, u8)
    v1:init(...)
    return v1
end

function deepCopy(a1) -- Line: 26 -- upvalues: deepCopy (val)
    local v1 = {}
    for k, v in pairs(a1) do
        if type(v) ~= "table" then
            v1[k] = v
        else
            v1[k] = (deepCopy(v))
        end
    end
    return v1
end

function deepCompare(a1, a2) -- Line: 38 -- upvalues: deepCompare (val)
    if #a1 ~= #a2 then
        return false
    end
    local v1 = a2
    for k, v in pairs(a1) do
        if type(v) ~= "table" then
            if v ~= v1[k] then
                return false
            end
        elseif not deepCompare(v, v1[k]) then
            return false
        end
    end
    return true
end

local function apply(a1, a2) -- Line: 57
    for k, v in pairs(a2) do
        a1[k] = v
    end
end

local function bind(a1, a2) -- Line: 63
    local u9 = assert(a1[a2], (("bind: no property %s"):format(a2)))
    local v1 = ("bind: %s is not a function"):format(a2)
    assert(type(u9) == "function", v1)
    return function(...) -- Line: 66 -- upvalues: u9 (val), a1 (val)
        u9(a1, ...)
    end
end

local function readWrite(a1) -- Line: 71 -- upvalues: Value (val)
    local u1 = {}

    local function readValue(a1_2) -- Line: 74 -- upvalues: u1 (val), Value (upval), a1 (val)
        local v1 = u1[a1_2]
        if v1 then
            return v1
        end
        v1 = Value(a1[a1_2])
        u1[a1_2] = v1
        return v1
    end

    for k, v in pairs(a1) do
        u1[k] = (Value(v))
    end
    local v1 = {
        __index = function(a1_2, a2) -- Line: 91 -- upvalues: u1 (val), Value (upval), a1 (val)
            local v1 = u1[a2]
            if v1 then
                return v1
            end
            v1 = Value(a1[a2])
            u1[a2] = v1
            return v1
        end,
        __newindex = function(a1, a2) -- Line: 94
            error(("state: attempted to write to key %s"):format(a2))
        end,
    }
    local v2 = setmetatable({}, v1)
    local v3 = {
        __index = function(a1_2, a2) -- Line: 99 -- upvalues: u1 (val), Value (upval), a1 (val)
            local v1 = u1[a2]
            if v1 then
                return v1
            end
            v1 = Value(a1[a2])
            u1[a2] = v1
            return v1
        end,
        __newindex = function(a1, a2, a3) -- Line: 102
            a1[a2]:set(a3, true)
        end,
    }
    return v2, (setmetatable({}, v3))
end

function u8:init(a2) -- Line: 109
    assert(a2, "vault: no options given")
    assert(type(a2) == "table", "vault: options must be an object")
    for k, v in pairs({_initialized = false, _strict = true, _mutations = {}, _actions = {}}) do
        self[k] = v
    end
    if a2.strict ~= nil then
        assert(type(a2.strict) == "boolean", "vault: strict must be a boolean")
        self._strict = a2.strict
    end
    for k2, i in pairs(a2) do
        if k2 == "state" then
            self:_setState(i)
        elseif k2 == "mutations" then
            self:_addMutations(i)
        elseif k2 ~= "actions" then
            error(("unknown options property: %s"):format(k2))
        else
            self:_addActions(i)
        end
    end
    if not self._state then
        self:_setState({})
    end
    self._initialized = true
end

function u8:_setState(a2) -- Line: 145 -- upvalues: readWrite (val)
    assert(type(a2) == "table", "vault: state must be an object")
    local v1, v2 = readWrite(a2)
    self._writer = v2
    self._state = a2
    self.state = v1
    if not table.isfrozen(a2) then
        table.freeze(a2)
    end
end

function u8:_addMutation(a2, a3) -- Line: 163
    assert(not self._initialized, (("vault: attempt to add mutation %s after initialization"):format(a2)))
    if self._mutations[a2] then
        error(("vault: attempt to add duplicate mutation %s"):format(a2))
    end
    self._mutations[a2] = a3
end

function u8:_addMutations(a2) -- Line: 176
    assert(type(a2) == "table", "vault: mutations must be an object")
    for k, v in pairs(a2) do
        self:_addMutation(k, v)
    end
end

function u8.commit(a1, a2, a3) -- Line: 183 -- upvalues: deepCopy (val), deepCompare (val)
    local v1, v2
    if type(a2) == "table" then
        a3 = a2
        a2 = assert(a3.type, "vault: commit has no 'type' property!")
        a3.type = nil
    end
    assert(a2, "vault: no mutation name passed to commit")
    local v3 = a1._mutations[a2]
    assert(v3, (("vault: no mutation named %s"):format(a2)))
    local v4 = deepCopy(a1._state)
    local v5 = v3(v4, a3)
    for k, v in pairs(a1._state) do
        if v4[k] == nil then
            a1._writer[k] = nil
        end
    end
    local v6 = a1
    for k2, i in pairs(v4) do
        v1 = v6._state[k2]
        v2 = true
        if v1 == i then
            v2 = false
            if type(i) == "table" then
                v2 = not deepCompare(i, v1)
            end
        end
        if v2 then
            v6._writer[k2] = i
        end
    end
    table.freeze(v4)
    v6._state = v4
    return v5
end

function u8:_addAction(a2, a3) -- Line: 222
    assert(not self._initialized, (("vault: attempt to add action %s after initialization"):format(a2)))
    if self._actions[a2] then
        error(("vault: attempt to add duplicate action %s"):format(a2))
    end
    self._actions[a2] = a3
end

function u8:_addActions(a2) -- Line: 235
    assert(type(a2) == "table", "vault: actions must be an object")
    for k, v in pairs(a2) do
        self:_addAction(k, v)
    end
end

function u8.dispatch(a1, a2, a3) -- Line: 242 -- upvalues: bind (val)
    if type(a2) == "table" then
        a3 = a2
        a2 = assert(a3.type, "vault: action has no 'type' property!")
        a3.type = nil
    end
    assert(a2, "vault: no action name passed to dispatch")
    local v1 = a1._actions[a2]
    assert(v1, (("vault: no action named %s"):format(a2)))
    return v1({state = a1.state, commit = bind(a1, "commit"), dispatch = bind(a1, "dispatch")}, a3)
end

return u8