-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector
-- Decompile time: 38.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ActionPicker = require(script.ActionPicker)
local CommandsPanel = require(script.CommandsPanel)
local Controls = require(script.Controls)
local CueInspector = require(script.CueInspector)
local CueSheet = require(script.CueSheet)
local React = require(ReplicatedStorage.Shared.UI.React)
local RunPanel = require(script.RunPanel)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local Theme = require(script.Theme)
require(script.Types)
local Validation = require(ReplicatedStorage.Shared.Modules.LiveEvents.Validation)
local WindowFrame = require(script.Parent.Inventory.WindowFrame)
local createElement = React.createElement
local u61 = {
    schemaVersion = 1,
    id = "",
    name = "New practice sequence",
    hostContext = "Lobby",
    revision = 0,
    seed = 1,
    cues = {},
}
local u63 = {phase = "Idle", environment = "Not connected"}
local u64 = {canSave = false, canRehearse = false, canHost = false}
local u65 = {"Build", "Rehearse", "Live"}
local u69 = {"Commands", "Sequences"}
local u72 = {"Sequence", "Command"}

local function copyEvent(a1) -- Line: 55
    local v1
    local v2 = table.clone(a1)
    v2.cues = {}
    for i, j in a1.cues do
        v1 = table.clone(j)
        v1.parameters = table.clone(j.parameters)
        table.insert(v2.cues, v1)
    end
    return v2
end

local function tabs(a1, a2, a3) -- Line: 66
    -- upvalues: createElement (val), Controls (val)
    local Button, v1
    local v2 = {
        Layout = createElement("UIGridLayout", {
            CellPadding = UDim2.fromOffset(8, 0),
            CellSize = UDim2.new(1 / #a1, (#a1 - 1) * -8 / #a1, 0, 48),
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    }
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        Button = Controls.Button
        v1 = {
            text = j,
            selected = a2 == j,
            order = i,
            onActivated = function() -- Line: 79 -- upvalues: a3 (val), j (val)
                a3(j)
            end,
        }
        v2[j] = (createElement(Button, v1))
    end
    return v2
end

local function EventEditor(a1) -- Line: 89
    -- upvalues: u61 (val), React (val), copyEvent (val), u63 (val), u64 (val), Validation (val), createElement (val)
    -- upvalues: Controls (val), Theme (val), CueSheet (val), CueInspector (val), CommandsPanel (val)
    -- upvalues: ActionPicker (val), tabs (val), u72 (val), RunPanel (val), WindowFrame (val), TextLabel (val)
    -- upvalues: u69 (val), u65 (val)
    local authoredRevisions, id_2, v1, v2, v3
    local initialEvent = a1.initialEvent
    if not initialEvent then
        initialEvent = u61
    end
    local u1983, u3026 = React.useState(function() -- Line: 91 -- upvalues: copyEvent (upval), initialEvent (val)
        return (copyEvent(initialEvent))
    end)
    local u3001, u3030 = React.useState(false)
    local v4, u3041 = React.useState(if not u1983.cues[1] then nil else u1983.cues[1].id)
    local mode = a1.mode
    local onModeChange = a1.onModeChange
    local v5 = mode == "Commands"
    local Sequence_2, Sequence = React.useState("Sequence")
    local u3073, u2992 = React.useState(nil)
    local v6, u3088 = React.useState(false)
    local v7, v8 = React.useState("")
    local u3098, u3004 = React.useState(nil)
    local u60 = React.useRef(1)
    local status = a1.status
    if not status then
        status = u63
    end
    local capabilities = a1.capabilities
    if not capabilities then
        capabilities = u64
    end
    local u2983 = true
    if a1.busy ~= true then
        u2983 = a1.retryable == true
    end
    local v9 = false
    if status.authoredRevisions ~= nil then
        v9 = status.authoredRevisions[u1983.id] ~= nil
    end
    local u97 = u2983
    if not u97 then
        u97 = not capabilities.canSave
        if not u97 then
            u97 = v9
        end
    end
    _, v1 = Validation.normalize(u1983, false)
    local v10 = if not a1.validate then v1 else a1.validate(u1983)
    local u3130 = Validation.validate(u1983)
    local u3224 = nil
    local u3225 = nil
    local v11 = {}
    for i, j in u1983.cues do
        if j.id == v4 then
            u3224 = j
            u3225 = i
        end
    end
    for k, n in v10 do
        if n.cueId == v4 then
            table.insert(v11, n)
        end
    end
    local u3149 = true
    if status.stopPending ~= true then
        u3149 = false
        if status.runId ~= nil then
            u3149 = false
            if status.phase ~= "Stopped" then
                u3149 = false
                if status.phase ~= "Ended" then
                    u3149 = status.phase ~= "Idle"
                end
            end
        end
    end
    local canRehearse = capabilities.canRehearse or capabilities.canHost

    local function edit(a1) -- Line: 137 -- upvalues: u97 (val), u3026 (val), u3030 (val)
        if u97 then
            return
        end
        u3026(a1)
        u3030(true)
    end

    local function editCue(a1) -- Line: 145 -- upvalues: u1983 (val), u97 (val), u3026 (val), u3030 (val)
        local v1 = table.clone(u1983)
        v1.cues = table.clone(u1983.cues)
        for i, j in v1.cues do
            if j.id == a1.id then
                v1.cues[i] = a1
                break
            end
        end
        if u97 then
            return
        end
        u3026(v1)
        u3030(true)
    end

    local function navigate(a1, a2) -- Line: 157
        -- upvalues: u3001 (val), u3004 (val)
        if u3001 then
            u3004({label = a1, run = a2})
            return
        end
        a2()
    end

    local function newCueId() -- Line: 165 -- upvalues: u1983 (val), u60 (val)
        local v1 = {}
        local v2 = nil
        for i, j in u1983.cues, v2 do
            v1[j.id] = true
        end
        local v3 = ("cue_%*"):format(u60.current)
        while v1[v3] do
            v2 = u60
            v2.current = v2.current + 1
            v3 = ("cue_%*"):format(u60.current)
        end
        v2 = u60
        v2.current = v2.current + 1
        return v3
    end

    local function addCue(a1) -- Line: 179
        -- upvalues: u97 (val), newCueId (val), u3224 (ref), u1983 (val), u3225 (ref), u3026 (val), u3030 (val)
        -- upvalues: u3041 (val), Sequence (val), u2992 (val)
        if u97 then
            return
        end
        local v1 = {}
        for i, j in a1.fields do
            v1[j.key] = j.default
        end
        local v2 = {enabled = true, trigger = "Manual", at = 0, id = newCueId()}
        v2.section = if not u3224 then "Opening" else u3224.section
        v2.actionId = a1.id
        v2.version = a1.version
        v2.target = if a1.defaultTarget ~= "ThisServer" then if not table.find(a1.contexts, "Game") then "EventLobbies" else "EventMatches" else if not table.find(a1.contexts, u1983.hostContext) then if not table.find(a1.contexts, "Game") then "EventLobbies" else "EventMatches" else "ThisServer"
        v2.parameters = v1
        local v3 = table.clone(u1983)
        v3.cues = table.clone(u1983.cues)
        table.insert(v3.cues, if not u3225 then #v3.cues + 1 else u3225 + 1, v2)
        if not u97 then
            u3026(v3)
            u3030(true)
        end
        u3041(v2.id)
        Sequence("Command")
        u2992(nil)
    end

    local function moveCue(a1) -- Line: 215
        -- upvalues: u3225 (ref), u1983 (val), u97 (val), u3026 (val), u3030 (val)
        if not u3225 then
            return
        end
        local v1 = u3225 + a1
        if not (v1 < 1) and not (#u1983.cues < v1) then
            local v2 = table.clone(u1983)
            v2.cues = table.clone(u1983.cues)
            local cues_3 = v2.cues
            local v3 = u3225
            local cues = v2.cues
            local v4 = v2.cues[v1]
            local v5 = v2.cues[u3225]
            cues_3[v3] = v4
            cues[v1] = v5
            if u97 then
                return
            end
            u3026(v2)
            u3030(true)
            return
        end
    end

    local function rehearse(a1_2) -- Line: 230
        -- upvalues: u2983 (val), capabilities (val), u3130 (val), u3149 (val), onModeChange (val), u2992 (val)
        -- upvalues: u3001 (val), u1983 (val), a1 (val), copyEvent (upval), initialEvent (val)
        if not u2983 and capabilities.canRehearse and not (#u3130 > 0) and not u3149 then
            onModeChange("Rehearse")
            u2992(nil)
            if not u3001 and u1983.revision ~= 0 then
                a1.onRehearse(u1983, a1_2)
                return
            end
            a1.onSave(copyEvent(u1983), initialEvent.revision, a1_2)
            return
        end
    end

    local function selectEvent(a1_2) -- Line: 243 -- upvalues: onModeChange (val), a1 (val), u3001 (val), u3004 (val)
        if u3001 then
            u3004({
                label = "open another show",
                run = function() -- Line: 244 -- upvalues: onModeChange (upval), a1 (upval), a1_2 (val)
                    onModeChange("Build")
                    a1.onSelectEvent(a1_2)
                end,
            })
            return
        end
        onModeChange("Build")
        a1.onSelectEvent(a1_2)
    end

    local v12 = {
        Title = createElement(Controls.Text, {text = "Choose a show", strong = true, size = 24, order = 1}),
    }
    v12.Back = createElement(Controls.Button, {
        text = "Back to sequence",
        order = 2,
        onActivated = function() -- Line: 258 -- upvalues: u2992 (val)
            u2992(nil)
        end,
    })
    local Button_2 = Controls.Button
    local v13 = {text = "New practice sequence", primary = true, order = 3}
    local v14 = u2983 or not capabilities.canSave
    v13.disabled = v14

    function v13.onActivated() -- Line: 267
        -- upvalues: copyEvent (upval), u61 (upval), onModeChange (val), a1 (val), u3001 (val), u3004 (val)
        local u2 = copyEvent(u61)
        if u3001 then
            u3004({
                label = "open another show",
                run = function() -- Line: 244 -- upvalues: onModeChange (upval), a1 (upval), u2 (val)
                    onModeChange("Build")
                    a1.onSelectEvent(u2)
                end,
            })
            return
        end
        onModeChange("Build")
        a1.onSelectEvent(u2)
    end

    v12.New = createElement(Button_2, v13)
    v12.Search = createElement(Controls.Input, {label = "Find a show", order = 4, value = v7, onChanged = v8})
    v12.Refresh = createElement(Controls.Button, {
        text = "Refresh shows",
        order = 5,
        disabled = u2983,
        onActivated = function() -- Line: 279 -- upvalues: a1 (val), u3001 (val), u3004 (val)
            local onRefresh = a1.onRefresh
            if u3001 then
                u3004({label = "refresh the shows", run = onRefresh})
                return
            end
            onRefresh()
        end,
    })
    local v15 = 0
    v13 = nil
    v14 = nil
    for m, i5 in a1.events, v13, v14 do
        if string.find(string.lower(i5.name), string.lower(v7), 1, true) then
            v15 = v15 + 1
            authoredRevisions = status.authoredRevisions and status.authoredRevisions[i5.id] == i5.revision
            id_2 = i5.id
            v12[id_2] = (createElement("Frame", {
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.Y,
                Size = UDim2.fromScale(1, 0),
                LayoutOrder = 10 + m,
            }, {
                Layout = createElement("UIListLayout", {Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder}),
                Name = createElement(Controls.Text, {strong = true, size = 20, order = 1, text = i5.name}),
                Kind = createElement(Controls.Text, {
                    order = 2,
                    text = ("%* · %* commands"):format(if not authoredRevisions then "Practice copy" else "Library show", #i5.cues),
                    color = Theme.muted,
                }),
                Open = createElement(Controls.Button, {
                    order = 3,
                    text = if i5.id ~= u1983.id then "Open show" else "Return to this show",
                    disabled = u2983,
                    onActivated = function() -- Line: 313
                        -- upvalues: i5 (val), u1983 (val), initialEvent (val), u2992 (val), onModeChange (val)
                        -- upvalues: a1 (val), u3001 (val), u3004 (val)
                        if i5.id == u1983.id and i5.revision == initialEvent.revision then
                            u2992(nil)
                            return
                        end
                        local u11 = i5
                        if u3001 then
                            u3004({
                                label = "open another show",
                                run = function() -- Line: 244 -- upvalues: onModeChange (upval), a1 (upval), u11 (val)
                                    onModeChange("Build")
                                    a1.onSelectEvent(u11)
                                end,
                            })
                            return
                        end
                        onModeChange("Build")
                        a1.onSelectEvent(u11)
                    end,
                }),
            }))
        end
    end
    if v15 == 0 then
        v12.Empty = createElement(Controls.Text, {
            order = 10,
            text = if #a1.events ~= 0 then "No shows match your search." else "No saved shows yet. Create a practice sequence to get started.",
            color = Theme.muted,
        })
    end
    local v16 = {
        Title = createElement(Controls.Text, {text = "Show settings", size = 24, strong = true, order = 1}),
    }
    v16.Back = createElement(Controls.Button, {
        text = "Back to sequence",
        order = 2,
        onActivated = function() -- Line: 342 -- upvalues: u2992 (val)
            u2992(nil)
        end,
    })
    v16.Name = createElement(Controls.Input, {
        label = "Show name",
        order = 3,
        value = u1983.name,
        disabled = u97,
        onChanged = function(a1) -- Line: 351 -- upvalues: u1983 (val), u97 (val), u3026 (val), u3030 (val)
            local v1 = table.clone(u1983)
            v1.name = a1
            if u97 then
                return
            end
            u3026(v1)
            u3030(true)
        end,
    })
    v16.Host = createElement(Controls.Select, {
        label = "Run the show from",
        order = 4,
        value = u1983.hostContext or "Game",
        options = {{id = "Lobby", label = "Lobby"}, {id = "Game", label = "Match"}},
        disabled = u97,
        onChanged = function(a1) -- Line: 363 -- upvalues: u1983 (val), u97 (val), u3026 (val), u3030 (val)
            if a1 ~= "Lobby" and a1 ~= "Game" then
                return
            end
            local v1 = table.clone(u1983)
            v1.hostContext = a1
            if u97 then
                return
            end
            u3026(v1)
            u3030(true)
        end,
    })
    v16.Seed = createElement(Controls.Input, {
        label = "Random seed",
        order = 5,
        value = tostring(u1983.seed),
        disabled = u97,
        onChanged = function(a1) -- Line: 376 -- upvalues: u1983 (val), u97 (val), u3026 (val), u3030 (val)
            local v1 = table.clone(u1983)
            v1.seed = tonumber(a1) or a1
            if u97 then
                return
            end
            u3026(v1)
            u3030(true)
        end,
    })
    v16.SeedHint = createElement(Controls.Text, {
        text = "Keep the same seed to repeat random choices during rehearsal.",
        order = 6,
        color = Theme.muted,
    })
    local Button_5 = Controls.Button
    local v17 = {text = "Make a practice copy", order = 7}
    local v18 = u2983 or not capabilities.canSave or u1983.id == ""
    v17.disabled = v18

    function v17.onActivated() -- Line: 391 -- upvalues: a1 (val), initialEvent (val), u3001 (val), u3004 (val)
        if u3001 then
            u3004({
                label = "make a practice copy",
                run = function() -- Line: 392 -- upvalues: a1 (upval), initialEvent (upval)
                    a1.onDuplicate(initialEvent)
                end,
            })
            return
        end
        a1.onDuplicate(initialEvent)
    end

    v16.Duplicate = createElement(Button_5, v17)
    v16.Storage = createElement(Controls.Text, {
        order = 8,
        text = if not v9 then "Practice copies and rehearsal results stay on this server and clear when it closes." else "Library show. Make a practice copy to edit it.",
        color = Theme.muted,
    })
    local canRehearse_2 = capabilities.canRehearse and createElement(Controls.Button, {
        text = "Fresh test match…",
        order = 9,
        disabled = u2983,
        onActivated = function() -- Line: 408 -- upvalues: u2992 (val)
            u2992("Reset")
        end,
    })
    v16.Reset = canRehearse_2
    v13 = {}
    local error = status.error and createElement(Controls.Text, {order = 0, text = status.error, color = Theme.warning})
    v13.Error = error
    v13.Title = createElement(Controls.Text, {
        size = 24,
        strong = true,
        order = 1,
        text = if #u1983.cues ~= 0 then ("Sequence · %* commands"):format(#u1983.cues) else "Build a rehearsal sequence",
    })
    v13.Guide = createElement(Controls.Text, {
        order = 2,
        text = if #u1983.cues ~= 0 then "Select a command to edit it. Manual commands run in this order when you click Next." else "Add a command, choose when it runs, then try it in a rehearsal.",
        color = Theme.muted,
    })
    local Button_7 = Controls.Button
    v18 = {
        order = 3,
        text = if #u1983.cues ~= 0 then "Add command" else "Add first command",
        primary = #u1983.cues == 0,
    }
    local v19 = u97 or #a1.actions == 0
    v18.disabled = v19

    function v18.onActivated() -- Line: 439 -- upvalues: u2992 (val)
        u2992("Commands")
    end

    v13.Add = createElement(Button_7, v18)
    v13.Copy = v9 and capabilities.canSave and createElement(Controls.Button, {
        text = "Make a practice copy",
        order = 4,
        disabled = u2983,
        onActivated = function() -- Line: 447 -- upvalues: a1 (val), initialEvent (val)
            a1.onDuplicate(initialEvent)
        end,
    })
    v13.Access = v9 and createElement(Controls.Text, {text = "Library show · make a practice copy to edit.", order = 5, color = Theme.muted})
    v14 = createElement
    v18 = {
        BackgroundTransparency = 1,
        LayoutOrder = 6,
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.fromScale(1, 0),
    }
    v19 = {
        Layout = createElement("UIListLayout", {Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder}),
    }
    local v20 = createElement
    local v21 = CueSheet
    local v22 = {
        cues = u1983.cues,
        actions = a1.actions,
        selectedCueId = v4,
        currentCueId = status.currentCueId,
        issues = v10,
        onSelect = function(a1) -- Line: 472 -- upvalues: u3041 (val), Sequence (val)
            u3041(a1)
            Sequence("Command")
        end,
    }
    v19.Cues = v20(v21, v22)
    v13.Sheet = v14("Frame", v18, v19)
    for i6, i7 in v10 do
        if not i7.cueId then
            v21 = ("Issue_%*"):format(i6)
            v13[v21] = (createElement(Controls.Text, {order = 7, text = i7.message, color = Theme.warning}))
        end
    end
    v14 = {}
    local error_2 = status.error and createElement(Controls.Text, {order = -1, text = status.error, color = Theme.warning})
    v14.Error = error_2
    v17 = createElement
    v18 = CueInspector
    v19 = {
        cue = u3224,
        hostContext = u1983.hostContext or "Game",
        actions = a1.actions,
        issues = v11,
        disabled = u97,
        onChange = editCue,
    }
    v14.Inspector = v17(v18, v19)
    if u3224 then
        local Button_9 = Controls.Button
        v19 = {
            primary = true,
            order = 100,
            text = if u3001 then "Save & try command" else if u1983.revision ~= 0 then "Try command" else "Save & try command",
        }
        v20 = not u3224.enabled
        if not v20 then
            v20 = u2983
            if not v20 then
                v20 = not capabilities.canRehearse
                if not v20 then
                    v20 = true
                    if not (#u3130 > 0) then
                        v20 = u3149
                    end
                end
            end
        end
        v19.disabled = v20

        function v19.onActivated() -- Line: 512 -- upvalues: rehearse (val), u3224 (ref)
            rehearse({scope = "cue", cueId = u3224.id})
        end

        v14.Try = createElement(Button_9, v19)
        v14.Tools = createElement(Controls.Text, {text = "Arrange command", strong = true, order = 101})
        v19 = {BackgroundTransparency = 1, LayoutOrder = 102, Size = UDim2.new(1, 0, 0, 48)}
        v20 = {
            Layout = createElement("UIGridLayout", {
                CellPadding = UDim2.fromOffset(8, 0),
                CellSize = UDim2.new(0.5, -4, 0, 48),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
        }
        local Button_10 = Controls.Button
        local v23 = {text = "Move up", order = 1}
        v2 = u97 or u3225 == 1
        v23.disabled = v2

        function v23.onActivated() -- Line: 531 -- upvalues: moveCue (val)
            moveCue(-1)
        end

        v20.Up = createElement(Button_10, v23)
        local Button_11 = Controls.Button
        v23 = {text = "Move down", order = 2}
        v2 = u97 or u3225 == #u1983.cues
        v23.disabled = v2

        function v23.onActivated() -- Line: 539 -- upvalues: moveCue (val)
            moveCue(1)
        end

        v20.Down = createElement(Button_11, v23)
        v14.Move = createElement("Frame", v19, v20)
        v14.Toggle = createElement(Controls.Button, {
            order = 103,
            text = if not u3224.enabled then "Include this command" else "Skip this command",
            disabled = u97,
            onActivated = function() -- Line: 549 -- upvalues: u3224 (ref), editCue (val)
                local v1 = table.clone(u3224)
                v1.enabled = not v1.enabled
                editCue(v1)
            end,
        })
        v14.Duplicate = createElement(Controls.Button, {
            text = "Duplicate command",
            order = 104,
            disabled = u97,
            onActivated = function() -- Line: 559
                -- upvalues: u3225 (ref), copyEvent (upval), u1983 (val), u3224 (ref), newCueId (val), u97 (val)
                -- upvalues: u3026 (val), u3030 (val), u3041 (val)
                if u3225 then
                    local v1 = copyEvent(u1983)
                    local v2 = table.clone(u3224)
                    v2.parameters = table.clone(u3224.parameters)
                    v2.id = newCueId()
                    table.insert(v1.cues, u3225 + 1, v2)
                    if not u97 then
                        u3026(v1)
                        u3030(true)
                    end
                    u3041(v2.id)
                end
            end,
        })
        v14.Remove = createElement(Controls.Button, {
            text = "Remove command",
            order = 105,
            disabled = u97,
            onActivated = function() -- Line: 575
                -- upvalues: u3225 (ref), u1983 (val), u97 (val), u3026 (val), u3030 (val), u3041 (val), Sequence (val)
                if u3225 then
                    local v1 = table.clone(u1983)
                    v1.cues = table.clone(u1983.cues)
                    table.remove(v1.cues, u3225)
                    if not u97 then
                        u3026(v1)
                        u3030(true)
                    end
                    local v2 = v1.cues[math.min(u3225, #v1.cues)]
                    u3041(if not v2 then nil else v2.id)
                    if not v2 then
                        Sequence("Sequence")
                    end
                end
            end,
        })
    end
    v17 = {}
    if v5 then
        v17.Commands = createElement(CommandsPanel, {
            actions = a1.actions,
            status = status,
            capabilities = capabilities,
            busy = u2983,
            onRunCommand = a1.onRunCommand,
            onSendLiveMessage = function(a1_2) -- Line: 599 -- upvalues: a1 (val)
                a1.onAction("send-live-message", {message = a1_2})
            end,
            onStop = function() -- Line: 602 -- upvalues: a1 (val)
                a1.onAction("stop")
            end,
        })
    elseif u3073 == "Library" then
        v17.Library = createElement(Controls.Scroll, {}, v12)
    elseif u3073 == "Settings" then
        v17.Settings = createElement(Controls.Scroll, {}, v16)
    elseif u3073 == "Commands" then
        v17.Commands = createElement(ActionPicker, {
            actions = a1.actions,
            disabled = u97,
            onAdd = addCue,
            onBack = function() -- Line: 615 -- upvalues: u2992 (val)
                u2992(nil)
            end,
        })
    elseif u3073 == "Reset" then
        local Scroll = Controls.Scroll
        v21 = {
            Title = createElement(Controls.Text, {text = "Start a fresh test match?", strong = true, size = 24, order = 1}),
            Warning = createElement(Controls.Text, {
                text = "This clears practice copies and rehearsal results on this server. Any active rehearsal will end.",
                order = 2,
                color = Theme.warning,
            }),
        }
        local Button_15 = Controls.Button
        v2 = {text = "Start fresh match", danger = true, order = 3}
        v3 = u2983 or not capabilities.canRehearse
        v2.disabled = v3

        function v2.onActivated() -- Line: 635 -- upvalues: a1 (val), u2992 (val)
            a1.onAction("reset")
            u2992(nil)
        end

        v21.Confirm = createElement(Button_15, v2)
        v21.Cancel = createElement(Controls.Button, {
            text = "Keep this match",
            order = 4,
            onActivated = function() -- Line: 643 -- upvalues: u2992 (val)
                u2992(nil)
            end,
        })
        v17.Reset = createElement(Scroll, {}, v21)
    elseif mode ~= "Build" then
        local Scroll_5 = Controls.Scroll
        v21 = {}
        v2 = {
            event = u1983,
            status = status,
            dirty = u3001,
            issues = u3130,
            busy = u2983,
            canRehearse = capabilities.canRehearse,
            canHost = capabilities.canHost,
            selectedCue = u3224,
            actions = a1.actions,
            onSelectCue = u3041,
            mode = if mode ~= "Live" then "Rehearse" else "Run",
            onRehearse = a1.onRehearse,
            onAction = a1.onAction,
        }
        v21[mode] = (createElement(RunPanel, v2))
        v22 = false
        if mode == "Rehearse" then
            v22 = u3001
            if v22 then
                local Button_17 = Controls.Button
                v2 = {text = "Save & rehearse", primary = true, order = -1}
                v3 = u2983
                if not v3 then
                    v3 = not capabilities.canRehearse
                    if not v3 then
                        v3 = true
                        if not (#u3130 > 0) then
                            v3 = u3149
                        end
                    end
                end
                v2.disabled = v3

                function v2.onActivated() -- Line: 693 -- upvalues: rehearse (val)
                    rehearse({scope = "event"})
                end

                v22 = createElement(Button_17, v2)
            end
        end
        v21.Save = v22
        v17.Run = createElement(Scroll_5, {}, v21)
    elseif #u1983.cues == 0 then
        v17.Empty = createElement(Controls.Scroll, {}, v13)
    elseif not v6 then
        v17.Sequence = createElement(Controls.Scroll, {size = UDim2.new(0.45, -6, 1, 0)}, v13)
        v17.Command = createElement(Controls.Scroll, {position = UDim2.new(0.45, 6, 0, 0), size = UDim2.new(0.55, -6, 1, 0)}, v14)
    else
        v17.Panes = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 48)}, (tabs(u72, Sequence_2, Sequence)))
        v17.Content = createElement(
            Controls.Scroll,
            {position = UDim2.fromOffset(0, 56), size = UDim2.new(1, 0, 1, -56)},
            if Sequence_2 ~= "Command" then v13 else v14
        )
    end
    if u3098 then
        v17 = {
            Confirm = createElement(Controls.Scroll, {}, {
                Message = createElement(Controls.Text, {
                    strong = true,
                    order = 1,
                    text = ("Discard unsaved changes and %*?"):format(u3098.label),
                    color = Theme.warning,
                }),
                Discard = createElement(Controls.Button, {
                    text = "Discard and continue",
                    danger = true,
                    order = 2,
                    onActivated = function() -- Line: 713 -- upvalues: u3030 (val), u3004 (val), u3098 (val)
                        u3030(false)
                        u3004(nil)
                        u3098.run()
                    end,
                }),
                Keep = createElement(Controls.Button, {
                    text = "Keep editing",
                    order = 3,
                    onActivated = function() -- Line: 722 -- upvalues: u3004 (val)
                        u3004(nil)
                    end,
                }),
            }),
        }
    end
    v18 = {}
    if u3149 then
        v18.Stop = createElement(Controls.Button, {
            danger = true,
            order = 1,
            text = if not status.stopPending then "Stop effects" else "Retry Stop",
            disabled = not canRehearse,
            onActivated = function() -- Line: 737 -- upvalues: a1 (val)
                a1.onAction("stop")
            end,
        })
        v18.Hold = not status.commandMode and createElement(Controls.Button, {
            order = 2,
            text = if not status.held then "Hold sequence" else "Resume",
            disabled = not canRehearse or u2983,
            onActivated = function() -- Line: 746 -- upvalues: a1 (val), status (val)
                a1.onAction(if not status.held then "hold" else "resume")
            end,
        })
    elseif mode == "Build" and not u3073 and #u1983.cues > 0 then
        local Button_22 = Controls.Button
        v21 = {order = 1, text = if not u3001 then "Saved" else "Save changes"}
        v22 = u97
        if not v22 then
            v22 = true
            if not (#v10 > 0) then
                v22 = not u3001 and 0 < u1983.revision
            end
        end
        v21.disabled = v22

        function v21.onActivated() -- Line: 755
            -- upvalues: a1 (val), copyEvent (upval), u1983 (val), initialEvent (val)
            a1.onSave(copyEvent(u1983), initialEvent.revision)
        end

        v18.Save = createElement(Button_22, v21)
        local Button_23 = Controls.Button
        v21 = {
            primary = true,
            order = 2,
            text = if u3001 then "Save & rehearse" else if u1983.revision ~= 0 then "Rehearse" else "Save & rehearse",
        }
        v22 = u2983 or not capabilities.canRehearse or #u3130 > 0
        v21.disabled = v22

        function v21.onActivated() -- Line: 764 -- upvalues: rehearse (val)
            rehearse({scope = "event"})
        end

        v18.Rehearse = createElement(Button_23, v21)
    end
    v18.Layout = createElement("UIGridLayout", {
        CellPadding = UDim2.fromOffset(8, 0),
        CellSize = UDim2.new(0.5, -4, 0, 48),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    v19 = if v5 then 0 else if u3149 then 82 else if mode ~= "Build" or u3073 then 30 else if not (#u1983.cues > 0) then 30 else 82
    v21 = (if not v5 then 268 else 132) + (if not a1.retryable then 0 else 56)
    v2 = {}
    v2.AnchorPoint = Vector2.new(0.5, 0.5)
    v2.BackgroundTransparency = 1
    v2.Position = UDim2.fromScale(0.5, 0.5)
    v2.Size = UDim2.new(1, -32, 1, -32)
    v2.Active = true
    v2.SelectionGroup = true

    v2[React.Change.AbsoluteSize] = function(a1) -- Line: 788 -- upvalues: u3088 (val)
        u3088(a1.AbsoluteSize.X < 900)
    end

    v3 = {Constraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(1320, 940)})}
    local v24 = {
        filterBackgroundTransparency = 0.12,
        size = UDim2.fromScale(1, 1),
        position = UDim2.new(),
        anchorPoint = Vector2.zero,
        filterSize = UDim2.new(1, 0, 0, 64),
    }
    local v25 = {
        Title = createElement(TextLabel, {
            Text = "EVENT DIRECTOR",
            TextSize = 24,
            TextScaled = false,
            Font = "GothamSSm",
            FontWeight = "Bold",
            StrokeTransparency = 0.35,
            StrokeThickness = 2,
            TextXAlignment = Enum.TextXAlignment.Left,
            AnchorPoint = Vector2.zero,
            Position = UDim2.fromOffset(18, 0),
            Size = UDim2.new(1, -112, 1, 0),
            StrokeColor = Color3.new(),
        }),
    }
    local onClose = a1.onClose and createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -80, 0, 8),
        Size = UDim2.fromOffset(68, 48),
    }, {
        Button = createElement(Controls.Button, {
            text = "Close",
            onActivated = function() -- Line: 821 -- upvalues: a1 (val), u3001 (val), u3004 (val)
                local onClose = a1.onClose
                if u3001 then
                    u3004({label = "close the director", run = onClose})
                    return
                end
                onClose()
            end,
        }),
    })
    v25.Close = onClose
    local v26 = {
        Workspaces = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(16, 72),
            Size = UDim2.new(1, -32, 0, 48),
        }, (tabs(u69, if not v5 then "Sequences" else "Commands", function(a1) -- Line: 837 -- upvalues: onModeChange (val), u2992 (val)
            onModeChange(if a1 ~= "Commands" then "Build" else "Commands")
            u2992(nil)
        end))),
    }
    v26.Summary = not v5 and createElement(TextLabel, {
        TextSize = 20,
        TextScaled = false,
        Font = "GothamSSm",
        FontWeight = "Bold",
        Text = u1983.name,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        AnchorPoint = Vector2.zero,
        Position = UDim2.fromOffset(16, 128),
        Size = UDim2.new(1, -32, 0, 26),
    })
    v26.Toolbar = not v5 and createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(16, 158),
        Size = UDim2.new(1, -32, 0, 36),
    }, {
        Kind = createElement(TextLabel, {
            TextSize = 14,
            TextScaled = false,
            Text = if not v9 then "Practice · this server" else "Library show",
            FontFace = Theme.font,
            TextColor3 = Theme.muted,
            TextXAlignment = Enum.TextXAlignment.Left,
            AnchorPoint = Vector2.zero,
            Position = UDim2.new(),
            Size = UDim2.new(1, -160, 1, 0),
        }),
        Library = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -156, 0, -6),
            Size = UDim2.fromOffset(74, 48),
        }, {
            Button = createElement(Controls.Button, {
                text = "Shows",
                disabled = u2983,
                onActivated = function() -- Line: 879 -- upvalues: u2992 (val), u3073 (val)
                    u2992(if u3073 ~= "Library" then "Library" else nil)
                end,
            }),
        }),
        Settings = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.new(1, -74, 0, -6),
            Size = UDim2.fromOffset(74, 48),
        }, {
            Button = createElement(Controls.Button, {
                text = "Settings",
                onActivated = function() -- Line: 891 -- upvalues: u2992 (val), u3073 (val)
                    u2992(if u3073 ~= "Settings" then "Settings" else nil)
                end,
            }),
        }),
    })
    v26.Tabs = not v5 and createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(16, 212),
        Size = UDim2.new(1, -32, 0, 48),
    }, (tabs(u65, mode, function(a1) -- Line: 904 -- upvalues: onModeChange (val), u2992 (val)
        onModeChange(a1)
        u2992(nil)
    end)))
    local retryable = a1.retryable and a1.onRetry and createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(16, v20),
        Size = UDim2.new(1, -32, 0, 48),
    }, {
        Button = createElement(Controls.Button, {text = "Retry unconfirmed request", disabled = a1.busy, onActivated = a1.onRetry}),
    })
    v26.Retry = retryable
    local v27 = createElement
    local v28 = {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(16, v21),
        Size = UDim2.new(1, -32, 1, -v21 - v19 - 18),
    }
    v26.Body = v27("Frame", v28, v17)
    v27 = not v5
    if v27 then
        v28 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.new(0, 16, 1, -10),
            Size = UDim2.new(1, -32, 0, v19),
        }
        local v29 = {}
        local v30 = {TextSize = 14, TextScaled = false}
        local error_3 = status.error or status.message or (if #v10 > 0 then ("%* settings need attention"):format(#v10) else if u2983 then "Working…" else if not u3001 then ("%* · %*"):format(status.environment, status.phase) else "Unsaved changes")
        v30.Text = error_3
        local muted = if status.error then Theme.warning else if not (#v10 > 0) then Theme.muted else Theme.warning
        v30.TextColor3 = muted
        v30.FontFace = Theme.font
        v30.TextTruncate = Enum.TextTruncate.AtEnd
        v30.TextXAlignment = Enum.TextXAlignment.Left
        v30.AnchorPoint = Vector2.zero
        v30.Position = UDim2.new()
        v30.Size = UDim2.new(1, 0, 0, 26)
        v29.Status = createElement(TextLabel, v30)
        v29.Actions = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(0, 32),
            Size = UDim2.new(1, 0, 0, 48),
        }, v18)
        v27 = createElement("Frame", v28, v29)
    end
    v26.Footer = v27
    v25.otherChildren = v26
    v3.Window = createElement(WindowFrame, v24, v25)
    return (createElement("Frame", v2, v3))
end

return function(a1) -- Line: 960
    -- upvalues: React (val), u61 (val), createElement (val), EventEditor (val)
    local Commands, Commands_2 = React.useState("Commands")
    local initialEvent = a1.initialEvent or u61
    return createElement(EventEditor, {
        key = ("%*:%*:%*"):format(initialEvent.id, initialEvent.revision, a1.selectionVersion or 0),
        mode = Commands,
        onModeChange = Commands_2,
        actions = a1.actions,
        events = a1.events,
        initialEvent = initialEvent,
        status = a1.status,
        busy = a1.busy,
        retryable = a1.retryable,
        onRetry = a1.onRetry,
        capabilities = a1.capabilities,
        validate = a1.validate,
        onSelectEvent = a1.onSelectEvent,
        onSave = a1.onSave,
        onDuplicate = a1.onDuplicate,
        onRefresh = a1.onRefresh,
        onRehearse = a1.onRehearse,
        onRunCommand = a1.onRunCommand,
        onAction = a1.onAction,
        onClose = a1.onClose,
    })
end