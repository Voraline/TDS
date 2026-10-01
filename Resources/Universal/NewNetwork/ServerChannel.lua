-- Script path: ReplicatedStorage.Resources.Universal.NewNetwork.ServerChannel
-- Decompile time: 2.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NetworkContainer = require(ReplicatedStorage.Resources.Universal.NewNetwork.NetworkContainer)
require(ReplicatedStorage.Resources.Universal.NewNetwork.Types)
local u17 = {}
u17.__index = u17

function u17.new(a1, a2) -- Line: 9 -- upvalues: u17 (val), NetworkContainer (val) -- types: a1: string
    local v1 = setmetatable({}, u17)
    v1._listeners = {}
    v1.Namespace = a1
    if a2 then
        if a2.events then
            for i, v in ipairs(a2.events) do
                NetworkContainer.getOrCreateEvent(a1, v, "RemoteEvent")
            end
        end
        if a2.unreliableEvents then
            for i2, i3 in ipairs(a2.unreliableEvents) do
                NetworkContainer.getOrCreateEvent(a1, i3, "UnreliableRemoteEvent")
            end
        end
        if a2.functions then
            for i4, j in ipairs(a2.functions) do
                NetworkContainer.getOrCreateEvent(a1, j, "RemoteFunction")
            end
        end
    end
    return v1
end

function u17:Destroy() -- Line: 38 -- upvalues: NetworkContainer (val)
    local v1 = NetworkContainer.getNamespace(self.Namespace)
    if v1 then
        v1:Destroy()
    end
    self._listeners = {}
end

function u17.onEvent(a1, a2, a3) -- Line: 47 -- upvalues: NetworkContainer (val) -- types: a1: table, a2: string
    local u13 = NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "RemoteEvent").OnServerEvent:Connect(a3)
    if not a1._listeners[a2] then
        a1._listeners[a2] = {}
    end
    local v1 = a1._listeners[a2]
    v1[a3] = true
    return function() -- Line: 59 -- upvalues: a1 (val), a2 (val), a3 (val), u13 (val)
        local v1 = a1._listeners[a2]
        v1[a3] = nil
        if u13.Connected then
            u13:Disconnect()
        end
    end
end

function u17.onUnreliableEvent(a1, a2, a3) -- Line: 68
    -- upvalues: NetworkContainer (val)
    local u13 = NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "UnreliableRemoteEvent").OnServerEvent:Connect(a3)
    if not a1._listeners[a2] then
        a1._listeners[a2] = {}
    end
    local v1 = a1._listeners[a2]
    v1[a3] = true
    return function() -- Line: 80 -- upvalues: a1 (val), a2 (val), a3 (val), u13 (val)
        local v1 = a1._listeners[a2]
        v1[a3] = nil
        if u13.Connected then
            u13:Disconnect()
        end
    end
end

function u17.onInvoke(a1, a2, a3) -- Line: 89 -- upvalues: NetworkContainer (val) -- types: a1: table, a2: string
    local u8 = NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "RemoteFunction")
    u8.OnServerInvoke = a3
    return function() -- Line: 95 -- upvalues: u8 (val), a3 (val)
        if u8.OnServerInvoke == a3 then
            u8.OnServerInvoke = nil
        end
    end
end

function u17.fireLocal(a1, a2, a3, ...) -- Line: 102 -- types: a1: table, a2: string, a3: userdata
    local v1 = a1._listeners[a2]
    if not v1 then
        return
    end
    for i in v1 do
        i(a3, ...)
    end
end

function u17.fireAllClients(a1, a2, ...) -- Line: 113
    -- upvalues: NetworkContainer (val)
    local v1 = NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "RemoteEvent")
    assert(v1:IsA("RemoteEvent"), (("%*:%* is not of event type: RemoteEvent"):format(a1.Namespace, a2)))
    v1:FireAllClients(...)
end

function u17.fireClient(a1, a2, a3, ...) -- Line: 121
    -- upvalues: NetworkContainer (val)
    local v1 = NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "RemoteEvent")
    assert(v1:IsA("RemoteEvent"), (("%*:%* is not of event type: RemoteEvent"):format(a1.Namespace, a2)))
    v1:FireClient(a3, ...)
end

function u17.fireAllClientsUnreliable(a1, a2, ...) -- Line: 129
    -- upvalues: NetworkContainer (val)
    local v1 = NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "UnreliableRemoteEvent")
    assert(v1:IsA("UnreliableRemoteEvent"), (("%*:%* is not of event type: UnreliableRemoteEvent"):format(a1.Namespace, a2)))
    v1:FireAllClients(...)
end

function u17.fireClientUnreliable(a1, a2, a3, ...) -- Line: 140
    -- upvalues: NetworkContainer (val)
    local v1 = NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "UnreliableRemoteEvent")
    assert(v1:IsA("UnreliableRemoteEvent"), (("%*:%* is not of event type: UnreliableRemoteEvent"):format(a1.Namespace, a2)))
    v1:FireClient(a3, ...)
end

function u17.invokeClient(a1, a2, a3, ...) -- Line: 151
    -- upvalues: NetworkContainer (val)
    return (NetworkContainer.getOrCreateEvent(a1.Namespace, a2, "RemoteFunction")):InvokeClient(a3, ...)
end

return u17