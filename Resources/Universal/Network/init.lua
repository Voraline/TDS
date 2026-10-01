-- Script path: ReplicatedStorage.Resources.Universal.Network
-- Decompile time: 1.23 ms

local RunService = game:GetService("RunService")
local v1 = RunService:IsServer()
local u29 = if not (RunService:IsRunning()) then require(script:WaitForChild("Dummy")) else if not v1 then require(script.Client) else require(script.Server)
local v2 = {__index = u29}
local u35 = setmetatable({Channels = {}}, v2)
u35:Initialize()

local function merge(...) -- Line: 32
    local v1 = {}
    for k, v in pairs({...}) do
        for k2, i in pairs(v) do
            v1[k2] = i
        end
    end
    return v1
end

function u35.Channel(a1) -- Line: 44 -- upvalues: u35 (val), merge (val), u29 (ref) -- types: a1: string
    local v1 = u35.Channels[a1]
    if v1 then
        return v1
    end
    local v2 = merge(u35, {Channel = a1})
    local v3 = {__index = u29}
    local v4 = setmetatable(v2, v3)

    function v4:Broadcast(a2, ...) -- Line: 53 -- types: self: table, a2: string
        local v1 = self[a2]
        if v1 then
            return v1(...)
        end
    end

    function v4.On(a1, a2, a3) -- Line: 61 -- types: a1: table, a2: string, a3: function
        a1[a2] = a3
        return function() -- Line: 69 -- upvalues: a1 (val), a2 (val)
            a1[a2] = nil
        end
    end

    u35.Channels[a1] = v4
    return v4
end

function u35.Emit(a1, a2, a3, ...) -- Line: 80 -- types: a1: table, a2: string, a3: string
    local v1 = a1.Channels[a2]
    if v1 then
        return v1:Broadcast(a3, ...)
    end
end

return u35