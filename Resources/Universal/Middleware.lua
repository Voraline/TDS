-- Script path: ReplicatedStorage.Resources.Universal.Middleware
-- Decompile time: 4.77 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Enum = require(ReplicatedStorage.Resources.Universal.Enum)
local Maid = require(ReplicatedStorage.Resources.Common.Maid)
local Network = require(ReplicatedStorage.Resources.Universal.Network)
local Modifiers = if not RunService:IsServer() then nil else require(ServerStorage.Server.Modules.Universal.Modules.Modifiers)
local u46 = {}
u46.__index = u46
u46.HookType = Enum.HookType
u46.MiddlewarePriority = Enum.MiddlewarePriority
u46.Boundedness = {Inbound = "1", Outbound = "2"}
local u54 = RunService:IsServer()

local function makeGuid() -- Line: 42 -- upvalues: HttpService (val)
    return string.gsub(HttpService:GenerateGUID(false), "-", "")
end

function u46.new(a1) -- Line: 46
    -- upvalues: u46 (val), Maid (val), Modifiers (val), ReplicatedStorage (val), u54 (val), Network (val)
    local v1 = a1 or {}
    local u6 = setmetatable({}, u46)
    u6._dontClean = v1.dontClean
    u6.Maid = Maid.new()
    u6._hooks = {}
    u6._hooksById = {}
    u6._cleanupsById = {}
    u6.Maid:Mark(function() -- Line: 57 -- upvalues: u6 (val)
        u6._hooks = {}
    end)
    if v1.useModifiers then
        u6.Modifiers = Modifiers.new({}, ReplicatedStorage)
        u6.Modifiers:SetName("Modifiers")
    end
    if not u54 then
        u6._cleanUp = (Network.Channel("Middleware")):On("Clean", function() -- Line: 67 -- upvalues: u6 (val)
            u6:Clean()
        end)
    end
    return u6
end

function u46.Record(a1) -- Line: 77
    a1._recording = {}
end

function u46.MakeCheckpoint(a1) -- Line: 81
    assert(a1._recording, "Middleware is not recording.")
    local _recording = a1._recording
    a1._recording = nil
    return function() -- Line: 87 -- upvalues: _recording (val), a1 (val)
        for i in _recording do
            a1:RemoveById(i)
        end
    end
end

function u46.Hook(a1, a2, a3, a4, a5, a6, a7) -- Line: 104
    -- upvalues: Enum (val), HttpService (val)
    local v1
    local v2 = a7 or Enum.MiddlewarePriority.Stack
    if not a1._hooks[a2] then
        a1._hooks[a2] = {}
    end
    if not a1._hooks[a2][a3] then
        v1 = a1._hooks[a2]
        v1[a3] = {}
    end
    v1 = a1._hooks[a2][a3]
    v1[#a1._hooks[a2][a3] + 1] = {a4, a6 or 1, v2}
    table.sort(a1._hooks[a2][a3], function(a1, a2) -- Line: 124
        return a1[2] < a2[2]
    end)
    local u85 = a5 or string.gsub(HttpService:GenerateGUID(false), "-", "")
    if a1._hooksById[u85] then
        u85 = string.gsub(HttpService:GenerateGUID(false), "-", "")
    end
    if u85 then
        a1._hooksById[u85] = {a2, a3, a4, u85, a6}
        if a1._recording then
            a1._recording[u85] = true
        end
        if a1.Modifiers then
            a1.Modifiers:Add((tostring(u85)))
        end
    end
    return function() -- Line: 147 -- upvalues: a1 (val), u85 (ref)
        a1:RemoveById(u85)
    end
end

function u46:RemoveById(a2) -- Line: 152 -- types: self: table, a2: number
    local v1 = self._hooksById[a2]
    if not v1 then
        warn((("Found no hook with id %*"):format(a2)))
        return
    end
    if self._cleanupsById[a2] then
        self._cleanupsById[a2]:Sweep()
    end
    self:RemoveHook((unpack(v1)))
end

function u46.ClearHooks(a1, a2) -- Line: 172 -- types: a1: table, a2: number
    if not a1._hooks[a2] then
        return
    end
    a1._hooks[a2] = {}
end

function u46:RemoveHook(a2, a3, a4, a5) -- Line: 188
    -- upvalues: 
    if not self._hooks[a2] then
        warn(string.format("Hook %s does not exist.", (tostring(a2))))
        return
    end
    if not self._hooks[a2][a3] then
        warn(string.format("Hook %s does not have an inbound or outbound hook.", (tostring(a2))))
        return
    end
    for k, v in pairs(self._hooks[a2][a3]) do
        if v[1] == a4 then
            table.remove(self._hooks[a2][a3], k)
            break
        end
    end
    if a5 and self.Modifiers then
        self.Modifiers:Remove((tostring(a5)))
    end
end

function u46.RunHooks(a1, a2, a3, a4, ...) -- Line: 226 -- types: a1: table, a3: string, a4: string
    if not a1._hooks[a3] or not a1._hooks[a3][a4] then
        return
    end
    for i, v in ipairs(a1._hooks[a3][a4]) do
        v[1](a2, ...)
    end
end

function u46.RunFunction(a1, a2, a3, a4, ...) -- Line: 258
    -- upvalues: u46 (val), Enum (val)
    if not a1._hooks[a2] then
        return a4(...)
    end
    local v1 = {...}
    local v2 = a1._hooks[a2][u46.Boundedness.Inbound]
    if v2 then
        for i, v in ipairs(v2) do
            v1 = {v[1](a3, table.unpack(v1))}
            if v[3] == Enum.MiddlewarePriority.Replace then
                break
            end
        end
    end
    local v3 = {a4(table.unpack(v1))}
    local v4 = a1._hooks[a2][u46.Boundedness.Outbound]
    if v4 then
        for i2, i3 in ipairs(v4) do
            v3 = {i3[1](a3, table.unpack(v3))}
            if v4[3] == Enum.MiddlewarePriority.Replace then
                break
            end
        end
    end
    return table.unpack(v3)
end

function u46.Destroy(a1) -- Line: 292
    a1:Clean(true)
    if a1._cleanUp then
        a1._cleanUp()
        a1._cleanUp = nil
    end
    a1.Maid = nil
end

function u46:Clean(a2) -- Line: 303 -- upvalues: u54 (val), Network (val) -- types: self: table, a2: boolean?
    if not a2 and self._dontClean then
        return
    end
    if self.Maid then
        self.Maid:Sweep()
        self.Maid:Mark(function() -- Line: 310 -- upvalues: self (val)
            self._hooks = {}
        end)
    end
    if self.Modifiers then
        self.Modifiers:Clear()
    end
    if u54 then
        Network.Channel("Middleware"):FireAllClients("Clean")
    end
end

return u46.new({useModifiers = u54})