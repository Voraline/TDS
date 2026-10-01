-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.EventDirector.story
-- Decompile time: 6.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Definitions = require(ReplicatedStorage.Shared.Modules.LiveEvents.Definitions)
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
require(script.Parent.Types)
local createElement = React.createElement
local u31 = {
    schemaVersion = 1,
    id = "fixture_event",
    hostContext = "Lobby",
    name = "Admin Abuse · Opening",
    revision = 3,
    seed = 20260925,
}
u31.cues = {
    {
        id = "welcome",
        section = "Opening",
        actionId = "add-dialogue",
        version = 1,
        enabled = true,
        trigger = "Start",
        at = 0,
        target = "EventLobbies",
        parameters = Definitions.defaults("add-dialogue"),
    },
    {
        id = "blackout",
        section = "Opening",
        actionId = "blackout",
        version = 1,
        enabled = true,
        trigger = "Time",
        at = 12,
        target = "EventLobbies",
        parameters = Definitions.defaults("blackout"),
    },
    {
        id = "reverse",
        section = "Match surprise",
        actionId = "reverse-enemies",
        version = 1,
        enabled = true,
        trigger = "Wave",
        at = 3,
        target = "EventMatches",
        parameters = Definitions.defaults("reverse-enemies"),
    },
    {
        id = "finale",
        section = "Finale",
        actionId = "black-hole",
        version = 1,
        enabled = false,
        trigger = "Manual",
        at = 0,
        target = "EventMatches",
        parameters = Definitions.defaults("black-hole"),
    },
}
local u51 = table.clone(u31)
u51.id = "fixture_practice"
u51.name = "My rehearsal"
local u54 = {
    schemaVersion = 1,
    id = "",
    hostContext = "Lobby",
    name = "New practice sequence",
    revision = 0,
    seed = 1,
    cues = {},
}
local u56 = {}
u56[u31.id] = u31.revision

local function DirectorStory(a1) -- Line: 81
    -- upvalues: React (val), u31 (val), u51 (val), u54 (val), u56 (val), createElement (val), Parent (val)
    -- upvalues: Definitions (val)
    local host = a1.host
    local u12, u13 = React.useState(if not host.controls.emptyLibrary then {u31, u51} else {})
    local u26, u27 = React.useState(if not host.controls.emptyLibrary then if not host.controls.live then u51 else u31 else u54)
    local v1, u32 = React.useState(0)
    local u36 = React.useRef(0)
    local useState_3 = React.useState
    local v2 = {phase = "Idle", environment = "UI Labs fixture", eventId = u31.id}
    local v3 = {}
    v3[u31.id] = u31.revision
    v2.testedRevisions = v3
    v2.results = {}
    local u48, u49 = useState_3(v2)
    local u60 = if host.controls.noBroadcastModes then {} else if not host.controls.normalPveModes then {"Event"} else {"Hardcore", "Survival"}
    local v4 = table.clone(u48)
    v4.broadcastModes = u60
    v4.authoredRevisions = u56
    local studio = host.controls.studio or u48.rehearsal == true
    v4.localOnly = studio
    v4.environment = if not host.controls.studio then if not host.controls.live then "UI Labs published test fixture" else "UI Labs live fixture" else "UI Labs Studio fixture"
    if host.controls.failed then
        v4.error = "Fixture: the server rejected the request. No command was applied."
    end
    if host.controls.stopPending then
        v4.phase = "Stopped"
        v4.commandMode = true
        v4.stopPending = true
        v4.runId = "fixture_pending_stop"
        v4.effects = {}
    end
    if not host.controls.locallyTested then
        v4.testedRevisions = {}
    end
    local v5 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(7, 10, 16),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local v6 = if not host.controls.smallScreen then UDim2.fromScale(1, 1) else UDim2.fromOffset(390, 700)
    v5.Size = v6
    return createElement("Frame", v5, {
        FixtureLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            Text = "UI LABS FIXTURE · no game actions",
            TextSize = 13,
            Size = UDim2.new(1, 0, 0, 24),
            TextColor3 = Color3.fromRGB(195, 208, 226),
        }),
        Panel = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(0, 24),
            Size = UDim2.new(1, 0, 1, -24),
        }, {
            Director = createElement(Parent, {
                actions = Definitions.Actions,
                events = u12,
                initialEvent = u26,
                selectionVersion = v1,
                status = v4,
                busy = host.controls.pending,
                capabilities = {
                    canSave = not host.controls.live,
                    canRehearse = not host.controls.live,
                    canHost = host.controls.live,
                    canRunCommands = not host.controls.unavailable or host.controls.studio and not host.controls.live,
                    canBroadcast = not host.controls.studio and not host.controls.unavailable,
                    broadcastModes = u60,
                    broadcastUnavailableReason = if not host.controls.studio then if not host.controls.unavailable then nil else "Fixture: live events are disabled in this experience's config." else "Fixture: Studio cannot send cross-server commands. Open the lobby in the Roblox app.",
                    placeContext = if not host.controls.lobby then "Game" else "Lobby",
                    commandUnavailableReason = if not host.controls.unavailable then nil else "Fixture: live events are disabled in deployment configuration.",
                },
                onSelectEvent = function(a1) -- Line: 98 -- upvalues: u27 (val), u32 (val)
                    u27(a1)
                    u32(function(a1) -- Line: 100
                        return a1 + 1
                    end)
                end,
                onDuplicate = function(a1) -- Line: 178 -- upvalues: u27 (val), u32 (val)
                    local v1 = table.clone(a1)
                    v1.id = ""
                    v1.name = v1.name .. " (copy)"
                    v1.revision = 0
                    u27(v1)
                    u32(function(a1) -- Line: 100
                        return a1 + 1
                    end)
                end,
                onSave = function(a1, a2, a3) -- Line: 185 -- upvalues: host (val), u12 (val), u13 (val), u27 (val), u32 (val), u49 (val)
                    if host.controls.failed then
                        return
                    end
                    local v1 = table.clone(a1)
                    local id = if a1.id ~= "" then a1.id else ("fixture_%*"):format(#u12 + 1)
                    v1.id = id
                    v1.revision = a2 + 1
                    local v2 = {}
                    for i, j in u12 do
                        if j.id ~= v1.id then
                            table.insert(v2, j)
                        end
                    end
                    table.insert(v2, v1)
                    u13(v2)
                    u27(v1)
                    u32(function(a1) -- Line: 100
                        return a1 + 1
                    end)
                    local v3 = {
                        environment = "UI Labs fixture",
                        phase = if not a3 then "Idle" else "Rehearsing",
                    }
                    v3.rehearsal = a3 ~= nil
                    v3.eventId = v1.id
                    v3.revision = v1.revision
                    v3.runId = if not a3 then nil else "fixture_rehearsal"
                    v3.currentCueId = if not a3 then nil else a3.cueId or v1.cues[1] and v1.cues[1].id
                    v3.nextCueId = if not a3 then nil else if not v1.cues[2] then nil else v1.cues[2].id
                    v3.results = {}
                    u49(v3)
                end,
                onRefresh = function() -- Line: 217 -- upvalues: u26 (val), u27 (val), u32 (val)
                    u27(u26)
                    u32(function(a1) -- Line: 100
                        return a1 + 1
                    end)
                end,
                onRehearse = function(a1, a2) -- Line: 220 -- upvalues: u49 (val)
                    local v1
                    local v2 = {
                        phase = "Rehearsing",
                        rehearsal = true,
                        runId = "fixture_rehearsal",
                        environment = "UI Labs fixture",
                    }
                    local cueId = a2.cueId or a1.cues[1] and a1.cues[1].id
                    v2.currentCueId = cueId
                    v2.nextCueId = if a2.scope ~= "event" then nil else if not a1.cues[2] then nil else a1.cues[2].id
                    v2.eventId = a1.id
                    v2.revision = a1.revision
                    if a2.scope ~= "event" then
                        v1 = {}
                    else
                        v1 = {}
                        v1[a1.id] = a1.revision
                    end
                    v2.testedRevisions = v1
                    v1 = {}
                    local v3 = {
                        status = "Applied",
                        message = "Local fixture result only; clears with this session",
                    }
                    local cueId_2 = a2.cueId or a1.cues[1].id
                    v3.cueId = cueId_2
                    v1[1] = v3
                    v2.results = v1
                    u49(v2)
                end,
                onRunCommand = function(a1) -- Line: 244 -- upvalues: host (val), u36 (val), u48 (val), Definitions (upval), u60 (val), u49 (val)
                    if host.controls.failed then
                        return
                    end
                    local v1 = u36
                    v1.current = v1.current + 1
                    v1 = ("fixture_command_%*"):format(u36.current)
                    local lobby = true
                    if a1.target ~= "ThisServer" then
                        if a1.target ~= "EventLobbies" then
                            lobby = false
                            if a1.target == "EventMatches" then
                                lobby = not host.controls.lobby
                            end
                        else
                            lobby = host.controls.lobby
                            if not lobby then
                                lobby = false
                                if a1.target == "EventMatches" then
                                    lobby = not host.controls.lobby
                                end
                            end
                        end
                    end
                    local v2 = table.clone(u48)
                    v2.commandMode = true
                    v2.rehearsal = false
                    v2.phase = "Running"
                    v2.runId = "fixture_commands"
                    v2.name = "Live commands"
                    v2.currentCueId = v1
                    v2.nextCueId = nil
                    v2.message = if a1.target ~= "ThisServer" then ("Fixture: %* sent to %*. Remote execution is not confirmed."):format(
                        Definitions.ById[a1.actionId].label,
                        if a1.target ~= "EventMatches" then "all Event lobbies" else ("all configured game servers (%*)"):format((table.concat(u60, ", ")))
                    ) else "Fixture: accepted on this server."
                    v2.results = table.clone(u48.results or {})
                    table.insert(v2.results, {
                        id = v1,
                        cueId = v1,
                        actionId = a1.actionId,
                        status = if not lobby then "Skipped" else "Applied",
                        message = if not lobby then "This command targets the other place." else "UI Labs fixture only; no gameplay was changed.",
                    })
                    v2.effects = table.clone(u48.effects or {})
                    if lobby and type(a1.parameters.duration) == "number" then
                        table.insert(v2.effects, {id = v1, label = Definitions.ById[a1.actionId].label})
                    end
                    u49(v2)
                end,
                onAction = function(a1) -- Line: 286
                    -- upvalues: u48 (val), u49 (val), u26 (val), u13 (val), u31 (upval), u51 (upval), u27 (val)
                    -- upvalues: u32 (val)
                    local v1 = table.clone(u48)
                    if a1 == "send-live-message" then
                        v1.message = "Preview only: no live message was broadcast."
                        u49(v1)
                        return
                    end
                    v1.phase = if a1 ~= "stop" then if a1 ~= "end" then "Rehearsing" else "Ended" else "Stopped"
                    v1.held = a1 == "hold"
                    if a1 == "start" then
                        v1.commandMode = false
                        v1.rehearsal = false
                        v1.runId = "fixture_run"
                        v1.eventId = u26.id
                        v1.revision = u26.revision
                        local id = u26.cues[1] and u26.cues[1].id
                        v1.currentCueId = id
                        local id_2 = u26.cues[2] and u26.cues[2].id
                        v1.nextCueId = id_2
                    elseif a1 == "next" then
                        v1.currentCueId = v1.nextCueId
                        v1.nextCueId = nil
                    elseif a1 == "end" or a1 == "stop" or a1 == "reset" then
                        v1.runId = nil
                        v1.currentCueId = nil
                        v1.nextCueId = nil
                        v1.effects = {}
                    end
                    if a1 == "reset" then
                        u13({u31, u51})
                        u27(u31)
                        u32(function(a1) -- Line: 100
                            return a1 + 1
                        end)
                        v1.testedRevisions = {}
                        v1.results = {}
                    end
                    u49(v1)
                end,
            }),
        }),
    })
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {
        emptyLibrary = false,
        failed = false,
        pending = false,
        smallScreen = false,
        locallyTested = true,
        live = true,
        studio = false,
        lobby = true,
        unavailable = false,
        stopPending = false,
        normalPveModes = false,
        noBroadcastModes = false,
    },
    story = function(a1) -- Line: 328 -- upvalues: createElement (val), DirectorStory (val)
        return createElement(DirectorStory, {
            key = ("%*:%*:%*"):format(a1.controls.emptyLibrary, a1.controls.live, a1.controls.lobby),
            host = a1,
        })
    end,
}