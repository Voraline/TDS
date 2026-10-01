-- Script path: ReplicatedStorage.Resources.Contracts
-- Decompile time: 6.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Resources.Types.ContractTypes)
local Gifts = require(ReplicatedStorage.Resources.Gifts)
local Groups = require(ReplicatedStorage.Resources.Contracts.Groups)
local table = require(ReplicatedStorage.Resources.Globals.table)
local u24 = {}

function u24.isObjectiveStatusComplete(a1) -- Line: 19
    if a1.type == "boolean" then
        return a1.achieved
    end
    if a1.type == "counter" then
        return a1.max <= (a1.value or 0)
    end
    return false
end

function u24.isTimestampExpired(a1) -- Line: 29 -- types: a1: number?
    if a1 then
        return a1 < workspace:GetServerTimeNow()
    end
    return false
end

function u24.isContractExpired(a1) -- Line: 33 -- upvalues: u24 (val)
    return u24.isTimestampExpired(a1.expires)
end

function u24.canClaimContract(a1) -- Line: 37
    local v1 = 0
    local v2 = 0
    local v3 = nil
    local v4 = nil
    local v5 = a1
    for i, j in a1.contracts, v3, v4 do
        if j.started then
            v1 = v1 + 1
        end
        v2 = v2 + 1
    end
    local claimToStart = v5.claimToStart
    if claimToStart then
        local maxClaimableContracts = v5.maxClaimableContracts or v2 + 1
        claimToStart = v1 < maxClaimableContracts
    end
    return claimToStart
end

function u24.doesContractHaveObjectives(a1) -- Line: 52
    return #a1.objectives > 0
end

function u24.isContractComplete(a1) -- Line: 56 -- upvalues: u24 (val)
    if a1.redeemed then
        return true
    end
    for i, j in a1.objectives do
        if not u24.isObjectiveStatusComplete(j.status) then
            return false
        end
    end
    return true
end

function u24.isContractResetOnFail(a1) -- Line: 70 -- upvalues: u24 (val)
    local v1 = false
    if a1.resetOnFail == true then
        v1 = not u24.isContractComplete(a1)
    end
    return v1
end

function u24.getRelevantEvents(a1) -- Line: 74 -- upvalues: u24 (val) -- types: a1: table
    local event, tracker, v1, v2
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for i, j in a1, v4, v5 do
        v1 = nil
        v2 = nil
        for k, n in j.objectives, v1, v2 do
            if not u24.isObjectiveStatusComplete(n.status) then
                tracker = n.tracker
                event = tracker and tracker.event
                if event then
                    v3[event] = true
                end
            end
        end
    end
    return v3
end

function u24.getIncompleteObjectives(a1) -- Line: 93 -- upvalues: u24 (val), table (val)
    local v1 = {}
    for i, j in a1.objectives do
        if not u24.isObjectiveStatusComplete(j.status) then
            table.insert(v1, j)
        end
    end
    return v1
end

function u24.getMultipleObjectives(a1, a2) -- Line: 104 -- upvalues: u24 (val), table (val) -- types: a2: string
    local v1
    local v2 = {}
    local v3 = {}
    local v4 = {}
    local v5 = nil
    local v6 = nil
    for i, j in a1.objectives, v5, v6 do
        if j.tracker.event == a2 and not u24.isObjectiveStatusComplete(j.status) then
            if not v3[j.tracker.event] or not v4[j.tracker.event] then
                v3[j.tracker.event] = true
                v4[j.tracker.event] = j.tracker.filter
                table.insert(v2, j)
            else
                v1 = true
                for k, n in v4[j.tracker.event] do
                    if j.tracker.filter[k] ~= n then
                        v1 = false
                        break
                    end
                end
                if not v1 then
                    v3[j.tracker.event] = true
                    v4[j.tracker.event] = j.tracker.filter
                    table.insert(v2, j)
                end
            end
        end
    end
    return v2
end

function u24.getCurrentObjective(a1, a2) -- Line: 141 -- upvalues: u24 (val) -- types: a2: string
    if a1.isMultiObjectives then
        return u24.getMultipleObjectives(a1, a2)
    end
    local v1 = 0
    for i, j in a1.objectives do
        if not u24.isObjectiveStatusComplete(j.status) then
            if j.tracker.event == a2 and not u24.isObjectiveStatusComplete(j.status) and i == v1 + 1 then
                return {j}
            end
        end
    end
    return {}
end

function u24.isContractADuplicate(a1, a2) -- Line: 168 -- upvalues: table (val) -- types: a2: table
    local v1 = nil
    local v2 = nil
    for i, j in a2, v1, v2 do
        for k, n in j.objectives do
            if not v3.objectives[k] then
                break
            end
            if table.deepCompare(n.tracker, v3.objectives[k].tracker) then
                return true
            end
        end
    end
    return false
end

function u24.getContractsByTrackerEvent(a1, a2) -- Line: 184 -- upvalues: table (val) -- types: a1: table, a2: string
    local v1, v2
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for i, j in a1, v4, v5 do
        v2 = nil
        v1 = nil
        for k, n in j.contracts, v2, v1 do
            if n.started then
                for m, i5 in n.objectives do
                    if i5.tracker.event == a2 then
                        table.insert(v3, n)
                        break
                    end
                end
            end
        end
    end
    return v3
end

function u24.getContractsByRewardType(a1, a2) -- Line: 204 -- types: a1: table, a2: string
    local v1, v2
    local v3 = {}
    local v4 = nil
    local v5 = nil
    local v6 = a2
    for i, j in a1, v4, v5 do
        v2 = nil
        v1 = nil
        for k, n in j.contracts, v2, v1 do
            if n.reward and n.reward.type == v6 then
                v3[k] = n
            end
            if n.rewards then
                for m, i5 in n.rewards do
                    if i5.type == v6 then
                        v3[k] = n
                        break
                    end
                end
            end
        end
    end
    return v3
end

function u24.getContractGroupByGuid(a1, a2) -- Line: 229 -- types: a1: table, a2: string
    for i, j in a1 do
        if j.contracts[a2] then
            return j, i
        end
    end
    return nil
end

function u24.cancelContract(a1, a2) -- Line: 244 -- upvalues: u24 (val) -- types: a1: table, a2: string
    local v1 = u24.getContractGroupByGuid(a1, a2)
    if not v1 then
        return false
    end
    if not v1.contracts[a2].redeemed and v1.contracts[a2].started then
        local v2 = v1.contracts[a2]
        v2.started = false
        for i, j in v1.contracts[a2].objectives do
            if j.status.type == "counter" then
                j.status.value = 0
            elseif j.status.type == "boolean" then
                j.status.achieved = false
            end
        end
        return true, v1.contracts[a2]
    end
    return false
end

function u24.generateObjective(a1, a2) -- Line: 267
    return {status = a1, tracker = a2}
end

function u24.generateContract(a1, a2) -- Line: 274 -- types: a1: table, a2: table
    return {objectives = a1, rewards = a2}
end

function u24.isContractGroupExpired(a1, a2) -- Line: 281 -- upvalues: Groups (val), u24 (val) -- types: a2: string
    if Groups[a2] and Groups[a2].disabled then
        return true
    end
    return u24.isTimestampExpired(a1.expires)
end

function u24.hasTowerSkinFromContract(a1, a2, a3) -- Line: 289
    -- upvalues: table (val), Gifts (val)
    local v1, v2, v3
    local rewards = a1.rewards or {}
    if a1.reward then
        table.insert(rewards, a1.reward)
    end
    local v4 = nil
    local v5 = nil
    local v6, v7 = a2, a3
    for i, j in rewards, v4, v5 do
        if j.type == "tower" then
            v1 = nil
            v2 = nil
            for k, n in v6, v1, v2 do
                if not j.skin and j.tower == k then
                    return true
                end
                if j.tower == k and table.find(n, j.skin) then
                    return true
                end
            end
            v1 = nil
            v2 = nil
            for m, i5 in v7, v1, v2 do
                v3 = Gifts.Gifts[i5]
                if v3 then
                    for i6, i7 in v3.rewards do
                        if i7.type == "skin" and i7.tower == j.tower and i7.skin == j.skin then
                            return true
                        end
                    end
                end
            end
        end
    end
    return false
end

function u24.hasTowerFromContract(a1, a2) -- Line: 335 -- upvalues: table (val) -- types: a2: table
    local rewards = a1.rewards or {}
    if a1.reward then
        table.insert(rewards, a1.reward)
    end
    local v1 = false
    local v2 = nil
    local v3 = nil
    for i, j in rewards, v2, v3 do
        if j.type == "tower" then
            for k, n in a2 do
                if j.tower == k then
                    return true
                end
            end
            if j.skin then
                v1 = true
            end
        end
    end
    if not v1 then
        return true
    end
    return false
end

return u24