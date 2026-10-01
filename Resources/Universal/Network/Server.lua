-- Script path: ReplicatedStorage.Resources.Universal.Network.Server
-- Decompile time: 1.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = Instance.new("RemoteEvent")
RemoteEvent.Parent = ReplicatedStorage
local RemoteFunction = Instance.new("RemoteFunction")
RemoteFunction.Parent = ReplicatedStorage
local UnreliableRemoteEvent = Instance.new("UnreliableRemoteEvent")
UnreliableRemoteEvent.Parent = ReplicatedStorage
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 13 -- upvalues: RemoteEvent (val), RemoteFunction (val), UnreliableRemoteEvent (val)
    RemoteEvent.OnServerEvent:Connect(function(a1_2, a2, a3, ...) -- Line: 15 -- upvalues: a1 (val) -- types: a2: string, a3: string
        a1:Emit(a2, a3, a1_2, ...)
    end)

    function RemoteFunction.OnServerInvoke(a1_2, a2, a3, ...) -- Line: 20
        -- upvalues: a1 (val)
        return a1:Emit(a2, a3, a1_2, ...)
    end

    UnreliableRemoteEvent.OnServerEvent:Connect(function(a1_2, a2, a3, ...) -- Line: 25 -- upvalues: a1 (val) -- types: a2: string, a3: string
        a1:Emit(a2, a3, a1_2, ...)
    end)
end

function v1:FireClient(a2, a3, ...) -- Line: 31
    -- upvalues: RemoteEvent (val)
    RemoteEvent:FireClient(a2, self.Channel, a3, ...)
end

function v1.FireUnreliableClient(a1, a2, a3, ...) -- Line: 35
    -- upvalues: UnreliableRemoteEvent (val)
    UnreliableRemoteEvent:FireClient(a2, a1.Channel, a3, ...)
end

function v1.FireAllClientsUnreliable(a1, a2, ...) -- Line: 39
    -- upvalues: UnreliableRemoteEvent (val)
    UnreliableRemoteEvent:FireAllClients(a1.Channel, a2, ...)
end

function v1:FireAllClients(a2, ...) -- Line: 43 -- upvalues: RemoteEvent (val) -- types: self: table, a2: string
    RemoteEvent:FireAllClients(self.Channel, a2, ...)
end

return v1