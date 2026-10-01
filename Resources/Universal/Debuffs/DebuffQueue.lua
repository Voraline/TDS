-- Script path: ReplicatedStorage.Resources.Universal.Debuffs.DebuffQueue
-- Decompile time: 2.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Resources.Common.Standalone.Signal)
local table = require(ReplicatedStorage.Resources.Globals.table)
local u16 = {}
u16.__index = u16

local function getDebuffQueue(a1, a2) -- Line: 28 -- types: a2: string
    if not a1.Queue[a2] then
        a1.Queue[a2] = {}
    end
    return a1.Queue[a2]
end

function u16.new() -- Line: 36 -- upvalues: u16 (val)
    return (setmetatable({Queue = {}}, u16))
end

function u16.IsQueueEmpty(a1, a2) -- Line: 42
    local Queue = a1:GetQueue(a2)
    return (Queue and #Queue < 1) == true
end

function u16.GetLatestDebuff(a1, a2) -- Line: 47
    local Queue = a1:GetQueue(a2)
    if Queue then
        return Queue[1].Debuff
    end
end

function u16:GetQueue(a2) -- Line: 54
    if self.Queue[a2.Type] then
        return self.Queue[a2.Type]
    end
end

function u16:SortQueue(a2) -- Line: 60 -- upvalues: table (val)
    local Queue = self:GetQueue(a2)
    if Queue then
        table.sort(Queue, function(a1, a2) -- Line: 63 -- types: a1: table, a2: table
            return a2.Score < a1.Score
        end)
    end
end

function u16.GetDebuffFromParameters(a1, a2, a3) -- Line: 69 -- upvalues: table (val) -- types: a2: number
    if not a1.Queue[a2] then
        a1.Queue[a2] = {}
    end
    for i, j in a1.Queue[a2] do
        if table.shallowCompare(j.Debuff.Parameters, a3) then
            return j.Debuff
        end
    end
    return nil
end

function u16.AddToQueue(a1, a2, a3, a4, a5) -- Line: 81 -- upvalues: table (val) -- types: a3: number?, a4: number?
    local v1 = a3 or 1
    local Type = a2.Type
    if not a1.Queue[Type] then
        a1.Queue[Type] = {}
    end
    local v2 = a1.Queue[Type]
    local v3 = #v2
    for i = 1, v3 do
        if table.shallowCompare(v2[i].Debuff.Parameters, a2.Parameters) then
            a2.Towers = v2[i].Debuff.Towers
            a2.StacksPerTower = v2[i].Debuff.StacksPerTower
            a2.AmountOfStacksPerTower = v2[i].Debuff.AmountOfStacksPerTower
            if a5 then
                a2.Towers[a5] = true
            end
            if not a4 then
                a2.Stack = v2[i].Debuff.Stack + 1
            else
                a2.Stack = math.min(v2[i].Debuff.Stack + 1, a4)
            end
            v2[i].Debuff = a2
            v2[i].Score = v1
            a1:SortQueue(a2)
            return v2[1] and v2[1].Debuff == a2
        end
    end
    table.insert(v2, {Debuff = a2, Score = v1})
    a1:SortQueue(a2)
    return v2[1].Debuff == a2
end

function u16.RemoveFromQueue(a1, a2) -- Line: 127 -- upvalues: table (val)
    local v1 = false
    local v2 = a1.GetQueue(a1, a2)
    if v2 then
        for i = #v2, 1, -1 do
            if v2[i].Debuff == a2 then
                v1 = true
                table.remove(v2, i)
            end
        end
    end
    return v1
end

function u16.ProcessQueue(a1) -- Line: 143 -- upvalues: table (val)
    local Debuff
    local ServerTimeNow = workspace:GetServerTimeNow()
    local v1 = {}
    local v2 = nil
    local v3 = nil
    for i, j in a1.Queue, v2, v3 do
        for k = #j, 1, -1 do
            Debuff = j[k].Debuff
            if 0 < Debuff.Duration and Debuff.Ends < ServerTimeNow then
                table.remove(j, k)
            end
        end
        if #j < 1 then
            v1[i] = true
            a1.Queue[i] = nil
        end
    end
    return v1
end

return u16