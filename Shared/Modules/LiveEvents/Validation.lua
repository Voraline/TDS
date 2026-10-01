-- Script path: ReplicatedStorage.Shared.Modules.LiveEvents.Validation
-- Decompile time: 45.64 ms

local Definitions = require(script.Parent.Definitions)
local LegacyParameters = require(script.Parent.LegacyParameters)
local Selection = require(script.Parent.Selection)
require(script.Parent.Types)
local u20 = {}

function u20.finite(a1) -- Line: 10
    local v1 = false
    if type(a1) == "number" then
        v1 = false
        if a1 == a1 then
            v1 = (math.abs(a1)) < (1 / 0)
        end
    end
    return v1
end

local function integer(a1, a2, a3) -- Line: 14 -- upvalues: u20 (val) -- types: a2: number, a3: number
    local v1 = u20.finite(a1)
    if v1 then
        v1 = false
        if a1 % 1 == 0 then
            v1 = false
            if a2 <= a1 then
                v1 = a1 <= a3
            end
        end
    end
    return v1
end

local function boundedString(a1, a2, a3) -- Line: 18 -- types: a2: number, a3: boolean?
    local v1 = false
    if type(a1) == "string" then
        v1 = false
        if #a1 <= a2 then
            v1 = true
            if a3 ~= true then
                v1 = string.find(a1, "%S") ~= nil
            end
        end
    end
    return v1
end

local function identifier(a1, a2) -- Line: 24 -- types: a2: boolean?
    local v1 = false
    if type(a1) == "string" then
        v1 = false
        if #a1 <= 64 then
            v1 = true
            if a2 ~= true then
                v1 = string.find(a1, "%S") ~= nil
            end
        end
    end
    if v1 then
        v1 = true
        if a1 ~= "" then
            v1 = string.match(a1, "^[%w_%-]+$") ~= nil
        end
    end
    return v1
end

local function exactKeys(a1, a2) -- Line: 29 -- types: a2: table
    for i in a1 do
        if type(i) == "string" and a2[i] then
            continue
        end
        return false
    end
    return true
end

local function isArray(a1, a2) -- Line: 38 -- upvalues: u20 (val) -- types: a2: number
    if type(a1) == "table" and not (a2 < #a1) then
        local v1
        local v2 = 0
        local v3 = nil
        local v4 = nil
        local v5, v6 = a1, a2
        for i in a1, v3, v4 do
            v1 = u20.finite(i)
            if v1 then
                v1 = false
                if i % 1 == 0 then
                    v1 = false
                    if i >= 1 then
                        v1 = i <= v6
                    end
                end
            end
            if not v1 then
                return false
            end
            v2 = v2 + 1
        end
        return v2 == #v5
    end
    return false
end

function u20.parameters(a1, a2) -- Line: 52
    -- upvalues: Definitions (val), u20 (val), LegacyParameters (val)
    local default, find, options, v1, v2, v3
    local v4 = Definitions.ById[a1]
    if not v4 then
        return nil, "This action is not supported by this server."
    end
    if type(a2) ~= "table" then
        return nil, "Action settings must be a table."
    end
    local v5 = {}
    local v6 = {}
    local fields = v4.fields
    local v7 = nil
    local v8 = nil
    local v9, v10 = a1, a2
    for i, j in fields, v7, v8 do
        v5[j.key] = true
        default = v10[j.key]
        if default == nil then
            default = j.default
        end
        if j.kind == "number" then
            if u20.finite(default) and not (default < (j.min or (-1 / 0))) and not ((j.max or (1 / 0)) < default) then
                if j.integer and default % 1 ~= 0 then
                    return nil, j.label .. " is outside its permitted range."
                end
                v6[j.key] = default
                continue
            end
            return nil, j.label .. " is outside its permitted range."
        end
        if j.kind == "select" then
            if type(default) == "string" then
                find = table.find
                options = j.options or {}
                if find(options, default) then
                    v6[j.key] = default
                    continue
                end
            end
            return nil, "Choose a supported " .. (string.lower(j.label)) .. "."
        end
        if j.kind ~= "text" and j.kind ~= "content" then
            if type(default) ~= "boolean" then
                return nil, j.label .. " must be on or off."
            end
            v6[j.key] = default
            continue
        end
        v2 = j.max or 180
        v1 = false
        if type(default) == "string" then
            v1 = false
            if #default <= v2 then
                v1 = string.find(default, "%S") ~= nil
            end
        end
        if not v1 then
            return nil, j.label .. " is empty or too long."
        end
        v6[j.key] = default
    end
    if v9 == "spawn-slop-army" then
        v5.minProgress = true
        v5.maxProgress = true
    end
    for k in v10 do
        if type(k) ~= "string" then
            v3 = false
        elseif v5[k] then
            continue
        else
            v3 = false
        end
        if not v3 then
            return nil, "Action settings contain an unknown field."
        end
        if v9 == "randomize-tower-sizes" and v6.maxScale < v6.minScale then
            return nil, "Smallest scale must not exceed largest scale."
        end
        v3 = LegacyParameters.validate(v9, v6)
        if v3 then
            return nil, v3
        end
        return v6, nil
    end
    if false then
        return nil, "Action settings contain an unknown field."
    end
    if v9 == "randomize-tower-sizes" and v6.maxScale < v6.minScale then
        return nil, "Smallest scale must not exceed largest scale."
    end
    v3 = LegacyParameters.validate(v9, v6)
    if v3 then
        return nil, v3
    end
    return v6, nil
end

function u20.normalize(a1, a2) -- Line: 111
    -- upvalues: Definitions (val), u20 (val), isArray (val), Selection (val)
    local u618 = {}

    local function issue(a1, a2, a3) -- Line: 116 -- upvalues: u618 (val) -- types: a1: string, a2: string, a3: string?
        table.insert(u618, {field = a1, message = a2, cueId = a3})
    end

    if type(a1) == "table" then
        local actionId, at_2, cues, id, id_2, id_3, name, parameters, revision, section, seed, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
        local v11 = {
            schemaVersion = true,
            hostContext = true,
            id = true,
            name = true,
            revision = true,
            seed = true,
            cues = true,
        }
        local v12 = a1
        local v13 = nil
        for m in v12, nil, v13 do
            if type(m) ~= "string" then
                v9 = false
            elseif v11[m] then
                continue
            else
                v9 = false
            end
            if not v9 then
                return nil, {{message = "Event definition contains unsupported fields."}}
            end
            if a1.hostContext ~= "Lobby" and a1.hostContext ~= "Game" then
                table.insert(u618, {
                    field = "hostContext",
                    message = "Choose the Lobby or Game host and save a new revision.",
                })
            end
            if a1.schemaVersion ~= Definitions.SchemaVersion then
                table.insert(u618, {
                    field = "schemaVersion",
                    message = "This event format is not supported by this server.",
                })
            end
            id = a1.id
            v9 = false
            if type(id) == "string" then
                v9 = false
                if #id <= 64 then
                    v9 = true
                end
            end
            if v9 then
                v9 = true
                if id ~= "" then
                    v9 = string.match(id, "^[%w_%-]+$") ~= nil
                end
            end
            if not v9 then
                table.insert(u618, {field = "id", message = "The event identifier is invalid."})
            end
            name = a1.name
            v9 = false
            if type(name) == "string" then
                v9 = false
                if #name <= 64 then
                    v9 = string.find(name, "%S") ~= nil
                end
            end
            if not v9 then
                table.insert(u618, {field = "name", message = "Give the event a name of at most 64 characters."})
            end
            revision = a1.revision
            v9 = u20.finite(revision)
            if v9 then
                v9 = false
                if revision % 1 == 0 then
                    v9 = false
                    if revision >= 0 then
                        v9 = revision <= 1000000000
                    end
                end
            end
            if not v9 then
                table.insert(u618, {field = "revision", message = "The event revision is invalid."})
            end
            seed = a1.seed
            v9 = u20.finite(seed)
            if v9 then
                v9 = false
                if seed % 1 == 0 then
                    v9 = false
                    if seed >= 1 then
                        v9 = seed <= 2147483646
                    end
                end
            end
            if not v9 then
                table.insert(u618, {
                    field = "seed",
                    message = "The rehearsal seed must be a positive integer below 2147483647.",
                })
            end
            if not isArray(a1.cues, Definitions.MaxCues) then
                table.insert(u618, {field = "cues", message = "An event can contain at most 64 ordered cues."})
                return nil, u618
            end
            v9 = {}
            v11 = {}
            v12 = 0
            cues = a1.cues
            v13 = nil
            v10 = nil
            v2, v1 = a2, a1
            for i5, i6 in cues, v13, v10 do
                if type(i6) ~= "table" then
                    table.insert(u618, {
                        field = "cues",
                        message = "Cue " .. (tostring(i5)) .. " has unsupported fields.",
                    })
                else
                    v4 = {
                        id = true,
                        section = true,
                        actionId = true,
                        version = true,
                        enabled = true,
                        trigger = true,
                        at = true,
                        target = true,
                        parameters = true,
                    }
                    v5 = nil
                    v6 = nil
                    for i7 in i6, v5, v6 do
                        if type(i7) ~= "string" then
                            v3 = false
                        elseif v4[i7] then
                            continue
                        else
                            v3 = false
                        end
                        if v3 then
                            id_2 = i6.id
                            v4 = false
                            if type(id_2) == "string" then
                                v4 = false
                                if #id_2 <= 64 then
                                    v4 = string.find(id_2, "%S") ~= nil
                                end
                            end
                            if v4 then
                                v4 = true
                                if id_2 ~= "" then
                                    v4 = string.match(id_2, "^[%w_%-]+$") ~= nil
                                end
                            end
                            id_3 = if not v4 then nil else i6.id
                            if not id_3 then
                                table.insert(u618, {
                                    field = "id",
                                    message = "Every cue needs a unique identifier.",
                                    cueId = id_3,
                                })
                            elseif not v11[id_3] then
                                v11[id_3] = true
                            else
                                table.insert(u618, {
                                    field = "id",
                                    message = "Every cue needs a unique identifier.",
                                    cueId = id_3,
                                })
                            end
                            section = i6.section
                            v4 = false
                            if type(section) == "string" then
                                v4 = false
                                if #section <= 48 then
                                    v4 = true
                                end
                            end
                            if not v4 then
                                table.insert(u618, {
                                    field = "section",
                                    message = "Section names must be at most 48 characters.",
                                    cueId = id_3,
                                })
                            end
                            if type(i6.enabled) ~= "boolean" then
                                table.insert(u618, {
                                    field = "enabled",
                                    message = "Choose whether this cue is enabled.",
                                    cueId = id_3,
                                })
                            elseif i6.enabled then
                                v12 = v12 + 1
                            end
                            actionId = i6.actionId
                            parameters = i6.parameters
                            if actionId == "teleport-players-to-game" then
                                actionId = "teleport-to-event"
                            elseif actionId == "add-game-modifier"
                                and type(parameters) == "table"
                                and parameters.name == "RandomTowerPositions" then
                                actionId = "random-tower-placement"
                                parameters = table.clone(parameters)
                                parameters.name = nil
                            end
                            v5 = if type(actionId) ~= "string" then nil else Definitions.ById[actionId]
                            v6, v7 = u20.parameters(actionId, parameters)
                            if v7 then
                                table.insert(u618, {field = "parameters", message = v7, cueId = id_3})
                            end
                            if v5 and i6.version ~= nil and i6.version ~= v5.version then
                                table.insert(u618, {
                                    field = "version",
                                    message = "This action version is unavailable. Re-select the action and rehearse again.",
                                    cueId = id_3,
                                })
                            end
                            if i6.trigger == "Start" or i6.trigger == "Time" or i6.trigger == "Wave" then
                                if not u20.finite(i6.at) or i6.at < 0 or Definitions.MaxDuration < i6.at then
                                    table.insert(u618, {
                                        field = "at",
                                        message = "Cue timing is outside its permitted range.",
                                        cueId = id_3,
                                    })
                                elseif i6.trigger == "Wave" then
                                    at_2 = i6.at
                                    v8 = u20.finite(at_2)
                                    if v8 then
                                        v8 = false
                                        if at_2 % 1 == 0 then
                                            v8 = false
                                            if at_2 >= 1 then
                                                v8 = at_2 <= 1000
                                            end
                                        end
                                    end
                                    if not v8 then
                                        table.insert(u618, {
                                            field = "at",
                                            message = "Cue timing is outside its permitted range.",
                                            cueId = id_3,
                                        })
                                    end
                                end
                            elseif i6.trigger ~= "Manual" then
                                table.insert(u618, {
                                    field = "trigger",
                                    message = "Choose a supported cue trigger.",
                                    cueId = id_3,
                                })
                            elseif not u20.finite(i6.at) or i6.at < 0 or Definitions.MaxDuration < i6.at then
                                table.insert(u618, {
                                    field = "at",
                                    message = "Cue timing is outside its permitted range.",
                                    cueId = id_3,
                                })
                            elseif i6.trigger == "Wave" then
                                at_2 = i6.at
                                v8 = u20.finite(at_2)
                                if v8 then
                                    v8 = false
                                    if at_2 % 1 == 0 then
                                        v8 = false
                                        if at_2 >= 1 then
                                            v8 = at_2 <= 1000
                                        end
                                    end
                                end
                                if not v8 then
                                    table.insert(u618, {
                                        field = "at",
                                        message = "Cue timing is outside its permitted range.",
                                        cueId = id_3,
                                    })
                                end
                            end
                            if i6.target == "EventLobbies" or i6.target == "EventMatches" then
                                if v5 and i6.target == "EventLobbies" and not table.find(v5.contexts, "Lobby") then
                                    table.insert(u618, {
                                        field = "target",
                                        message = "This action requires an event match.",
                                        cueId = id_3,
                                    })
                                end
                            elseif i6.target ~= "ThisServer" then
                                table.insert(u618, {
                                    field = "target",
                                    message = "Choose a supported target.",
                                    cueId = id_3,
                                })
                            elseif v5 and i6.target == "EventLobbies" and not table.find(v5.contexts, "Lobby") then
                                table.insert(u618, {
                                    field = "target",
                                    message = "This action requires an event match.",
                                    cueId = id_3,
                                })
                            end
                            if i6.enabled
                                and i6.target == "ThisServer"
                                and v5
                                and not table.find(v5.contexts, v1.hostContext) then
                                table.insert(u618, {
                                    field = "target",
                                    message = "This Server action is unavailable in the planned host place.",
                                    cueId = id_3,
                                })
                            end
                            if i6.trigger == "Wave" and Selection.targetContext(v1, i6) == "Lobby" then
                                table.insert(u618, {
                                    field = "trigger",
                                    message = "Wave cues must target a match.",
                                    cueId = id_3,
                                })
                            end
                            table.insert(v9, {
                                id = i6.id,
                                section = i6.section,
                                actionId = actionId,
                                version = if not v5 then 1 else v5.version,
                                enabled = i6.enabled,
                                trigger = i6.trigger,
                                at = i6.at,
                                target = i6.target,
                                parameters = v6 or {},
                            })
                        else
                            table.insert(u618, {
                                field = "cues",
                                message = "Cue " .. (tostring(i5)) .. " has unsupported fields.",
                            })
                        end
                        break
                    end
                    if true then
                        id_2 = i6.id
                        v4 = false
                        if type(id_2) == "string" then
                            v4 = false
                            if #id_2 <= 64 then
                                v4 = string.find(id_2, "%S") ~= nil
                            end
                        end
                        if v4 then
                            v4 = true
                            if id_2 ~= "" then
                                v4 = string.match(id_2, "^[%w_%-]+$") ~= nil
                            end
                        end
                        id_3 = if not v4 then nil else i6.id
                        if not id_3 then
                            table.insert(u618, {
                                field = "id",
                                message = "Every cue needs a unique identifier.",
                                cueId = id_3,
                            })
                        elseif not v11[id_3] then
                            v11[id_3] = true
                        else
                            table.insert(u618, {
                                field = "id",
                                message = "Every cue needs a unique identifier.",
                                cueId = id_3,
                            })
                        end
                        section = i6.section
                        v4 = false
                        if type(section) == "string" then
                            v4 = false
                            if #section <= 48 then
                                v4 = true
                            end
                        end
                        if not v4 then
                            table.insert(u618, {
                                field = "section",
                                message = "Section names must be at most 48 characters.",
                                cueId = id_3,
                            })
                        end
                        if type(i6.enabled) ~= "boolean" then
                            table.insert(u618, {
                                field = "enabled",
                                message = "Choose whether this cue is enabled.",
                                cueId = id_3,
                            })
                        elseif i6.enabled then
                            v12 = v12 + 1
                        end
                        actionId = i6.actionId
                        parameters = i6.parameters
                        if actionId == "teleport-players-to-game" then
                            actionId = "teleport-to-event"
                        elseif actionId == "add-game-modifier"
                            and type(parameters) == "table"
                            and parameters.name == "RandomTowerPositions" then
                            actionId = "random-tower-placement"
                            parameters = table.clone(parameters)
                            parameters.name = nil
                        end
                        v5 = if type(actionId) ~= "string" then nil else Definitions.ById[actionId]
                        v6, v7 = u20.parameters(actionId, parameters)
                        if v7 then
                            table.insert(u618, {field = "parameters", message = v7, cueId = id_3})
                        end
                        if v5 and i6.version ~= nil and i6.version ~= v5.version then
                            table.insert(u618, {
                                field = "version",
                                message = "This action version is unavailable. Re-select the action and rehearse again.",
                                cueId = id_3,
                            })
                        end
                        if i6.trigger == "Start" or i6.trigger == "Time" or i6.trigger == "Wave" then
                            if not u20.finite(i6.at) or i6.at < 0 or Definitions.MaxDuration < i6.at then
                                table.insert(u618, {
                                    field = "at",
                                    message = "Cue timing is outside its permitted range.",
                                    cueId = id_3,
                                })
                            elseif i6.trigger == "Wave" then
                                at_2 = i6.at
                                v8 = u20.finite(at_2)
                                if v8 then
                                    v8 = false
                                    if at_2 % 1 == 0 then
                                        v8 = false
                                        if at_2 >= 1 then
                                            v8 = at_2 <= 1000
                                        end
                                    end
                                end
                                if not v8 then
                                    table.insert(u618, {
                                        field = "at",
                                        message = "Cue timing is outside its permitted range.",
                                        cueId = id_3,
                                    })
                                end
                            end
                        elseif i6.trigger ~= "Manual" then
                            table.insert(u618, {
                                field = "trigger",
                                message = "Choose a supported cue trigger.",
                                cueId = id_3,
                            })
                        elseif not u20.finite(i6.at) or i6.at < 0 or Definitions.MaxDuration < i6.at then
                            table.insert(u618, {
                                field = "at",
                                message = "Cue timing is outside its permitted range.",
                                cueId = id_3,
                            })
                        elseif i6.trigger == "Wave" then
                            at_2 = i6.at
                            v8 = u20.finite(at_2)
                            if v8 then
                                v8 = false
                                if at_2 % 1 == 0 then
                                    v8 = false
                                    if at_2 >= 1 then
                                        v8 = at_2 <= 1000
                                    end
                                end
                            end
                            if not v8 then
                                table.insert(u618, {
                                    field = "at",
                                    message = "Cue timing is outside its permitted range.",
                                    cueId = id_3,
                                })
                            end
                        end
                        if i6.target == "EventLobbies" or i6.target == "EventMatches" then
                            if v5 and i6.target == "EventLobbies" and not table.find(v5.contexts, "Lobby") then
                                table.insert(u618, {
                                    field = "target",
                                    message = "This action requires an event match.",
                                    cueId = id_3,
                                })
                            end
                        elseif i6.target ~= "ThisServer" then
                            table.insert(u618, {field = "target", message = "Choose a supported target.", cueId = id_3})
                        elseif v5 and i6.target == "EventLobbies" and not table.find(v5.contexts, "Lobby") then
                            table.insert(u618, {
                                field = "target",
                                message = "This action requires an event match.",
                                cueId = id_3,
                            })
                        end
                        if i6.enabled
                            and i6.target == "ThisServer"
                            and v5
                            and not table.find(v5.contexts, v1.hostContext) then
                            table.insert(u618, {
                                field = "target",
                                message = "This Server action is unavailable in the planned host place.",
                                cueId = id_3,
                            })
                        end
                        if i6.trigger == "Wave" and Selection.targetContext(v1, i6) == "Lobby" then
                            table.insert(u618, {
                                field = "trigger",
                                message = "Wave cues must target a match.",
                                cueId = id_3,
                            })
                        end
                        table.insert(v9, {
                            id = i6.id,
                            section = i6.section,
                            actionId = actionId,
                            version = if not v5 then 1 else v5.version,
                            enabled = i6.enabled,
                            trigger = i6.trigger,
                            at = i6.at,
                            target = i6.target,
                            parameters = v6 or {},
                        })
                    else
                        table.insert(u618, {
                            field = "cues",
                            message = "Cue " .. (tostring(i5)) .. " has unsupported fields.",
                        })
                    end
                end
            end
            if v2 and v12 == 0 then
                table.insert(u618, {field = "cues", message = "Enable at least one cue before rehearsing or starting."})
            end
            if #u618 > 0 then
                return nil, u618
            end
            return {
                schemaVersion = 1,
                id = v1.id,
                name = v1.name,
                revision = v1.revision,
                seed = v1.seed,
                hostContext = v1.hostContext,
                cues = v9,
            }, u618
        end
        v9 = true
        if v9 then
            if a1.hostContext ~= "Lobby" and a1.hostContext ~= "Game" then
                table.insert(u618, {
                    field = "hostContext",
                    message = "Choose the Lobby or Game host and save a new revision.",
                })
            end
            if a1.schemaVersion ~= Definitions.SchemaVersion then
                table.insert(u618, {
                    field = "schemaVersion",
                    message = "This event format is not supported by this server.",
                })
            end
            id = a1.id
            v9 = false
            if type(id) == "string" then
                v9 = false
                if #id <= 64 then
                    v9 = true
                end
            end
            if v9 then
                v9 = true
                if id ~= "" then
                    v9 = string.match(id, "^[%w_%-]+$") ~= nil
                end
            end
            if not v9 then
                table.insert(u618, {field = "id", message = "The event identifier is invalid."})
            end
            name = a1.name
            v9 = false
            if type(name) == "string" then
                v9 = false
                if #name <= 64 then
                    v9 = string.find(name, "%S") ~= nil
                end
            end
            if not v9 then
                table.insert(u618, {field = "name", message = "Give the event a name of at most 64 characters."})
            end
            revision = a1.revision
            v9 = u20.finite(revision)
            if v9 then
                v9 = false
                if revision % 1 == 0 then
                    v9 = false
                    if revision >= 0 then
                        v9 = revision <= 1000000000
                    end
                end
            end
            if not v9 then
                table.insert(u618, {field = "revision", message = "The event revision is invalid."})
            end
            seed = a1.seed
            v9 = u20.finite(seed)
            if v9 then
                v9 = false
                if seed % 1 == 0 then
                    v9 = false
                    if seed >= 1 then
                        v9 = seed <= 2147483646
                    end
                end
            end
            if not v9 then
                table.insert(u618, {
                    field = "seed",
                    message = "The rehearsal seed must be a positive integer below 2147483647.",
                })
            end
            if not isArray(a1.cues, Definitions.MaxCues) then
                table.insert(u618, {field = "cues", message = "An event can contain at most 64 ordered cues."})
                return nil, u618
            end
            v9 = {}
            v11 = {}
            v12 = 0
            cues = a1.cues
            v13 = nil
            v10 = nil
            v2, v1 = a2, a1
            for i8, i9 in cues, v13, v10 do
                if type(i9) ~= "table" then
                    table.insert(u618, {
                        field = "cues",
                        message = "Cue " .. (tostring(i8)) .. " has unsupported fields.",
                    })
                else
                    v4 = {
                        id = true,
                        section = true,
                        actionId = true,
                        version = true,
                        enabled = true,
                        trigger = true,
                        at = true,
                        target = true,
                        parameters = true,
                    }
                    v5 = nil
                    v6 = nil
                    for i10 in i9, v5, v6 do
                        if type(i10) ~= "string" then
                            v3 = false
                        elseif v4[i10] then
                            continue
                        else
                            v3 = false
                        end
                        if v3 then
                            id_2 = i9.id
                            v4 = false
                            if type(id_2) == "string" then
                                v4 = false
                                if #id_2 <= 64 then
                                    v4 = string.find(id_2, "%S") ~= nil
                                end
                            end
                            if v4 then
                                v4 = true
                                if id_2 ~= "" then
                                    v4 = string.match(id_2, "^[%w_%-]+$") ~= nil
                                end
                            end
                            id_3 = if not v4 then nil else i9.id
                            if not id_3 then
                                table.insert(u618, {
                                    field = "id",
                                    message = "Every cue needs a unique identifier.",
                                    cueId = id_3,
                                })
                            elseif not v11[id_3] then
                                v11[id_3] = true
                            else
                                table.insert(u618, {
                                    field = "id",
                                    message = "Every cue needs a unique identifier.",
                                    cueId = id_3,
                                })
                            end
                            section = i9.section
                            v4 = false
                            if type(section) == "string" then
                                v4 = false
                                if #section <= 48 then
                                    v4 = true
                                end
                            end
                            if not v4 then
                                table.insert(u618, {
                                    field = "section",
                                    message = "Section names must be at most 48 characters.",
                                    cueId = id_3,
                                })
                            end
                            if type(i9.enabled) ~= "boolean" then
                                table.insert(u618, {
                                    field = "enabled",
                                    message = "Choose whether this cue is enabled.",
                                    cueId = id_3,
                                })
                            elseif i9.enabled then
                                v12 = v12 + 1
                            end
                            actionId = i9.actionId
                            parameters = i9.parameters
                            if actionId == "teleport-players-to-game" then
                                actionId = "teleport-to-event"
                            elseif actionId == "add-game-modifier"
                                and type(parameters) == "table"
                                and parameters.name == "RandomTowerPositions" then
                                actionId = "random-tower-placement"
                                parameters = table.clone(parameters)
                                parameters.name = nil
                            end
                            v5 = if type(actionId) ~= "string" then nil else Definitions.ById[actionId]
                            v6, v7 = u20.parameters(actionId, parameters)
                            if v7 then
                                table.insert(u618, {field = "parameters", message = v7, cueId = id_3})
                            end
                            if v5 and i9.version ~= nil and i9.version ~= v5.version then
                                table.insert(u618, {
                                    field = "version",
                                    message = "This action version is unavailable. Re-select the action and rehearse again.",
                                    cueId = id_3,
                                })
                            end
                            if i9.trigger == "Start" or i9.trigger == "Time" or i9.trigger == "Wave" then
                                if not u20.finite(i9.at) or i9.at < 0 or Definitions.MaxDuration < i9.at then
                                    table.insert(u618, {
                                        field = "at",
                                        message = "Cue timing is outside its permitted range.",
                                        cueId = id_3,
                                    })
                                elseif i9.trigger == "Wave" then
                                    at_2 = i9.at
                                    v8 = u20.finite(at_2)
                                    if v8 then
                                        v8 = false
                                        if at_2 % 1 == 0 then
                                            v8 = false
                                            if at_2 >= 1 then
                                                v8 = at_2 <= 1000
                                            end
                                        end
                                    end
                                    if not v8 then
                                        table.insert(u618, {
                                            field = "at",
                                            message = "Cue timing is outside its permitted range.",
                                            cueId = id_3,
                                        })
                                    end
                                end
                            elseif i9.trigger ~= "Manual" then
                                table.insert(u618, {
                                    field = "trigger",
                                    message = "Choose a supported cue trigger.",
                                    cueId = id_3,
                                })
                            elseif not u20.finite(i9.at) or i9.at < 0 or Definitions.MaxDuration < i9.at then
                                table.insert(u618, {
                                    field = "at",
                                    message = "Cue timing is outside its permitted range.",
                                    cueId = id_3,
                                })
                            elseif i9.trigger == "Wave" then
                                at_2 = i9.at
                                v8 = u20.finite(at_2)
                                if v8 then
                                    v8 = false
                                    if at_2 % 1 == 0 then
                                        v8 = false
                                        if at_2 >= 1 then
                                            v8 = at_2 <= 1000
                                        end
                                    end
                                end
                                if not v8 then
                                    table.insert(u618, {
                                        field = "at",
                                        message = "Cue timing is outside its permitted range.",
                                        cueId = id_3,
                                    })
                                end
                            end
                            if i9.target == "EventLobbies" or i9.target == "EventMatches" then
                                if v5 and i9.target == "EventLobbies" and not table.find(v5.contexts, "Lobby") then
                                    table.insert(u618, {
                                        field = "target",
                                        message = "This action requires an event match.",
                                        cueId = id_3,
                                    })
                                end
                            elseif i9.target ~= "ThisServer" then
                                table.insert(u618, {
                                    field = "target",
                                    message = "Choose a supported target.",
                                    cueId = id_3,
                                })
                            elseif v5 and i9.target == "EventLobbies" and not table.find(v5.contexts, "Lobby") then
                                table.insert(u618, {
                                    field = "target",
                                    message = "This action requires an event match.",
                                    cueId = id_3,
                                })
                            end
                            if i9.enabled
                                and i9.target == "ThisServer"
                                and v5
                                and not table.find(v5.contexts, v1.hostContext) then
                                table.insert(u618, {
                                    field = "target",
                                    message = "This Server action is unavailable in the planned host place.",
                                    cueId = id_3,
                                })
                            end
                            if i9.trigger == "Wave" and Selection.targetContext(v1, i9) == "Lobby" then
                                table.insert(u618, {
                                    field = "trigger",
                                    message = "Wave cues must target a match.",
                                    cueId = id_3,
                                })
                            end
                            table.insert(v9, {
                                id = i9.id,
                                section = i9.section,
                                actionId = actionId,
                                version = if not v5 then 1 else v5.version,
                                enabled = i9.enabled,
                                trigger = i9.trigger,
                                at = i9.at,
                                target = i9.target,
                                parameters = v6 or {},
                            })
                        else
                            table.insert(u618, {
                                field = "cues",
                                message = "Cue " .. (tostring(i8)) .. " has unsupported fields.",
                            })
                        end
                        break
                    end
                    if true then
                        id_2 = i9.id
                        v4 = false
                        if type(id_2) == "string" then
                            v4 = false
                            if #id_2 <= 64 then
                                v4 = string.find(id_2, "%S") ~= nil
                            end
                        end
                        if v4 then
                            v4 = true
                            if id_2 ~= "" then
                                v4 = string.match(id_2, "^[%w_%-]+$") ~= nil
                            end
                        end
                        id_3 = if not v4 then nil else i9.id
                        if not id_3 then
                            table.insert(u618, {
                                field = "id",
                                message = "Every cue needs a unique identifier.",
                                cueId = id_3,
                            })
                        elseif not v11[id_3] then
                            v11[id_3] = true
                        else
                            table.insert(u618, {
                                field = "id",
                                message = "Every cue needs a unique identifier.",
                                cueId = id_3,
                            })
                        end
                        section = i9.section
                        v4 = false
                        if type(section) == "string" then
                            v4 = false
                            if #section <= 48 then
                                v4 = true
                            end
                        end
                        if not v4 then
                            table.insert(u618, {
                                field = "section",
                                message = "Section names must be at most 48 characters.",
                                cueId = id_3,
                            })
                        end
                        if type(i9.enabled) ~= "boolean" then
                            table.insert(u618, {
                                field = "enabled",
                                message = "Choose whether this cue is enabled.",
                                cueId = id_3,
                            })
                        elseif i9.enabled then
                            v12 = v12 + 1
                        end
                        actionId = i9.actionId
                        parameters = i9.parameters
                        if actionId == "teleport-players-to-game" then
                            actionId = "teleport-to-event"
                        elseif actionId == "add-game-modifier"
                            and type(parameters) == "table"
                            and parameters.name == "RandomTowerPositions" then
                            actionId = "random-tower-placement"
                            parameters = table.clone(parameters)
                            parameters.name = nil
                        end
                        v5 = if type(actionId) ~= "string" then nil else Definitions.ById[actionId]
                        v6, v7 = u20.parameters(actionId, parameters)
                        if v7 then
                            table.insert(u618, {field = "parameters", message = v7, cueId = id_3})
                        end
                        if v5 and i9.version ~= nil and i9.version ~= v5.version then
                            table.insert(u618, {
                                field = "version",
                                message = "This action version is unavailable. Re-select the action and rehearse again.",
                                cueId = id_3,
                            })
                        end
                        if i9.trigger == "Start" or i9.trigger == "Time" or i9.trigger == "Wave" then
                            if not u20.finite(i9.at) or i9.at < 0 or Definitions.MaxDuration < i9.at then
                                table.insert(u618, {
                                    field = "at",
                                    message = "Cue timing is outside its permitted range.",
                                    cueId = id_3,
                                })
                            elseif i9.trigger == "Wave" then
                                at_2 = i9.at
                                v8 = u20.finite(at_2)
                                if v8 then
                                    v8 = false
                                    if at_2 % 1 == 0 then
                                        v8 = false
                                        if at_2 >= 1 then
                                            v8 = at_2 <= 1000
                                        end
                                    end
                                end
                                if not v8 then
                                    table.insert(u618, {
                                        field = "at",
                                        message = "Cue timing is outside its permitted range.",
                                        cueId = id_3,
                                    })
                                end
                            end
                        elseif i9.trigger ~= "Manual" then
                            table.insert(u618, {
                                field = "trigger",
                                message = "Choose a supported cue trigger.",
                                cueId = id_3,
                            })
                        elseif not u20.finite(i9.at) or i9.at < 0 or Definitions.MaxDuration < i9.at then
                            table.insert(u618, {
                                field = "at",
                                message = "Cue timing is outside its permitted range.",
                                cueId = id_3,
                            })
                        elseif i9.trigger == "Wave" then
                            at_2 = i9.at
                            v8 = u20.finite(at_2)
                            if v8 then
                                v8 = false
                                if at_2 % 1 == 0 then
                                    v8 = false
                                    if at_2 >= 1 then
                                        v8 = at_2 <= 1000
                                    end
                                end
                            end
                            if not v8 then
                                table.insert(u618, {
                                    field = "at",
                                    message = "Cue timing is outside its permitted range.",
                                    cueId = id_3,
                                })
                            end
                        end
                        if i9.target == "EventLobbies" or i9.target == "EventMatches" then
                            if v5 and i9.target == "EventLobbies" and not table.find(v5.contexts, "Lobby") then
                                table.insert(u618, {
                                    field = "target",
                                    message = "This action requires an event match.",
                                    cueId = id_3,
                                })
                            end
                        elseif i9.target ~= "ThisServer" then
                            table.insert(u618, {field = "target", message = "Choose a supported target.", cueId = id_3})
                        elseif v5 and i9.target == "EventLobbies" and not table.find(v5.contexts, "Lobby") then
                            table.insert(u618, {
                                field = "target",
                                message = "This action requires an event match.",
                                cueId = id_3,
                            })
                        end
                        if i9.enabled
                            and i9.target == "ThisServer"
                            and v5
                            and not table.find(v5.contexts, v1.hostContext) then
                            table.insert(u618, {
                                field = "target",
                                message = "This Server action is unavailable in the planned host place.",
                                cueId = id_3,
                            })
                        end
                        if i9.trigger == "Wave" and Selection.targetContext(v1, i9) == "Lobby" then
                            table.insert(u618, {
                                field = "trigger",
                                message = "Wave cues must target a match.",
                                cueId = id_3,
                            })
                        end
                        table.insert(v9, {
                            id = i9.id,
                            section = i9.section,
                            actionId = actionId,
                            version = if not v5 then 1 else v5.version,
                            enabled = i9.enabled,
                            trigger = i9.trigger,
                            at = i9.at,
                            target = i9.target,
                            parameters = v6 or {},
                        })
                    else
                        table.insert(u618, {
                            field = "cues",
                            message = "Cue " .. (tostring(i8)) .. " has unsupported fields.",
                        })
                    end
                end
            end
            if v2 and v12 == 0 then
                table.insert(u618, {field = "cues", message = "Enable at least one cue before rehearsing or starting."})
            end
            if #u618 > 0 then
                return nil, u618
            end
            return {
                schemaVersion = 1,
                id = v1.id,
                name = v1.name,
                revision = v1.revision,
                seed = v1.seed,
                hostContext = v1.hostContext,
                cues = v9,
            }, u618
        end
    end
    return nil, {{message = "Event definition contains unsupported fields."}}
end

function u20.validate(a1) -- Line: 285 -- upvalues: u20 (val)
    local v1
    _, v1 = u20.normalize(a1, true)
    return v1
end

function u20.hostIssues(a1, a2) -- Line: 290 -- types: a2: string
    if a1.hostContext ~= a2 then
        return {
            {
                field = "hostContext",
                message = "Start this show from its saved host place: " .. (tostring(a1.hostContext)) .. ".",
            },
        }
    end
    return {}
end

return u20