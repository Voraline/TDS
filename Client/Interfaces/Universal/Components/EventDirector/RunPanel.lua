-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.RunPanel
-- Decompile time: 14.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Controls = require(script.Parent.Controls)
local React = require(ReplicatedStorage.Shared.UI.React)
local Theme = require(script.Parent.Theme)
require(script.Parent.Types)
local createElement = React.createElement
local u26 = {ThisServer = "This server", EventLobbies = "Event lobbies", EventMatches = "Configured game servers"}
local u27 = {
    {id = "event", label = "Full show"},
    {id = "section", label = "Selected section"},
    {id = "cue", label = "Selected command"},
}
return function(a1) -- Line: 36
    -- upvalues: React (val), createElement (val), Controls (val), Theme (val), u27 (val), u26 (val)
    local actionId_2, id_3, v1
    local u1155, u1167 = React.useState(nil)
    local event, event_3 = React.useState("event")
    local u1245, u1297 = React.useState(false)
    local u827, u506 = React.useState(false)
    local event_2 = a1.event
    local status = a1.status
    local selectedCue = a1.selectedCue
    local u804 = a1.mode == "Rehearse"
    local v2 = false
    if status.runId ~= nil then
        v2 = false
        if status.phase ~= "Stopped" then
            v2 = false
            if status.phase ~= "Ended" then
                v2 = status.phase ~= "Idle"
            end
        end
    end
    if v2 and status.commandMode then
        return createElement(Controls.Text, {
            text = "Commands are running. Use Commands to control them, or stop them before starting a sequence.",
            color = Theme.muted,
        })
    end
    local u1470 = false
    if status.eventId == event_2.id then
        u1470 = status.revision == event_2.revision
    end
    local v3 = true
    if event_2.hostContext ~= "Lobby" then
        v3 = event_2.hostContext == "Game"
    end
    local v4 = v3
    if v4 then
        v4 = not a1.dirty
        if v4 then
            v4 = false
            if #a1.issues == 0 then
                v4 = false
                if 0 < event_2.revision then
                    v4 = not a1.busy
                end
            end
        end
    end
    local v5 = v3
    if v5 then
        v5 = false
        if status.authoredRevisions ~= nil then
            v5 = status.authoredRevisions[event_2.id] == event_2.revision
        end
    end
    local v6 = not a1.dirty
    if v6 then
        v6 = false
        if status.testedRevisions ~= nil then
            v6 = status.testedRevisions[event_2.id] == event_2.revision
        end
    end
    local canRehearse = v2 and not a1.busy and (if not u804 then a1.canHost else a1.canRehearse)
    local canHost = v4 and v5 and a1.canHost and not v2
    local enabled = canRehearse
    if enabled then
        enabled = u1470
        if enabled then
            enabled = v4
            if enabled then
                enabled = v5
                if enabled then
                    enabled = false
                    if selectedCue ~= nil then
                        enabled = selectedCue.enabled
                    end
                end
            end
        end
    end
    local v7 = {}
    local v8 = {}
    local u1504 = {}
    local v9 = {}
    for i, j in a1.actions do
        v7[j.id] = j.label
        v8[j.id] = j.destructive
    end
    local v10 = nil
    local v11 = nil
    for k, n in event_2.cues, v10, v11 do
        id_3 = n.id
        actionId_2 = v7[n.actionId] or n.actionId
        u1504[id_3] = (("%*. %*"):format(k, actionId_2))
        table.insert(v9, {id = n.id, label = u1504[n.id]})
    end

    local function cueName(a1) -- Line: 85 -- upvalues: u1470 (val), u1504 (val) -- types: a1: string?
        if not a1 then
            return "None"
        end
        if u1470 then
            return u1504[a1] or "Command from the running show"
        end
        return "Command from another show"
    end

    v11 = {
        State = createElement(Controls.Text, {
            strong = true,
            size = 20,
            order = 1,
            text = ("%* · This server"):format(if not status.held then if status.phase ~= "Scheduled" then if status.phase ~= "Ended" then if status.phase ~= "Idle" then status.phase else "Ready" else "Finished" else "Starting" else if not v2 then if status.phase ~= "Scheduled" then if status.phase ~= "Ended" then if status.phase ~= "Idle" then status.phase else "Ready" else "Finished" else "Starting" else "On hold"),
        }),
    }
    local Text_3 = Controls.Text
    local v12 = {
        order = 2,
        text = if not v2 or u1470 then ("%* · %*"):format(event_2.name, if not v5 then "Practice copy" else "Library show") else "Another show is running. Select it in Library to see its commands.",
        color = Theme.muted,
    }
    v11.Show = createElement(Text_3, v12)
    local message_2 = status.message and createElement(Controls.Text, {order = 6, text = status.message, color = Theme.accent})
    v11.Message = message_2
    local error = status.error and createElement(Controls.Text, {order = 7, text = status.error, color = Theme.warning})
    v11.Error = error
    if not v2 then
        local message_3
        v11.Readiness = (if v3 then if a1.dirty then "Save your changes in Build before rehearsing." else if event_2.revision ~= 0 then if not a1.issues[1] then if u804 then if not u804 then if u804 then nil else if a1.canHost then nil else "Live shows start from the live environment." else if a1.canRehearse then if u804 then nil else if a1.canHost then nil else "Live shows start from the live environment." else "Rehearsal is available in the test environment." else if v5 then if not u804 then if u804 then nil else if a1.canHost then nil else "Live shows start from the live environment." else if a1.canRehearse then if u804 then nil else if a1.canHost then nil else "Live shows start from the live environment." else "Rehearsal is available in the test environment." else "Practice copies can only be rehearsed. Choose a Library show to run live." else a1.issues[1].message else "Save your changes in Build before rehearsing." else "Choose where to host this show in Build.") and createElement(Controls.Text, {order = 8, text = message_3, color = Theme.warning})
        if not u804 then
            v11.Start = createElement(Controls.Button, {
                text = "Start show",
                primary = true,
                order = 10,
                disabled = not canHost,
                onActivated = function() -- Line: 246 -- upvalues: u1167 (val)
                    u1167("start")
                end,
            })
        else
            v11.Scope = createElement(Controls.Select, {
                label = "Rehearse",
                order = 10,
                value = event,
                options = u27,
                disabled = a1.busy,
                onChanged = event_3,
            })
            if event == "section" and selectedCue then
                v11.Section = createElement(Controls.Text, {
                    order = 12,
                    text = ("Section: %*"):format(if selectedCue.section ~= "" then selectedCue.section else "Unnamed"),
                    color = Theme.muted,
                })
            end
            local Button_5 = Controls.Button
            v1 = {text = "Rehearse", primary = true, order = 16}
            local v13 = not v4
            if not v13 then
                v13 = not a1.canRehearse
                if not v13 then
                    if event == "event" then
                        v13 = false
                        if event == "cue" then
                            v13 = false
                            if selectedCue ~= nil then
                                v13 = not selectedCue.enabled
                            end
                        end
                    else
                        v13 = not selectedCue
                        if not v13 then
                            v13 = false
                            if event == "cue" then
                                v13 = false
                                if selectedCue ~= nil then
                                    v13 = not selectedCue.enabled
                                end
                            end
                        end
                    end
                end
            end
            v1.disabled = v13

            function v1.onActivated() -- Line: 225 -- upvalues: event (val), a1 (val), event_2 (val), selectedCue (val)
                if event == "event" then
                    a1.onRehearse(event_2, {scope = "event"})
                    return
                end
                if selectedCue and event == "cue" then
                    a1.onRehearse(event_2, {scope = "cue", cueId = selectedCue.id})
                    return
                end
                if selectedCue then
                    a1.onRehearse(event_2, {scope = "section", section = selectedCue.section})
                end
            end

            v11.Rehearse = createElement(Button_5, v1)
            v11.RehearsalResult = v6 and createElement(Controls.Text, {text = "Rehearsal passed here.", order = 17, color = Theme.success})
        end
    else
        local Text_6 = Controls.Text
        v12 = {order = 3}
        local currentCueId = status.currentCueId
        v12.text = ("Current: %*"):format(if currentCueId then if not u1470 then "Command from another show" else u1504[currentCueId] or "Command from the running show" else "None")
        v11.Current = createElement(Text_6, v12)
        local Text_7 = Controls.Text
        v12 = {strong = true, order = 4}
        local nextCueId = status.nextCueId
        v12.text = ("Next manual command: %*"):format(if nextCueId then if not u1470 then "Command from another show" else u1504[nextCueId] or "Command from the running show" else "None")
        v11.Next = createElement(Text_7, v12)
        v11.Advance = createElement(Controls.Button, {
            text = "Run next command",
            order = 10,
            primary = status.nextCueId ~= nil,
            disabled = not canRehearse or status.nextCueId == nil,
            onActivated = function() -- Line: 135 -- upvalues: a1 (val)
                a1.onAction("next")
            end,
        })
        v11.Finish = createElement(Controls.Button, {
            order = 11,
            text = if not u804 then "End show" else "Finish rehearsal",
            primary = status.nextCueId == nil,
            disabled = not canRehearse,
            onActivated = function() -- Line: 144 -- upvalues: u804 (val), a1 (val), u1167 (val)
                if u804 then
                    a1.onAction("end")
                    return
                end
                u1167("end")
            end,
        })
        if not u804 then
            v11.ChooseCommand = createElement(Controls.Button, {
                order = 13,
                text = if not u827 then "Choose command" else "Hide command picker",
                disabled = a1.busy,
                onActivated = function() -- Line: 163 -- upvalues: u506 (val), u827 (val), u1167 (val)
                    u506(not u827)
                    u1167(nil)
                end,
            })
            if u827 then
                v11.Immediate = createElement(Controls.Button, {
                    text = "Run command now",
                    order = 16,
                    disabled = not enabled,
                    onActivated = function() -- Line: 173 -- upvalues: u1167 (val)
                        u1167("run-action")
                    end,
                })
            end
        else
            v11.FinishHint = createElement(Controls.Text, {
                text = "Finish after the commands complete to record this server's result.",
                order = 12,
                color = Theme.muted,
            })
        end
    end
    if v2 or not u804 then
        if v2 and not u804 and u827 then
            v11.Command = createElement(Controls.Select, {
                label = "Command",
                order = 14,
                value = if not selectedCue then "" else selectedCue.id,
                options = v9,
                disabled = a1.busy,
                onChanged = function(a1_2) -- Line: 263 -- upvalues: u1167 (val), a1 (val)
                    u1167(nil)
                    a1.onSelectCue(a1_2)
                end,
            })
        end
    elseif event ~= "event" or v2 and not u804 and u827 then
        v11.Command = createElement(Controls.Select, {
            label = "Command",
            order = 14,
            value = if not selectedCue then "" else selectedCue.id,
            options = v9,
            disabled = a1.busy,
            onChanged = function(a1_2) -- Line: 263 -- upvalues: u1167 (val), a1 (val)
                u1167(nil)
                a1.onSelectCue(a1_2)
            end,
        })
    end
    if u1155 then
        local v14 = if u1155 ~= "run-action" then "" else if not selectedCue then "" else if not v8[selectedCue.actionId] then "" else " Permanent changes cannot be restored by Stop."
        v11.ConfirmText = createElement(Controls.Text, {
            order = 20,
            text = if u1155 == "start" then ("Start “%*” r%* live from %*? Commands use their saved targets."):format(
                event_2.name,
                event_2.revision,
                event_2.hostContext
            ) else if u1155 ~= "end" then ("Run %* now for %*?%*"):format(
                if not selectedCue then "this command" else v7[selectedCue.actionId] or selectedCue.actionId,
                if not selectedCue then "the saved target" else u26[selectedCue.target],
                v14
            ) else "End this show and clear its active effects?",
            color = Theme.warning,
        })
        v11.Confirm = createElement(Controls.Button, {
            text = "Confirm",
            danger = true,
            order = 21,
            disabled = not (if u1155 ~= "start" then if u1155 ~= "end" then enabled else canRehearse else canHost),
            onActivated = function() -- Line: 296 -- upvalues: a1 (val), u1155 (val), event_2 (val), selectedCue (val), u1167 (val)
                a1.onAction(u1155, {
                    eventId = event_2.id,
                    revision = event_2.revision,
                    cueId = if not selectedCue then nil else selectedCue.id,
                })
                u1167(nil)
            end,
        })
        v11.Cancel = createElement(Controls.Button, {
            text = "Cancel",
            order = 22,
            onActivated = function() -- Line: 308 -- upvalues: u1167 (val)
                u1167(nil)
            end,
        })
    end
    local results = status.results or {}
    local Button_9 = Controls.Button
    v1 = {
        order = 30,
        text = ("%* results (%*)"):format(if not u1245 then "Show" else "Hide", #results),
        onActivated = function() -- Line: 318 -- upvalues: u1297 (val), u1245 (val)
            u1297(not u1245)
        end,
    }
    v11.Results = createElement(Button_9, v1)
    if u1245 then
        local Text_15, cueId, cueId_2, v15, v16, warning
        v11.ResultsHeading = createElement(Controls.Text, {text = "Results on this server", strong = true, order = 31})
        v12 = nil
        v1 = nil
        for m, i5 in results, v12, v1 do
            cueId = i5.cueId
            v15 = ("Result_%*_%*"):format(m, cueId)
            Text_15 = Controls.Text
            v16 = {}
            cueId_2 = i5.cueId
            v16.text = ("%* · %*%*"):format(
                if cueId_2 then if not u1470 then "Command from another show" else u1504[cueId_2] or "Command from the running show" else "None",
                i5.status,
                if not i5.message then "" else (" — %*"):format(i5.message)
            )
            warning = if string.lower(i5.status) ~= "failed" then Theme.text else Theme.warning
            v16.color = warning
            v16.order = 40 + m
            v11[v15] = (createElement(Text_15, v16))
        end
        if #results == 0 then
            v11.NoResults = createElement(Controls.Text, {text = "No results yet.", order = 40, color = Theme.muted})
        end
        for i6, i7 in status.effects or {} do
            v15 = ("Effect_%*"):format(i7.id)
            v11[v15] = (createElement(Controls.Text, {
                text = ("Active: %*"):format(i7.label),
                color = Theme.accent,
                order = 1000 + i6,
            }))
        end
    end
    return createElement(React.Fragment, {}, v11)
end