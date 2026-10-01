-- Script path: ReplicatedStorage.Resources.Universal.Debuffs
-- Decompile time: 8.09 ms

local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local DebuffQueue = require(script.DebuffQueue)
local Enum = require(script.Parent.Enum)
local Middleware = require(script.Parent.Middleware)
local Asset = require(ReplicatedStorage.Resources.Universal.Asset)
local Enum_2 = require(ReplicatedStorage.Resources.Universal.Enum)
local Maid = require(ReplicatedStorage.Resources.Common.Maid)
require(ReplicatedStorage.Packages.Sift)
require(ReplicatedStorage.Resources.Common.Standalone.Signal)
local table = require(ReplicatedStorage.Resources.Globals.table)
local u61 = RunService:IsClient()
local u63 = if not u61 then "OnServerTick" else "OnClientTick"
local u64 = {}
u64.__index = u64

local function getDebuffHandler(a1) -- Line: 43 -- upvalues: Asset (val) -- types: a1: string
    return Asset("NewDebuffs", (("%*Debuff"):format(a1)))
end

local function addDebuffClass(a1, a2) -- Line: 47 -- upvalues: Asset (val), u61 (val) -- types: a2: table
    local v1 = a1._debuffClasses[a2.Type]
    if v1 then
        return v1
    end
    if a1._npcClass.Dead then
        return
    end
    local v2 = Asset("NewDebuffs", (("%*Debuff"):format(a2.Type)))
    local v3 = {
        NPC = a1._npcClass,
        Towers = a2.Towers,
        Parameters = a2.Parameters,
        Duration = a2.Duration,
        Started = a2.Started,
        Ends = a2.Ends,
        Stacks = a2.Stack,
        StacksPerTower = a2.StacksPerTower,
        AmountOfStacksPerTower = a2.AmountOfStacksPerTower,
        Remove = function() -- Line: 68 -- upvalues: a1 (val), a2 (val)
            a1:Remove(a2.Type)
        end,
        RemoveStack = function() -- Line: 71 -- upvalues: a1 (val), a2 (val)
            a1:RemoveStack(a2.Type, a2.Parameters)
        end,
        RemoveTowerStack = function() -- Line: 74 -- upvalues: a1 (val), a2 (val), u61 (upval)
            local StacksPerTower_2
            local DebuffFromParameters = a1.DebuffQueue:GetDebuffFromParameters(a2.Type, a2.Parameters)
            if not DebuffFromParameters or not DebuffFromParameters.StacksPerTower then
                return
            end
            for i, j in DebuffFromParameters.StacksPerTower do
                StacksPerTower_2 = DebuffFromParameters.StacksPerTower
                StacksPerTower_2[i] = StacksPerTower_2[i] - 1
                if DebuffFromParameters.StacksPerTower[i] <= 0 then
                    DebuffFromParameters.StacksPerTower[i] = nil
                end
                DebuffFromParameters.AmountOfStacksPerTower = 0
                for k, n in DebuffFromParameters.StacksPerTower do
                    DebuffFromParameters.AmountOfStacksPerTower = DebuffFromParameters.AmountOfStacksPerTower + n
                end
                break
            end
            DebuffFromParameters.Stack = DebuffFromParameters.Stack - 1
            if DebuffFromParameters.Stack < 1 then
                DebuffFromParameters.Stack = 0
            end
            if not u61 then
                a1.Replicator:Set(DebuffFromParameters.Type, DebuffFromParameters)
            end
        end,
        IsTowerStacksEmpty = function() -- Line: 107 -- upvalues: a2 (val)
            local v1 = 0
            for i, j in a2.StacksPerTower do
                v1 = v1 + j
            end
            return v1 == 0
        end,
    }
    local v4 = {__index = v2}
    local v5 = setmetatable(v3, v4)
    if v5.Create then
        v5:Create()
    end
    a1._debuffClasses[a2.Type] = v5
    return v5
end

local function removeDebuffClass(a1, a2) -- Line: 129 -- types: a2: string
    local v1 = a1._debuffClasses[a2]
    if not v1 then
        return
    end
    a1._debuffClasses[a2] = nil
    if v1.Destroy then
        v1:Destroy()
    end
end

local function stepDebuffClass(a1, a2, a3) -- Line: 142 -- upvalues: u63 (val) -- types: a2: table, a3: number
    local v1 = a1._debuffClasses[a2.Type]
    if not v1 then
        return
    end
    if v1.Stacks ~= a2.Stack and v1.OnStackChanged then
        v1:OnStackChanged(a2.Stack)
    end
    v1.Parameters = a2.Parameters
    v1.Ends = a2.Ends
    v1.Duration = a2.Duration
    v1.Stacks = a2.Stack
    v1.Towers = a2.Towers
    v1.StacksPerTower = a2.StacksPerTower
    v1.AmountOfStacksPerTower = a2.AmountOfStacksPerTower
    if v1[u63] then
        v1[u63](v1, a3)
    end
end

function u64.new(a1, a2, a3) -- Line: 165
    -- upvalues: u64 (val), DebuffQueue (val), Maid (val), u61 (val), ReplicatedStorage (val), addDebuffClass (val)
    -- upvalues: ServerStorage (val), table (val)
    local u6 = setmetatable({}, u64)
    u6._debuffClasses = {}
    u6._npcClass = a1
    u6.DebuffQueue = DebuffQueue.new()
    u6.Maid = Maid.new()
    if not u61 then
        u6.Replicator = require(ServerStorage.Server.Modules.Universal.Controllers.ServerTagReplicator).new("Debuffs", {}, u6.ReplicationFolder, true)
        u6.ReplicationFolder = u6.Replicator.ReplicationFolder
        u6.ReplicationFolder.Name = "Debuffs"
        u6.ReplicationFolder.Parent = a2
    else
        local TagReplicator_2 = require(ReplicatedStorage.Client.Modules.Universal.Utilities.TagReplicator)
        u6.ReplicationFolder = a3
        u6.Replicator = TagReplicator_2.getReplicatorEntityFromFolder(u6.ReplicationFolder)

        local function updateDebuff(a1, a2) -- Line: 181
            -- upvalues: u6 (val), addDebuffClass (upval)
            if not u6._npcClass:IsAlive() then
                return
            end
            if a2 then
                addDebuffClass(u6, a2)
                return
            end
            local v1 = u6
            local v2 = v1._debuffClasses[a1]
            if not v2 then
                return
            end
            v1._debuffClasses[a1] = nil
            if v2.Destroy then
                v2:Destroy()
            end
        end

        u6.Replicator.Changed:Connect(updateDebuff)
        for i, j in u6.Replicator:GetAllStates() do
            task.spawn(updateDebuff, i, j)
        end
    end
    u6.Maid:Mark(u6.Replicator)
    u6.Maid:Mark(function() -- Line: 209 -- upvalues: u6 (val), table (upval)
        for i, j in u6._debuffClasses do
            if j.Destroy then
                j:Destroy()
            end
        end
        table.clear(u6._debuffClasses)
    end)
    return u6
end

function u64:Destroy() -- Line: 224
    self.Maid:Sweep()
    setmetatable(self, nil)
end

function u64.RemoveAll(a1) -- Line: 229 -- upvalues: u61 (val)
    if u61 then
        return
    end
    for i, j in a1.DebuffQueue.Queue do
        a1:Remove(i)
    end
end

function u64:RemoveStack(a2, a3) -- Line: 239 -- upvalues: u61 (val) -- types: a2: number, a3: table
    local DebuffFromParameters = self.DebuffQueue:GetDebuffFromParameters(a2, a3)
    if not DebuffFromParameters then
        return
    end
    DebuffFromParameters.Stack = DebuffFromParameters.Stack - 1
    if DebuffFromParameters.Stack < 1 then
        self:Remove(a2)
        return
    end
    if not u61 then
        self.Replicator:Set(DebuffFromParameters.Type, DebuffFromParameters)
    end
end

function u64.Apply(a1, a2, a3, a4, a5) -- Line: 254
    -- upvalues: u61 (val), Enum_2 (val), Asset (val), table (val), Middleware (val), Enum (val), addDebuffClass (val)
    if u61 then
        return
    end
    local v1 = Enum_2.DebuffType.ToString(a2)
    if not v1 then
        warn((("Attempted to apply debuff \"%*\" but debuff type is invalid!"):format(a2)))
        return
    end
    local v2 = Asset("NewDebuffs", (("%*Debuff"):format(v1)))
    if not v2 then
        warn((("Attempted to apply debuff \"%*\" but debuff is invalid!"):format(v1)))
        return
    end
    if v2.DefaultParameters then
        a4 = table.merge({}, v2.DefaultParameters, a4)
    end
    if v2.CanApply and not v2.CanApply(a1._npcClass, a4) then
        return
    end
    if v2.PreApply then
        v2.PreApply(a1._npcClass, a4)
    end
    local ServerTimeNow = workspace:GetServerTimeNow()
    local v3 = {
        Stack = 1,
        AmountOfStacksPerTower = 0,
        Type = v1,
        Started = ServerTimeNow,
        Ends = ServerTimeNow + (a3 or 0),
        Duration = a3 or 0,
        Parameters = a4,
    }
    v3.StacksPerTower = {}
    v3.Towers = {}
    Middleware:RunFunction(Enum.HookType.OnDebuffCreated, v3, function() end)
    v3.Ends = ServerTimeNow + v3.Duration
    if a5 then
        v3.Towers[a5] = true
    end
    local v4 = 0
    local v5 = false
    if v2.Score then
        v4 = v2.Score(v3.Parameters)
    end
    if a4 and a4.MaxStacksPerTower and a5 then
        local v6 = a1.DebuffQueue:GetLatestDebuff(v3) or v3
        if a4.MaxStacks and a4.MaxStacks <= v6.AmountOfStacksPerTower then
            return
        end
        if v6 then
            if not v6.StacksPerTower[a5] then
                v6.StacksPerTower[a5] = 0
            end
            if not (a4.MaxStacksPerTower <= v6.StacksPerTower[a5]) then
                local StacksPerTower = v6.StacksPerTower
                StacksPerTower[a5] = StacksPerTower[a5] + 1
            else
                v6.StacksPerTower[a5] = a4.MaxStacksPerTower
            end
            v6.AmountOfStacksPerTower = 0
            for i, j in v6.StacksPerTower do
                v6.AmountOfStacksPerTower = v6.AmountOfStacksPerTower + j
            end
            v3.StacksPerTower = v6.StacksPerTower
            v3.AmountOfStacksPerTower = v6.AmountOfStacksPerTower
            v5 = true
        end
    end
    local DebuffQueue = a1.DebuffQueue
    if DebuffQueue:AddToQueue(v3, v4, a4 and a4.MaxStacks, a5) then
        a1.Replicator:Set(v1, v3)
    elseif v5 then
        a1.Replicator:Set(v1, (a1.DebuffQueue:GetLatestDebuff(v1)))
    end
    local v7 = addDebuffClass(a1, v3)
    v7.Stack = v3.Stack
    v7.StacksPerTower = v3.StacksPerTower
    v7.AmountOfStacksPerTower = v3.AmountOfStacksPerTower
    return v7
end

function u64:Remove(a2) -- Line: 362 -- upvalues: u61 (val), table (val) -- types: a2: string
    if u61 then
        return
    end
    local v1 = self.DebuffQueue.Queue[a2]
    if v1 then
        table.clear(v1)
        self.DebuffQueue.Queue[a2] = nil
    end
    self.Replicator:Set(a2, nil)
    local v2 = self._debuffClasses[a2]
    if not v2 then
        return
    end
    self._debuffClasses[a2] = nil
    if v2.Destroy then
        v2:Destroy()
    end
end

function u64:Get(a2) -- Line: 377 -- types: a2: string
    return self.Replicator:Get((tostring(a2)))
end

function u64.GetDebuffChangedSignal(a1, a2) -- Line: 381 -- types: a2: string
    return a1.Replicator:GetStateChangedSignal((tostring(a2)))
end

function u64.Step(a1, a2) -- Line: 385 -- upvalues: u61 (val), stepDebuffClass (val) -- types: a2: number
    local v1, v2, v3
    local ServerTimeNow = workspace:GetServerTimeNow()
    local v4 = {}
    debug.profilebegin("DebuffStep")
    if not u61 then
        local Debuff, v5, v6
        debug.profilebegin("processDebuffQueue")
        local v7 = a1.DebuffQueue:ProcessQueue()
        debug.profileend()
        debug.profilebegin("removeOldDebuffs")
        for i in v7 do
            a1.Replicator:Remove(i)
            v5 = a1._debuffClasses[i]
            if v5 then
                a1._debuffClasses[i] = nil
                if v5.Destroy then
                    v5:Destroy()
                end
            end
        end
        debug.profileend()
        debug.profilebegin("populateAndUpdateDebuffs")
        local Queue = a1.DebuffQueue.Queue
        v3 = nil
        local v8 = nil
        v1, v2 = a1, a2
        for j, k in Queue, v3, v8 do
            Debuff = k[1] and k[1].Debuff
            v6 = v1.Replicator:Get(j)
            if Debuff then
                if Debuff ~= v6 then
                    v1.Replicator:Set(j, Debuff)
                end
                v4[j] = Debuff
            end
        end
    else
        debug.profilebegin("populateAndUpdateDebuffs")
        local State = a1.Replicator.State
        local v9 = nil
        v3 = nil
        v1, v2 = a1, a2
        for n, m in State, v9, v3 do
            if m.Ends and m.Duration then
                if m.Duration < 1 or ServerTimeNow < m.Ends then
                    v4[n] = m
                end
            end
        end
    end
    debug.profileend()
    debug.profilebegin("stepAllDebuffs")
    for i5, i6 in v4 do
        stepDebuffClass(v1, i6, v2)
    end
    debug.profileend()
    debug.profileend()
end

return u64