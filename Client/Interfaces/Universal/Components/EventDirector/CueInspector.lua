-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.CueInspector
-- Decompile time: 8.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ActionFields = require(script.Parent.ActionFields)
local CommandTargets = require(script.Parent.CommandTargets)
local Controls = require(script.Parent.Controls)
local React = require(ReplicatedStorage.Shared.UI.React)
local Theme = require(script.Parent.Theme)
require(script.Parent.Types)
local createElement = React.createElement
local u36 = {
    {id = "Start", label = "When the event starts"},
    {id = "Time", label = "At a time from event start"},
    {id = "Wave", label = "At a wave"},
    {id = "Manual", label = "When I click Next"},
}

local function fieldIssue(a1, a2) -- Line: 28 -- types: a1: table, a2: string
    for i, j in a1 do
        if j.field ~= a2 and j.field ~= ("parameters.%*"):format(a2) then
            continue
        end
        return j.message
    end
    return nil
end

return function(a1) -- Line: 37
    -- upvalues: React (val), createElement (val), Controls (val), Theme (val), CommandTargets (val), u36 (val)
    -- upvalues: ActionFields (val)
    local Input, message, v1
    local u250, u332 = React.useState(false)
    local cue = a1.cue
    if not cue then
        return createElement(Controls.Text, {text = "Choose a command in the sequence to see its settings.", color = Theme.muted})
    end
    local v2 = nil
    local v3 = {}
    for i, j in a1.actions do
        table.insert(v3, {id = j.id, label = j.label})
        if j.id == cue.actionId then
            v2 = j
        end
    end
    local v4 = CommandTargets.options(v2, {
        canSave = false,
        canRehearse = false,
        canHost = false,
        canBroadcast = true,
        placeContext = a1.hostContext,
    })
    local v5 = nil
    local v6 = nil
    for k, n in v4, v5, v6 do
        if n.id == "ThisServer" then
            v1 = if a1.hostContext ~= "Lobby" then "game server" else "lobby"
            n.label = ("Host %* only"):format(v1)
        end
    end

    local function update(a1_2, a2) -- Line: 70 -- upvalues: cue (val), a1 (val) -- types: a1_2: string
        local v1 = table.clone(cue)
        v1[a1_2] = a2
        a1.onChange(v1)
    end

    v5 = {
        Heading = createElement(Controls.Text, {
            strong = true,
            size = 20,
            order = 1,
            text = if not v2 then "Unknown command" else v2.label,
        }),
    }
    v5.Description = v2 and createElement(Controls.Text, {order = 2, text = v2.description, color = Theme.muted})
    v6 = v2
    if v6 then
        if v2.destructive then
            v6 = createElement(Controls.Text, {
                order = 3,
                text = v2.confirmation or "Makes permanent changes. Stop cannot restore removed towers or enemies. Excluded from Chaos.",
                color = Theme.warning,
            })
        else
            v6 = false
            if v2.confirmation ~= nil then
                v6 = createElement(Controls.Text, {
                    order = 3,
                    text = v2.confirmation or "Makes permanent changes. Stop cannot restore removed towers or enemies. Excluded from Chaos.",
                    color = Theme.warning,
                })
            end
        end
    end
    v5.Consequence = v6
    v5.Trigger = createElement(Controls.Select, {
        label = "When",
        order = 4,
        value = cue.trigger,
        options = u36,
        disabled = a1.disabled,
        onChanged = function(a1_2) -- Line: 102 -- upvalues: cue (val), a1 (val)
            local v1 = table.clone(cue)
            v1.trigger = a1_2
            v1.at = if a1_2 ~= "Wave" then 0 else 1
            a1.onChange(v1)
        end,
    })
    v5.Audience = createElement(Controls.Select, {
        label = "Who receives it",
        order = 6,
        value = cue.target,
        options = v4,
        disabled = a1.disabled,
        onChanged = function(a1_2) -- Line: 115 -- upvalues: cue (val), a1 (val)
            local v1 = table.clone(cue)
            v1.target = a1_2
            a1.onChange(v1)
        end,
    })
    v6 = v2
    if v6 then
        v6 = false
        if #v2.fields > 0 then
            v6 = createElement(Controls.Text, {text = "Command settings", strong = true, order = 10})
        end
    end
    v5.SettingsHeading = v6
    local Button = Controls.Button
    local v7 = {
        order = 70,
        text = if not u250 then "Show optional settings" else "Hide optional settings",
        onActivated = function() -- Line: 127 -- upvalues: u332 (val), u250 (val)
            u332(not u250)
        end,
    }
    v5.Options = createElement(Button, v7)
    if cue.trigger == "Time" then
        v6 = createElement
        Input = Controls.Input
        v7 = {
            order = 5,
            label = if cue.trigger ~= "Time" then "Wave number" else "Seconds from event start",
        }
        v7.value = tostring(cue.at)
        v1 = a1.issues
        for m, i5 in v1 do
            if i5.field == "at" then
                message = i5.message
            elseif i5.field ~= "parameters.at" then
                continue
            else
                message = i5.message
            end
            v7.error = message
            v7.disabled = a1.disabled

            function v7.onChanged(a1_2) -- Line: 140 -- upvalues: cue (val), a1 (val)
                local v1 = tonumber(a1_2) or a1_2
                local v2 = table.clone(cue)
                v2.at = v1
                a1.onChange(v2)
            end

            v5.At = v6(Input, v7)
            if v2 then
                v5.Fields = createElement(ActionFields, {
                    action = v2,
                    parameters = cue.parameters,
                    issues = a1.issues,
                    disabled = a1.disabled,
                    onChange = function(a1_2) -- Line: 152 -- upvalues: cue (val), a1 (val)
                        local v1 = table.clone(cue)
                        v1.parameters = a1_2
                        a1.onChange(v1)
                    end,
                })
            end
            if u250 then
                v5.Section = createElement(Controls.Input, {
                    label = "Section name",
                    order = 71,
                    value = cue.section,
                    disabled = a1.disabled,
                    onChanged = function(a1_2) -- Line: 166 -- upvalues: cue (val), a1 (val)
                        local v1 = table.clone(cue)
                        v1.section = a1_2
                        a1.onChange(v1)
                    end,
                })
                v5.Action = createElement(Controls.Select, {
                    label = "Change command",
                    order = 72,
                    value = cue.actionId,
                    options = v3,
                    disabled = a1.disabled,
                    onChanged = function(a1_2) -- Line: 176 -- upvalues: cue (val), a1 (val)
                        local v1 = table.clone(cue)
                        v1.actionId = a1_2
                        v1.parameters = {}
                        local v2 = nil
                        local v3 = nil
                        for i, j in a1.actions, v2, v3 do
                            if j.id == a1_2 then
                                v1.version = j.version
                                for k, n in j.fields do
                                    v1.parameters[n.key] = n.default
                                end
                            end
                        end
                        a1.onChange(v1)
                    end,
                })
            end
            for i6, i7 in a1.issues do
                v1 = ("Issue_%*"):format(i6)
                v5[v1] = (createElement(Controls.Text, {text = i7.message, color = Theme.warning, order = i6 + 100}))
            end
            return createElement(React.Fragment, {}, v5)
        end
        v7.error = nil
        v7.disabled = a1.disabled

        function v7.onChanged(a1_2) -- Line: 140 -- upvalues: cue (val), a1 (val)
            local v1 = tonumber(a1_2) or a1_2
            local v2 = table.clone(cue)
            v2.at = v1
            a1.onChange(v2)
        end

        v5.At = v6(Input, v7)
    elseif cue.trigger == "Wave" then
        v6 = createElement
        Input = Controls.Input
        v7 = {
            order = 5,
            label = if cue.trigger ~= "Time" then "Wave number" else "Seconds from event start",
        }
        v7.value = tostring(cue.at)
        v1 = a1.issues
        for i8, i9 in v1 do
            if i9.field == "at" then
                message = i9.message
            elseif i9.field ~= "parameters.at" then
                continue
            else
                message = i9.message
            end
            v7.error = message
            v7.disabled = a1.disabled

            function v7.onChanged(a1_2) -- Line: 140 -- upvalues: cue (val), a1 (val)
                local v1 = tonumber(a1_2) or a1_2
                local v2 = table.clone(cue)
                v2.at = v1
                a1.onChange(v2)
            end

            v5.At = v6(Input, v7)
            if v2 then
                v5.Fields = createElement(ActionFields, {
                    action = v2,
                    parameters = cue.parameters,
                    issues = a1.issues,
                    disabled = a1.disabled,
                    onChange = function(a1_2) -- Line: 152 -- upvalues: cue (val), a1 (val)
                        local v1 = table.clone(cue)
                        v1.parameters = a1_2
                        a1.onChange(v1)
                    end,
                })
            end
            if u250 then
                v5.Section = createElement(Controls.Input, {
                    label = "Section name",
                    order = 71,
                    value = cue.section,
                    disabled = a1.disabled,
                    onChanged = function(a1_2) -- Line: 166 -- upvalues: cue (val), a1 (val)
                        local v1 = table.clone(cue)
                        v1.section = a1_2
                        a1.onChange(v1)
                    end,
                })
                v5.Action = createElement(Controls.Select, {
                    label = "Change command",
                    order = 72,
                    value = cue.actionId,
                    options = v3,
                    disabled = a1.disabled,
                    onChanged = function(a1_2) -- Line: 176 -- upvalues: cue (val), a1 (val)
                        local v1 = table.clone(cue)
                        v1.actionId = a1_2
                        v1.parameters = {}
                        local v2 = nil
                        local v3 = nil
                        for i, j in a1.actions, v2, v3 do
                            if j.id == a1_2 then
                                v1.version = j.version
                                for k, n in j.fields do
                                    v1.parameters[n.key] = n.default
                                end
                            end
                        end
                        a1.onChange(v1)
                    end,
                })
            end
            for i10, i11 in a1.issues do
                v1 = ("Issue_%*"):format(i10)
                v5[v1] = (createElement(Controls.Text, {text = i11.message, color = Theme.warning, order = i10 + 100}))
            end
            return createElement(React.Fragment, {}, v5)
        end
        v7.error = nil
        v7.disabled = a1.disabled

        function v7.onChanged(a1_2) -- Line: 140 -- upvalues: cue (val), a1 (val)
            local v1 = tonumber(a1_2) or a1_2
            local v2 = table.clone(cue)
            v2.at = v1
            a1.onChange(v2)
        end

        v5.At = v6(Input, v7)
    end
    if v2 then
        v5.Fields = createElement(ActionFields, {
            action = v2,
            parameters = cue.parameters,
            issues = a1.issues,
            disabled = a1.disabled,
            onChange = function(a1_2) -- Line: 152 -- upvalues: cue (val), a1 (val)
                local v1 = table.clone(cue)
                v1.parameters = a1_2
                a1.onChange(v1)
            end,
        })
    end
    if u250 then
        v5.Section = createElement(Controls.Input, {
            label = "Section name",
            order = 71,
            value = cue.section,
            disabled = a1.disabled,
            onChanged = function(a1_2) -- Line: 166 -- upvalues: cue (val), a1 (val)
                local v1 = table.clone(cue)
                v1.section = a1_2
                a1.onChange(v1)
            end,
        })
        v5.Action = createElement(Controls.Select, {
            label = "Change command",
            order = 72,
            value = cue.actionId,
            options = v3,
            disabled = a1.disabled,
            onChanged = function(a1_2) -- Line: 176 -- upvalues: cue (val), a1 (val)
                local v1 = table.clone(cue)
                v1.actionId = a1_2
                v1.parameters = {}
                local v2 = nil
                local v3 = nil
                for i, j in a1.actions, v2, v3 do
                    if j.id == a1_2 then
                        v1.version = j.version
                        for k, n in j.fields do
                            v1.parameters[n.key] = n.default
                        end
                    end
                end
                a1.onChange(v1)
            end,
        })
    end
    for i12, i13 in a1.issues do
        v1 = ("Issue_%*"):format(i12)
        v5[v1] = (createElement(Controls.Text, {text = i13.message, color = Theme.warning, order = i12 + 100}))
    end
    return createElement(React.Fragment, {}, v5)
end