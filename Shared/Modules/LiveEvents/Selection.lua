-- Script path: ReplicatedStorage.Shared.Modules.LiveEvents.Selection
-- Decompile time: 2.73 ms

local Definitions = require(script.Parent.Definitions)
require(script.Parent.Types)
return {
    targetContext = function(a1, a2) -- Line: 8
        if a2.target == "EventLobbies" then
            return "Lobby"
        end
        if a2.target == "EventMatches" then
            return "Game"
        end
        return a1.hostContext
    end,
    seed = function(a1, a2) -- Line: 18 -- types: a1: number, a2: string
        local v1 = a1
        local v2 = #a2
        for i = 1, v2 do
            v1 = (v1 * 31 + string.byte(a2, i)) % 2147483646
        end
        return (math.max(v1, 1))
    end,
    chaos = function(a1, a2) -- Line: 26 -- upvalues: Definitions (val) -- types: a1: number, a2: table?
        local v1, v2, v3, v4
        local v5 = Random.new(a1)
        local v6 = {}
        for i, j in Definitions.Actions do
            if j.chaosEligible and not j.destructive and table.find(j.contexts, "Game") then
                table.insert(v6, j)
            end
        end
        for k = #v6, 2, -1 do
            v2 = v5:NextInteger(1, k)
            v3 = v6[v2]
            v4 = v6[k]
            v6[k] = v3
            v6[v2] = v4
        end
        local v7 = table.clone(a2 or {})
        local v8 = {}
        v2 = nil
        v3 = nil
        for n, m in v6, v2, v3 do
            v1 = true
            for i5, i6 in m.conflictGroups do
                if v7[i6] then
                    v1 = false
                    break
                end
            end
            if v1 then
                table.insert(v8, m.id)
                for i7, i8 in m.conflictGroups do
                    if i8 ~= "tower-upgrades" then
                        v7[i8] = true
                    end
                end
                if #v8 == 10 then
                    return v8, nil
                end
            end
        end
        return nil, "Chaos needs ten compatible actions. Stop conflicting effects and try again."
    end,
    section = function(a1, a2, a3, a4) -- Line: 68 -- types: a2: string, a3: string?, a4: string?
        local enabled, v1
        local v2 = table.clone(a1)
        v2.cues = {}
        local v3 = (1 / 0)
        local cues = a1.cues
        local v4 = nil
        local v5 = nil
        local v6, v7, v8 = a2, a3, a4
        for i, j in cues, v4, v5 do
            v1 = table.clone(j)
            v1.parameters = table.clone(j.parameters)
            enabled = j.enabled
            if enabled then
                enabled = true
                if v6 ~= "event" then
                    if v6 ~= "cue" then
                        enabled = false
                        if v6 == "section" then
                            enabled = j.section == v8
                        end
                    else
                        enabled = true
                        if j.id ~= v7 then
                            enabled = false
                            if v6 == "section" then
                                enabled = j.section == v8
                            end
                        end
                    end
                end
            end
            v1.enabled = enabled
            if v1.enabled then
                if v1.trigger == "Time" or v1.trigger == "Start" then
                    v3 = math.min(v3, if v1.trigger ~= "Start" then v1.at else 0)
                end
            end
            table.insert(v2.cues, v1)
        end
        if v6 ~= "event" then
            for k, n in v2.cues do
                if n.enabled then
                    if v6 == "cue" then
                        n.trigger = "Start"
                        n.at = 0
                    elseif n.trigger == "Time" and v3 < (1 / 0) then
                        n.at = n.at - v3
                    end
                end
            end
        end
        return v2
    end,
}