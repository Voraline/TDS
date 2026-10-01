-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.EventDirector
-- Decompile time: 9.32 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Definitions = require(ReplicatedStorage.Shared.Modules.LiveEvents.Definitions)
local EventDirector = require(script.Parent.Parent.Components.EventDirector)
local EventDirectorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.EventDirectorStore)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
require(script.Parent.Parent.Components.EventDirector.Types)
local useAtomSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtomSelector)
local useReplicatorValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatorValue)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
local createElement = React.createElement
local EventDirector_2 = NewNetwork.Channel("EventDirector")
local u70 = {
    schemaVersion = 1,
    id = "",
    name = "New practice sequence",
    hostContext = "Lobby",
    revision = 0,
    seed = 1,
    cues = {},
}

local function useDirectorRequests() -- Line: 59 -- upvalues: React (val), EventDirector_2 (val), HttpService (val)
    local u3 = React.useRef(true)
    local u7 = React.useRef({})
    local u11 = React.useRef({})
    local v1, u16 = React.useState(0)
    local v2, u21 = React.useState(false)
    local v3, u26 = React.useState(nil)
    local v4, u31 = React.useState(nil)
    React.useEffect(function() -- Line: 68 -- upvalues: u3 (val), u7 (val)
        u3.current = true
        return function() -- Line: 70 -- upvalues: u3 (upval), u7 (upval)
            u3.current = false
            for i in u7.current do
                pcall(task.cancel, i)
            end
            table.clear(u7.current)
        end
    end, {})
    local u41 = React.useCallback(function(a1) -- Line: 79
        -- upvalues: u3 (val), u16 (val), u26 (val), u31 (val), EventDirector_2 (upval), u7 (val), u11 (val), u21 (val)
        if u3.current and not a1.inFlight and not a1.settled then
            a1.inFlight = true
            u16(function(a1) -- Line: 84
                return a1 + 1
            end)
            u26(nil)
            u31(nil)
            local u15 = nil
            u15 = task.defer(function() -- Line: 90
                -- upvalues: EventDirector_2 (upval), a1 (val), u7 (upval), u15 (ref), u3 (upval), u16 (upval)
                -- upvalues: u11 (upval), u21 (upval), u26 (upval), u31 (upval)
                local success, result = pcall(function() -- Line: 91 -- upvalues: EventDirector_2 (upval), a1 (upval)
                    return EventDirector_2:invokeServer("Request", a1.body)
                end)
                u7.current[u15] = nil
                a1.inFlight = false
                if not u3.current then
                    return
                end
                u16(function(a1) -- Line: 99
                    return a1 - 1
                end)
                if success
                    and type(result) == "table"
                    and type(result.ok) == "boolean"
                    and result.retryable ~= true then
                    a1.settled = true
                    for i, j in u11.current do
                        if j.body.requestId == a1.body.requestId then
                            table.remove(u11.current, i)
                            break
                        end
                    end
                    u21(#u11.current > 0)
                    if not result.ok then
                        u26((tostring(result.error or "The server rejected this request.")))
                        return
                    end
                    local data = result.data or {}
                    u31(data.message)
                    a1.onSuccess(data)
                    return
                end
                local v1 = false
                local v2 = nil
                for k, n in u11.current, nil, v2 do
                    if n.body.requestId == a1.body.requestId then
                        v1 = true
                    end
                end
                if not v1 then
                    v2 = a1
                    table.insert(u11.current, v2)
                end
                u21(true)
                u26(if not success or type(result) ~= "table" then "The request was not confirmed. Retry the same request before making further changes." else if type(result.error) ~= "string" then "The request was not confirmed. Retry the same request before making further changes." else result.error)
            end)
            u7.current[u15] = true
            return
        end
    end, {})
    local v5 = {u41}
    local v6 = {u41}
    return (React.useCallback(function(a1, a2, a3) -- Line: 149
        -- upvalues: HttpService (upval), u41 (val)
        local v1 = table.clone(a2 or {})
        v1.operation = a1
        v1.requestId = HttpService:GenerateGUID(false)
        u41({body = v1, onSuccess = a3})
    end, v5)), (React.useCallback(function() -- Line: 158 -- upvalues: u11 (val), u41 (val)
        if u11.current[1] then
            u41(u11.current[1])
        end
    end, v6)), v1 > 0, v2, v3, v4
end

return function(a1) -- Line: 167
    -- upvalues: React (val), u70 (val), useAtomSelector (val), EventDirectorStore (val), useDirectorRequests (val)
    -- upvalues: useTagReplicatorInstance (val), useReplicatorValue (val), EventDirector_2 (val), createElement (val)
    -- upvalues: EventDirector (val), Definitions (val)
    local v1, u5 = React.useState({})
    local v2, u10 = React.useState(u70)
    local u14 = React.useRef(u70)
    local v3, u19 = React.useState(0)
    local u23, u24 = React.useState(false)
    local u28 = React.useRef(0)
    local u33 = useAtomSelector(EventDirectorStore.getState, function(a1) -- Line: 174
        return a1.open
    end)
    local Connecting_2, Connecting = React.useState("Connecting")
    local v4, u43 = React.useState({
        canSave = false,
        canRehearse = false,
        canHost = false,
        canRunCommands = false,
        canBroadcast = false,
    })
    local u45, u46, u47, u48, v5, v6 = useDirectorRequests()
    local u60 = useReplicatorValue(useTagReplicatorInstance(a1.screen.Parent, "EventDirectorState", "EventDirectorState"), "Snapshot")
    local u65 = React.useCallback(function(a1) -- Line: 190 -- upvalues: u14 (val), u10 (val), u19 (val)
        u14.current = a1
        u10(a1)
        u19(function(a1) -- Line: 193
            return a1 + 1
        end)
    end, {})
    local v7 = {u45, u65}
    local u72 = React.useCallback(function(a1) -- Line: 198
        -- upvalues: u45 (val), u24 (val), u5 (val), u70 (upval), u14 (val), u65 (val), Connecting (val), u43 (val)
        u45("bootstrap", nil, function(a1_2) -- Line: 199
            -- upvalues: u24 (upval), u5 (upval), a1 (val), u70 (upval), u14 (upval), u65 (upval), Connecting (upval)
            -- upvalues: u43 (upval)
            u24(true)
            u5(a1_2.events or {})
            if a1 then
                local v1 = u70
                for i, j in a1_2.events or {} do
                    if j.id == u14.current.id then
                        v1 = j
                        break
                    end
                end
                u65(v1)
            end
            Connecting(a1_2.environment or "Unknown environment")
            u43({
                canSave = a1_2.canSave == true,
                canRehearse = a1_2.canRehearse == true,
                canHost = a1_2.canHost == true,
                canRunCommands = a1_2.canRunCommands == true,
                canBroadcast = a1_2.canBroadcast == true,
                broadcastModes = a1_2.broadcastModes,
                broadcastUnavailableReason = a1_2.broadcastUnavailableReason,
                placeContext = a1_2.placeContext,
                commandUnavailableReason = a1_2.commandUnavailableReason,
            })
        end)
    end, v7)
    local useEffect = React.useEffect
    local v8 = {a1.screen}
    useEffect(function() -- Line: 229 -- upvalues: a1 (val)
        local Attribute = a1.screen:GetAttribute("LiveEventControl")
        a1.screen:SetAttribute("LiveEventControl", true)
        return function() -- Line: 232 -- upvalues: a1 (upval), Attribute (val)
            a1.screen:SetAttribute("LiveEventControl", Attribute)
        end
    end, v8)
    local useEffect_2 = React.useEffect
    v8 = {a1.screen, a1.setDisplayOrder, u33}
    useEffect_2(function() -- Line: 237 -- upvalues: u33 (val), a1 (val)
        if not u33 then
            return
        end
        local DisplayOrder = a1.screen.DisplayOrder
        a1.setDisplayOrder(900000)
        return function() -- Line: 243 -- upvalues: a1 (upval), DisplayOrder (val)
            a1.screen.DisplayOrder = DisplayOrder
        end
    end, v8)
    v8 = {u23, u60}
    React.useEffect(function() -- Line: 248 -- upvalues: EventDirectorStore (upval), u23 (val), u60 (val)
        EventDirectorStore.setAvailable(u23 or u60 ~= nil)
    end, v8)
    React.useEffect(function() -- Line: 252 -- upvalues: EventDirectorStore (upval)
        return function() -- Line: 253 -- upvalues: EventDirectorStore (upval)
            EventDirectorStore.setAvailable(false)
            EventDirectorStore.setOpen(false)
        end
    end, {})
    v8 = {u72}
    React.useEffect(function() -- Line: 259 -- upvalues: EventDirector_2 (upval), EventDirectorStore (upval), u72 (val)
        local u0 = true
        local u1 = nil
        local u4 = task.defer(function() -- Line: 262
            -- upvalues: u1 (ref), EventDirector_2 (upval), u0 (ref), EventDirectorStore (upval), u72 (upval)
            u1 = EventDirector_2:onEvent("Open", function() -- Line: 263 -- upvalues: u0 (upval), EventDirectorStore (upval), u72 (upval)
                if u0 then
                    EventDirectorStore.setOpen(true)
                    u72()
                end
            end)
            if u0 then
                u72()
                return
            end
            if u1 then
                u1()
            end
        end)
        return function() -- Line: 275 -- upvalues: u0 (ref), u4 (val), u1 (ref)
            u0 = false
            pcall(task.cancel, u4)
            if u1 then
                u1()
            end
        end
    end, v8)
    v8 = {u23, u47, u48, u46}
    React.useEffect(function() -- Line: 284 -- upvalues: u23 (val), u47 (val), u48 (val), u28 (val), u46 (val)
        if not u23 and not u47 and u48 and not (3 <= u28.current) then
            local u15 = task.delay(math.min(u28.current + 1, 2), function() -- Line: 289 -- upvalues: u28 (upval), u46 (upval)
                local v1 = u28
                v1.current = v1.current + 1
                u46()
            end)
            return function() -- Line: 293 -- upvalues: u15 (val)
                pcall(task.cancel, u15)
            end
        end
    end, v8)
    local v9 = table.clone(u60 or {phase = "Hydrating", environment = Connecting_2})
    v9.error = v5 or v9.error
    v9.message = v6
    v7 = table.clone(v4)
    local canSave = v4.canSave and u60 ~= nil
    v7.canSave = canSave
    local canRehearse = v4.canRehearse and u60 ~= nil
    v7.canRehearse = canRehearse
    local canHost = v4.canHost and u60 ~= nil
    v7.canHost = canHost
    local canRunCommands = false
    if u60 ~= nil then
        canRunCommands = if u60.canRunCommands == nil then v4.canRunCommands == true else u60.canRunCommands
    end
    v7.canRunCommands = canRunCommands
    local canBroadcast = false
    if u60 ~= nil then
        canBroadcast = if u60.canBroadcast == nil then v4.canBroadcast == true else u60.canBroadcast
    end
    v7.canBroadcast = canBroadcast
    local broadcastModes = if not u60 then v4.broadcastModes else if not u60.broadcastModes then v4.broadcastModes else u60.broadcastModes
    v7.broadcastModes = broadcastModes
    if u60 and u60.canBroadcast ~= nil then
        v7.broadcastUnavailableReason = u60.broadcastUnavailableReason
    end
    if u60 and u60.canRunCommands ~= nil then
        v7.commandUnavailableReason = u60.commandUnavailableReason
    end
    if not u23 and not u60 then
        return nil
    end
    local Fragment = React.Fragment
    local v10 = {}
    local v11 = u33 and createElement("Frame", {
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        Active = true,
        BackgroundColor3 = Color3.new(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
    }, {
        Director = createElement(EventDirector, {
            actions = Definitions.Actions,
            events = v1,
            initialEvent = v2,
            selectionVersion = v3,
            status = v9,
            busy = u47,
            retryable = u48,
            onRetry = u46,
            capabilities = v7,
            onSelectEvent = u65,
            onDuplicate = function(a1) -- Line: 364 -- upvalues: u65 (val)
                local v1 = table.clone(a1)
                v1.id = ""
                v1.revision = 0
                v1.name = (string.sub(v1.name, 1, 57)) .. " (copy)"
                u65(v1)
            end,
            onSave = function(a1, a2, a3) -- Line: 371 -- upvalues: u45 (val), u5 (val), u65 (val)
                u45("save", {event = a1, expectedRevision = a2}, function(a1) -- Line: 375 -- upvalues: u5 (upval), u65 (upval), a3 (val), u45 (upval)
                    if a1.events then
                        u5(a1.events)
                    end
                    if a1.event then
                        u65(a1.event)
                        if a3 then
                            u45("test", {
                                eventId = a1.event.id,
                                expectedRevision = a1.event.revision,
                                scope = a3.scope,
                                cueId = a3.cueId,
                                section = a3.section,
                            }, function() end)
                        end
                    end
                end)
            end,
            onRefresh = function() -- Line: 396 -- upvalues: u72 (val)
                u72(true)
            end,
            onRehearse = function(a1, a2) -- Line: 399 -- upvalues: u45 (val)
                u45("test", {
                    eventId = a1.id,
                    expectedRevision = a1.revision,
                    scope = a2.scope,
                    cueId = a2.cueId,
                    section = a2.section,
                }, function() end)
            end,
            onRunCommand = function(a1) -- Line: 408 -- upvalues: u45 (val), u60 (val)
                u45("run-command", {
                    actionId = a1.actionId,
                    version = a1.version,
                    target = a1.target,
                    parameters = a1.parameters,
                    runId = if not u60 then nil else u60.runId,
                    controlRevision = if not u60 then nil else u60.controlRevision,
                }, function() end)
            end,
            onAction = function(a1, a2) -- Line: 334 -- upvalues: u60 (val), u45 (val) -- types: a1: string, a2: table?
                local v1 = table.clone(a2 or {})
                v1.expectedRevision = v1.revision
                v1.revision = nil
                if a1 ~= "start" then
                    v1.runId = if not u60 then nil else u60.runId
                    v1.controlRevision = if not u60 then nil else u60.controlRevision
                end
                u45(a1, v1, function() end)
            end,
            onClose = function() -- Line: 419 -- upvalues: EventDirectorStore (upval)
                EventDirectorStore.setOpen(false)
            end,
        }),
    })
    v10.Panel = v11
    return createElement(Fragment, {}, v10)
end