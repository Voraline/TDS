-- Script path: ReplicatedStorage.Shared.Modules.LiveEvents.Commands
-- Decompile time: 3.92 ms

local Definitions = require(script.Parent.Definitions)
local Validation = require(script.Parent.Validation)
local v1 = {}
local u11 = {
    operation = true,
    requestId = true,
    actionId = true,
    version = true,
    target = true,
    parameters = true,
    runId = true,
    controlRevision = true,
}

function v1.normalize(a1, a2) -- Line: 19
    -- upvalues: u11 (val), Validation (val), Definitions (val)
    if type(a1) ~= "table" then
        return nil, "Invalid command request."
    end
    local v1 = a1
    local v2 = nil
    for i in v1, nil, v2 do
        if not u11[i] then
            return nil, "Command request contains an unsupported field."
        end
    end
    if a1.operation == "run-command"
        and type(a1.requestId) == "string"
        and #a1.requestId == 36
        and string.match(a1.requestId, "^[%w_%-]+$") then
        local v3, v4, v5
        if a2 ~= "Lobby" and a2 ~= "Game" then
            return nil, "This place cannot run event commands."
        end
        if a1.runId == nil then
            if a1.controlRevision ~= nil then
                if a1.controlRevision ~= 0 then
                    return nil, "The command session version is invalid."
                end
            end
            v3, v4 = a1, a2
            v1 = if type(v3.actionId) ~= "string" then nil else Definitions.ById[v3.actionId]
            if v1 and v3.version == v1.version then
                if v3.target == "ThisServer" then
                    if not table.find(v1.contexts, v4) then
                        return nil, "This command is unavailable in the selected place."
                    end
                    v2, v5 = Validation.parameters(v3.actionId, v3.parameters)
                    if not v2 then
                        return nil, v5
                    end
                    return {
                        section = "",
                        enabled = true,
                        trigger = "Manual",
                        at = 0,
                        id = "command-" .. v3.requestId,
                        actionId = v1.id,
                        version = v1.version,
                        target = v3.target,
                        parameters = v2,
                    }, nil
                end
                if v3.target == "EventLobbies" then
                    if not table.find(v1.contexts, "Lobby") then
                        return nil, "This command is unavailable in the selected place."
                    end
                    v2, v5 = Validation.parameters(v3.actionId, v3.parameters)
                    if not v2 then
                        return nil, v5
                    end
                    return {
                        section = "",
                        enabled = true,
                        trigger = "Manual",
                        at = 0,
                        id = "command-" .. v3.requestId,
                        actionId = v1.id,
                        version = v1.version,
                        target = v3.target,
                        parameters = v2,
                    }, nil
                end
                if v3.target ~= "EventMatches" then
                    return nil, "Choose a supported command target."
                end
                if not table.find(v1.contexts, "Game") then
                    return nil, "This command is unavailable in the selected place."
                end
                v2, v5 = Validation.parameters(v3.actionId, v3.parameters)
                if not v2 then
                    return nil, v5
                end
                return {
                    section = "",
                    enabled = true,
                    trigger = "Manual",
                    at = 0,
                    id = "command-" .. v3.requestId,
                    actionId = v1.id,
                    version = v1.version,
                    target = v3.target,
                    parameters = v2,
                }, nil
            end
            return nil, "This command version is unavailable. Reload the command catalog."
        end
        if type(a1.runId) == "string" then
            v1 = #a1.runId
            if not (v1 > 64)
                and string.match(a1.runId, "^[%w_%-]+$")
                and Validation.finite(a1.controlRevision)
                and not (a1.controlRevision < 0)
                and a1.controlRevision % 1 == 0 then
                v3, v4 = a1, a2
                v1 = if type(v3.actionId) ~= "string" then nil else Definitions.ById[v3.actionId]
                if v1 and v3.version == v1.version then
                    if v3.target == "ThisServer" then
                        if not table.find(v1.contexts, v4) then
                            return nil, "This command is unavailable in the selected place."
                        end
                        v2, v5 = Validation.parameters(v3.actionId, v3.parameters)
                        if not v2 then
                            return nil, v5
                        end
                        return {
                            section = "",
                            enabled = true,
                            trigger = "Manual",
                            at = 0,
                            id = "command-" .. v3.requestId,
                            actionId = v1.id,
                            version = v1.version,
                            target = v3.target,
                            parameters = v2,
                        }, nil
                    end
                    if v3.target == "EventLobbies" then
                        if not table.find(v1.contexts, "Lobby") then
                            return nil, "This command is unavailable in the selected place."
                        end
                        v2, v5 = Validation.parameters(v3.actionId, v3.parameters)
                        if not v2 then
                            return nil, v5
                        end
                        return {
                            section = "",
                            enabled = true,
                            trigger = "Manual",
                            at = 0,
                            id = "command-" .. v3.requestId,
                            actionId = v1.id,
                            version = v1.version,
                            target = v3.target,
                            parameters = v2,
                        }, nil
                    end
                    if v3.target ~= "EventMatches" then
                        return nil, "Choose a supported command target."
                    end
                    if not table.find(v1.contexts, "Game") then
                        return nil, "This command is unavailable in the selected place."
                    end
                    v2, v5 = Validation.parameters(v3.actionId, v3.parameters)
                    if not v2 then
                        return nil, v5
                    end
                    return {
                        section = "",
                        enabled = true,
                        trigger = "Manual",
                        at = 0,
                        id = "command-" .. v3.requestId,
                        actionId = v1.id,
                        version = v1.version,
                        target = v3.target,
                        parameters = v2,
                    }, nil
                end
                return nil, "This command version is unavailable. Reload the command catalog."
            end
        end
        return nil, "The command session version is invalid."
    end
    return nil, "Invalid command request."
end

function v1.eligible(a1, a2, a3, a4) -- Line: 92 -- upvalues: Definitions (val), Validation (val) -- types: a4: number?
    if type(a2) == "table" and type(a2.originServer) == "string" then
        if a2.originContext ~= "Game" and a2.originContext ~= "Lobby" then
            return false, "Command delivery metadata is unavailable."
        end
        local v1 = Definitions.ById[a1.actionId]
        if v1 and table.find(v1.contexts, a3.context) then
            if (if a1.target ~= "ThisServer" then if a1.target ~= "EventLobbies" then if a1.target ~= "EventMatches" then nil else "Game" else "Lobby" else a2.originContext) ~= a3.context then
                return false, "This command targets the other place."
            end
            if a1.target == "ThisServer" and a2.originServer ~= a3.serverId then
                return false, "This command targets the issuing server."
            end
            if Validation.finite(a4) and Validation.finite(a3.eligibleSince) and not (a4 < a3.eligibleSince) then
                return true, nil
            end
            return false, "This server or match joined after the command was issued."
        end
        return false, "This command belongs in the other place."
    end
    return false, "Command delivery metadata is unavailable."
end

return v1