-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.CommandsPanel
-- Decompile time: 21.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ActionFields = require(script.Parent.ActionFields)
local CommandTargets = require(script.Parent.CommandTargets)
local Controls = require(script.Parent.Controls)
local LiveMessagePanel = require(script.Parent.LiveMessagePanel)
local React = require(ReplicatedStorage.Shared.UI.React)
local Theme = require(script.Parent.Theme)
require(script.Parent.Types)
local Validation = require(ReplicatedStorage.Shared.Modules.LiveEvents.Validation)
local createElement = React.createElement

local function resultText(a1, a2) -- Line: 26 -- types: a2: table
    local actionId = if not a1.actionId then "Command" else a2[a1.actionId] or a1.actionId
    local status = a1.status
    return (("%* · %*%*"):format(actionId, status, if not a1.message then "" else (" — %*"):format(a1.message)))
end

return function(a1) -- Line: 31
    -- upvalues: React (val), CommandTargets (val), Validation (val), createElement (val), Controls (val), Theme (val)
    -- upvalues: LiveMessagePanel (val), ActionFields (val)
    local Scroll, Scroll_2, Text_14, id, v1, v2, v3, v4, v5, v6, v7, v8, v9, warning
    local u3592, u3601 = React.useState(nil)
    local v10, u3619 = React.useState({})
    local ThisServer, ThisServer_2 = React.useState("ThisServer")
    local v11, v12 = React.useState("")
    local All, All_2 = React.useState("All")
    local v13, u3691 = React.useState(false)
    local v14, u3709 = React.useState(true)
    local u3718, u3727 = React.useState(false)
    local u3736, u3745 = React.useState(false)
    local status = a1.status
    local capabilities = a1.capabilities
    local effects = status.effects or {}
    local results = status.results or {}
    local v15 = false
    if status.runId ~= nil then
        v15 = false
        if status.phase ~= "Stopped" then
            v15 = false
            if status.phase ~= "Ended" then
                v15 = status.phase ~= "Idle"
            end
        end
    end
    local v16 = v15
    if not v16 then
        v16 = true
        if not (#effects > 0) then
            v16 = status.stopPending == true
        end
    end
    local v17 = v15 and not status.commandMode
    local v18 = v15 and status.rehearsal == true
    local v19 = false
    if status.commandMode == true then
        v19 = false
        if status.localOnly ~= true then
            v19 = v16
        end
    end
    local v20 = if capabilities.placeContext ~= "Game" then if capabilities.placeContext ~= "Lobby" then "Unknown place" else "Lobby" else "Match"
    local u3570 = nil
    local v21 = {}
    local v22 = {}
    local v23 = {}
    local v24 = nil
    local v25 = nil
    for i, j in a1.actions, v24, v25 do
        v21[j.id] = j.label
        if j.id == u3592 then
            u3570 = j
        end
        if not v23[j.category] then
            v23[j.category] = true
            table.insert(v22, j.category)
        end
    end
    table.sort(v22)
    local v26 = {{id = "All", label = "All commands"}}
    for k, n in v22 do
        table.insert(v26, {id = n, label = n})
    end
    v24 = CommandTargets.options(u3570, capabilities)
    v25 = false
    local v27 = nil
    for m, i5 in v24, nil, v27 do
        if i5.id == ThisServer then
            v25 = true
        end
    end
    local u2839 = nil
    local v28 = nil
    if u3570 then
        local v29
        v27, v29 = Validation.parameters(u3570.id, v10)
        u2839 = v27
        v28 = v29
    end
    v27 = CommandTargets.unavailableReason(ThisServer, capabilities)
    local u2872 = false
    if u3570 ~= nil then
        u2872 = false
        if v27 == nil then
            u2872 = not v18
            if u2872 then
                u2872 = not status.stopPending
                if u2872 then
                    u2872 = v25
                    if u2872 then
                        u2872 = false
                        if u2839 ~= nil then
                            u2872 = not a1.busy
                        end
                    end
                end
            end
        end
    end
    local v30 = CommandTargets.label(ThisServer, capabilities.placeContext)
    local v31 = if capabilities.placeContext ~= "Lobby" then "local activity" else "lobby activity"
    local v32 = CommandTargets.modesLabel(capabilities.broadcastModes)

    local function runCommand() -- Line: 97
        -- upvalues: u2872 (val), u3570 (ref), u2839 (ref), a1 (val), ThisServer (val), u3727 (val)
        if u2872 and u3570 and u2839 then
            a1.onRunCommand({
                actionId = u3570.id,
                version = u3570.version,
                target = ThisServer,
                parameters = table.clone(u2839),
            })
            if not u3570.repeatable then
                u3727(false)
            end
            return
        end
    end

    local v33 = {
        Environment = createElement(Controls.Text, {
            order = 1,
            text = ("Operating from: %* · %*"):format(v20, status.environment),
            color = Theme.muted,
        }),
    }
    local canBroadcast = capabilities.canBroadcast and createElement(Controls.Text, {order = 6, text = ("Broadcast gamemodes: %*"):format(v32), color = Theme.muted})
    v33.BroadcastModes = canBroadcast
    v33.Sequence = v17 and createElement(Controls.Text, {
        order = 2,
        text = if not v18 then "A sequence is running. Stopping also ends that sequence." else "Stop the rehearsal to run commands directly.",
        color = Theme.warning,
    })
    v33.StopScope = v19 and createElement(Controls.Text, {
        text = "Stop all ends this command session across its target servers.",
        order = 7,
        color = Theme.muted,
    })
    local stopPending = status.stopPending and createElement(Controls.Text, {
        text = "Effects stopped here. Confirm the shared stop before sending more commands.",
        order = 3,
        color = Theme.warning,
    })
    v33.StopPending = stopPending
    v33.Unavailable = not capabilities.canRunCommands and createElement(Controls.Text, {
        order = 3,
        text = capabilities.commandUnavailableReason or "Commands are unavailable in this server.",
        color = Theme.warning,
    })
    local message = status.message and createElement(Controls.Text, {order = 4, text = status.message, color = Theme.accent})
    v33.Message = message
    local error = status.error and createElement(Controls.Text, {order = 5, text = status.error, color = Theme.warning})
    v33.Error = error
    local v34 = {
        EffectsHeading = createElement(Controls.Text, {
            strong = true,
            order = 100,
            text = if capabilities.placeContext ~= "Lobby" then "Effects on this server" else "Effects in this lobby",
        }),
    }
    local v35 = false
    if #effects == 0 then
        v35 = createElement(Controls.Text, {text = "No active effects on this server.", order = 101, color = Theme.muted})
    end
    v34.NoEffects = v35
    v34.ResultsHeading = createElement(Controls.Text, {
        strong = true,
        order = 200,
        text = if capabilities.placeContext ~= "Lobby" then "Results on this server" else "Results in this lobby",
    })
    v34.ResultsHint = createElement(Controls.Text, {
        order = 201,
        text = if capabilities.placeContext ~= "Lobby" then "These results describe this server only. Broadcast acceptance does not confirm execution on other servers." else "Game-server commands do not apply in this lobby. A local Skipped result is expected for those commands. Game-server results and effects are not reported here.",
        color = Theme.muted,
    })
    v35 = false
    if #results == 0 then
        v35 = createElement(Controls.Text, {text = "No commands have reported a result here yet.", order = 202, color = Theme.muted})
    end
    v34.NoResults = v35
    for i6, i7 in effects do
        v3 = ("Effect_%*"):format(i7.id)
        v34[v3] = (createElement(Controls.Text, {text = i7.label, color = Theme.accent, order = 101 + i6}))
    end
    for i8 = #results, (math.max(1, #results - 4)), -1 do
        v1 = results[i8]
        v2 = ("Result_%*"):format(i8)
        Text_14 = Controls.Text
        v5 = {
            text = ("%* · %*%*"):format(
                if not v1.actionId then "Command" else v21[v1.actionId] or v1.actionId,
                v1.status,
                if not v1.message then "" else (" — %*"):format(v1.message)
            ),
        }
        warning = if string.lower(v1.status) ~= "failed" then Theme.text else Theme.warning
        v5.color = warning
        v5.order = #results + 202 - i8
        v34[v2] = (createElement(Text_14, v5))
    end
    v35 = createElement(Controls.Button, {
        order = 90,
        text = ("%* %*"):format(if not u3736 then "Show" else "Hide", v31),
        onActivated = function() -- Line: 209 -- upvalues: u3745 (val), u3736 (val)
            u3745(not u3736)
        end,
    })
    local v36 = {
        LiveMessage = createElement(LiveMessagePanel, {
            busy = a1.busy,
            canSend = capabilities.canRunCommands == true,
            canBroadcast = capabilities.canBroadcast == true,
            onSend = a1.onSendLiveMessage,
        }),
    }
    v36.Title = createElement(Controls.Text, {text = "Choose a command", strong = true, size = 20, order = 10})
    v36.Search = createElement(Controls.Input, {label = "Search commands", order = 11, value = v11, onChanged = v12})
    v36.Category = createElement(Controls.Select, {
        label = "Category",
        order = 12,
        value = All,
        options = v26,
        onChanged = All_2,
    })
    local v37 = 0
    v2 = nil
    v3 = nil
    for i9, i10 in a1.actions, v2, v3 do
        if string.find(string.lower(i10.label .. " " .. i10.description), string.lower(v11), 1, true) then
            if All == "All" or All == i10.category then
                v37 = v37 + 1
                id = i10.id
                v36[id] = (createElement(Controls.Button, {
                    text = i10.label,
                    selected = u3592 == i10.id,
                    disabled = a1.busy,
                    order = i9 + 20,
                    onActivated = function() -- Line: 253
                        -- upvalues: i10 (val), u3601 (val), u3619 (val), ThisServer_2 (val), CommandTargets (upval)
                        -- upvalues: capabilities (val), u3592 (val), ThisServer (val), u3727 (val), u3709 (val)
                        local v1 = {}
                        for i, j in i10.fields do
                            v1[j.key] = j.default
                        end
                        u3601(i10.id)
                        u3619(v1)
                        local v2 = if not u3592 then nil else ThisServer
                        ThisServer_2(CommandTargets.choose(i10, capabilities, v2))
                        u3727(false)
                        u3709(false)
                    end,
                }))
            end
        end
    end
    if v37 == 0 then
        v36.Empty = createElement(Controls.Text, {
            text = "No commands found. Try another search or category.",
            order = 20,
            color = Theme.muted,
        })
    end
    if v13 and v14 then
        v36.Feedback = createElement(React.Fragment, {}, v33)
        v36.ActivityToggle = v35
        v1 = u3736 and createElement(React.Fragment, {}, v34)
        v36.Activity = v1
    end
    v1 = {}
    v1.ActivityToggle = v35
    v1.Feedback = createElement(React.Fragment, {}, v33)
    v2 = u3736 and createElement(React.Fragment, {}, v34)
    v1.Activity = v2
    v2 = v13 and createElement(Controls.Button, {
        text = "Back to commands",
        order = 0,
        onActivated = function() -- Line: 293 -- upvalues: u3709 (val), u3727 (val)
            u3709(true)
            u3727(false)
        end,
    })
    v1.Back = v2
    if not u3570 then
        v1.Empty = createElement(Controls.Text, {
            size = 20,
            order = 10,
            text = if capabilities.placeContext ~= "Lobby" then "Choose a command to see its target and settings, then select Run now." else "Run game commands from this lobby. Choose a command, review its settings and game-server target, then select Run now.",
        })
    else
        v1.Title = createElement(Controls.Text, {size = 24, strong = true, order = 10, text = u3570.label})
        v1.Description = createElement(Controls.Text, {order = 11, text = u3570.description, color = Theme.muted})
        local repeatable = u3570.repeatable and createElement(Controls.Text, {
            text = "Repeatable: run this command again as soon as the previous request finishes. Active spawn batches must finish first.",
            order = 15,
            color = Theme.accent,
        })
        v1.RepeatHint = repeatable
        v1.Target = createElement(Controls.Select, {
            label = "Run on",
            order = 12,
            value = if not v25 then if not (#v24 > 0) then "Unavailable here" else "Choose a target" else ThisServer,
            options = v24,
            disabled = a1.busy,
            onChanged = function(a1) -- Line: 325 -- upvalues: ThisServer_2 (val), u3727 (val)
                ThisServer_2(a1)
                u3727(false)
            end,
        })
        v2 = createElement
        local Text_19 = Controls.Text
        v4 = {
            order = 13,
            text = if not v25 then if not (#v24 > 0) then "This command has no supported destination." else "This target is unavailable for this command. Choose one of the available targets." else if v27 then v27 else if ThisServer == "EventMatches" then ("Runs in matching Game servers in this experience.%* Gamemodes: %*. PVP is excluded."):format(
                if capabilities.placeContext ~= "Lobby" then "" else " You stay in this lobby.",
                v32
            ) else if ThisServer ~= "EventLobbies" then ("Only players in this %* receive this command."):format(if capabilities.placeContext ~= "Lobby" then "server" else "lobby") else "LIVE broadcast to all lobbies with live events enabled in this experience.",
        }
        local muted = if not v25 then Theme.warning else if ThisServer == "ThisServer" then Theme.muted else Theme.warning
        v4.color = muted
        v1.TargetHint = v2(Text_19, v4)
        if u3570.destructive then
            v2 = createElement(Controls.Text, {
                order = 14,
                text = u3570.confirmation or "Permanent changes. Stop cannot restore removed towers or enemies.",
                color = Theme.warning,
            })
        else
            v2 = false
            if u3570.confirmation ~= nil then
                v2 = createElement(Controls.Text, {
                    order = 14,
                    text = u3570.confirmation or "Permanent changes. Stop cannot restore removed towers or enemies.",
                    color = Theme.warning,
                })
            end
        end
        v1.Consequence = v2
        v2 = false
        if #u3570.fields > 0 then
            v2 = createElement(Controls.Text, {text = "Settings", strong = true, order = 20})
        end
        v1.Settings = v2
        v2 = createElement
        v3 = ActionFields
        v4 = {
            orderOffset = 20,
            action = u3570,
            parameters = v10,
            disabled = a1.busy,
            onChange = function(a1) -- Line: 373 -- upvalues: u3619 (val), u3727 (val)
                u3619(a1)
                u3727(false)
            end,
        }
        v1.Fields = v2(v3, v4)
        v2 = v28 and createElement(Controls.Text, {order = 40, text = v28, color = Theme.warning})
        v1.ParameterError = v2
        if u3718 then
            v2 = {
                (("%*: %*"):format(if ThisServer == "ThisServer" then "Target" else "LIVE broadcast", v30)),
            }
            if ThisServer == "EventMatches" then
                table.insert(v2, (("Gamemodes: %*"):format(v32)))
            end
            v4 = nil
            v5 = nil
            for i11, i12 in u3570.fields, v4, v5 do
                v6 = if not u2839 then v10[i12.key] else u2839[i12.key]
                table.insert(
                    v2,
                    (("%*: %*"):format(i12.label, if type(v6) ~= "boolean" then tostring(v6) else if not v6 then "Off" else "On"))
                )
            end
            if u3570.confirmation then
                table.insert(v2, u3570.confirmation)
            elseif u3570.destructive then
                table.insert(v2, "Removed towers and enemies cannot be restored by Stop.")
            end
            if u3570.repeatable then
                table.insert(v2, "Each press runs this command again. Cancel to change its settings.")
            end
            v1 = {
                Feedback = createElement(React.Fragment, {}, v33),
                Title = createElement(Controls.Text, {
                    size = 24,
                    strong = true,
                    order = 10,
                    text = ("Run %* now?"):format(u3570.label),
                }),
                Review = createElement(Controls.Text, {order = 11, text = table.concat(v2, "\n"), color = Theme.warning}),
            }
        end
    end
    v2 = false
    if u3570 ~= nil then
        v2 = not v13 or not v14
    end
    v3 = if not u3718 then 114 else 132
    local v38 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}

    v38[React.Change.AbsoluteSize] = function(a1) -- Line: 441 -- upvalues: u3691 (val)
        u3691(a1.AbsoluteSize.X < 900)
    end

    v6 = {}
    if not v13 then
        Scroll = Controls.Scroll
        v8 = {}
        v9 = if not v13 then UDim2.new(0.36, -6, 1, -v3 - 10) else UDim2.new(1, 0, 1, -v3 - 10)
        v8.size = v9
        v7 = createElement(Scroll, v8, v36)
    else
        v7 = v14
        if v7 then
            Scroll = Controls.Scroll
            v8 = {}
            v9 = if not v13 then UDim2.new(0.36, -6, 1, -v3 - 10) else UDim2.new(1, 0, 1, -v3 - 10)
            v8.size = v9
            v7 = createElement(Scroll, v8, v36)
        end
    end
    v6.List = v7
    if not v13 then
        Scroll_2 = Controls.Scroll
        v8 = {key = ("%*:%*"):format(u3592 or "empty", u3718)}
        v9 = if not v13 then UDim2.new(0.36, 6, 0, 0) else UDim2.new()
        v8.position = v9
        v9 = if not v13 then UDim2.new(0.64, -6, 1, -v3 - 10) else UDim2.new(1, 0, 1, -v3 - 10)
        v8.size = v9
        v7 = createElement(Scroll_2, v8, v1)
    else
        v7 = not v14
        if v7 then
            Scroll_2 = Controls.Scroll
            v8 = {key = ("%*:%*"):format(u3592 or "empty", u3718)}
            v9 = if not v13 then UDim2.new(0.36, 6, 0, 0) else UDim2.new()
            v8.position = v9
            v9 = if not v13 then UDim2.new(0.64, -6, 1, -v3 - 10) else UDim2.new(1, 0, 1, -v3 - 10)
            v8.size = v9
            v7 = createElement(Scroll_2, v8, v1)
        end
    end
    v6.Detail = v7
    v8 = {BorderSizePixel = 0}
    v8.BackgroundColor3 = Theme.surface
    v8.Position = UDim2.new(0, 0, 1, -v3)
    v8.Size = UDim2.new(1, 0, 0, v3)
    v9 = {}
    v9.Padding = createElement("UIPadding", {
        PaddingTop = UDim.new(0, 12),
        PaddingLeft = UDim.new(0, 14),
        PaddingRight = UDim.new(0, 14),
    })
    local v39 = {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, if not u3718 then 0 else -102, 0, if not u3718 then 46 else 64),
    }
    local v40 = {}
    local Text_25 = Controls.Text
    local v41 = {
        strong = true,
        text = if not v2 then "Choose a command to run now." else ("Run on: %*%*"):format(v30, if not v25 then " (unavailable)" else if v27 then " (unavailable)" else ""),
    }
    local warning_2 = if not v2 then Theme.text else if not v25 then Theme.warning else if ThisServer == "ThisServer" then Theme.text else Theme.warning
    v41.color = warning_2
    v40.Text = createElement(Text_25, v41)
    v9.Target = createElement("Frame", v39, v40)
    local v42 = u3718 and createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.fromOffset(92, 48),
    }, {
        Button = createElement(Controls.Button, {
            text = "Cancel",
            onActivated = function() -- Line: 494 -- upvalues: u3727 (val)
                u3727(false)
            end,
        }),
    })
    v9.Cancel = v42
    v42 = v2
    if v42 then
        v39 = {BackgroundTransparency = 1, Position = UDim2.fromOffset(0, v4)}
        v40 = if not v16 then UDim2.new(1, 0, 0, 48) else UDim2.new(0.5, -5, 0, 48)
        v39.Size = v40
        v42 = createElement("Frame", v39, {
            Button = createElement(Controls.Button, {
                text = if not a1.busy then if not u3718 then "Run now" else "Confirm run" else "Waiting...",
                primary = not u3718,
                danger = u3718,
                disabled = not u2872,
                onActivated = function() -- Line: 512
                    -- upvalues: u2872 (val), u3570 (ref), u3718 (val), ThisServer (val), u3727 (val), runCommand (val)
                    if u2872 and u3570 then
                        if u3718 then
                            runCommand()
                            return
                        end
                        if ThisServer == "ThisServer" and not u3570.destructive and u3570.confirmation == nil then
                            runCommand()
                            return
                        end
                        u3727(true)
                        return
                    end
                end,
            }),
        })
    end
    v9.Run = v42
    v42 = v16
    if v42 then
        v39 = {BackgroundTransparency = 1}
        v40 = if not v2 then UDim2.fromOffset(0, v4) else UDim2.new(0.5, 5, 0, v4)
        v39.Position = v40
        v40 = if not v2 then UDim2.new(1, 0, 0, 48) else UDim2.new(0.5, -5, 0, 48)
        v39.Size = v40
        v42 = createElement("Frame", v39, {
            Button = createElement(Controls.Button, {
                danger = true,
                text = if not status.stopPending then if not v17 then if not v19 then "Stop effects" else "Stop all" else "Stop event" else "Retry Stop",
                onActivated = a1.onStop,
            }),
        })
    end
    v9.Stop = v42
    v6.Footer = createElement("Frame", v8, v9)
    return (createElement("Frame", v38, v6))
end