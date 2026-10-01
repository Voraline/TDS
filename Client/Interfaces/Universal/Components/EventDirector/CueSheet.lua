-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.CueSheet
-- Decompile time: 3.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Controls = require(script.Parent.Controls)
local React = require(ReplicatedStorage.Shared.UI.React)
local Theme = require(script.Parent.Theme)
require(script.Parent.Types)
local createElement = React.createElement
local u26 = {
    EventLobbies = "All Event lobbies",
    EventMatches = "All configured game servers",
    ThisServer = "Host server only",
}
return function(a1) -- Line: 25
    -- upvalues: createElement (val), Controls (val), Theme (val), u26 (val), React (val)
    local Button, Text_3, id_2, v1, v2, v3, v4, v5, v6, warning
    local v7 = {}
    for i, j in a1.actions do
        v7[j.id] = j.label
    end
    local v8 = {}
    for k, n in a1.issues do
        if n.cueId then
            v8[n.cueId] = true
        end
    end
    local v9 = {}
    local section_2 = nil
    local v10 = nil
    local v11 = nil
    for m, i5 in a1.cues, v10, v11 do
        if i5.section ~= section_2 then
            v1 = ("Section_%*"):format(i5.id)
            v9[v1] = (createElement(Controls.Text, {
                strong = true,
                text = if i5.section ~= "" then i5.section else "Commands",
                color = Theme.muted,
                order = m * 2,
            }))
            section_2 = i5.section
        end
        v1 = "Choose when it runs"
        if i5.trigger == "Start" then
            v1 = "At event start"
        elseif i5.trigger == "Time" then
            v1 = ("At %*s from start"):format(i5.at)
        elseif i5.trigger == "Wave" then
            v1 = ("At wave %*"):format(i5.at)
        elseif i5.trigger == "Manual" then
            v1 = "When I click Next"
        end
        v2 = if i5.enabled then if not v8[i5.id] then if i5.id ~= a1.currentCueId then "" else "Current · " else "Check settings · " else "Disabled · "
        id_2 = i5.id
        v3 = {
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.Y,
            LayoutOrder = m * 2 + 1,
            Size = UDim2.fromScale(1, 0),
        }
        v4 = {
            Layout = createElement("UIListLayout", {Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder}),
        }
        Button = Controls.Button
        v5 = {order = 1}
        v6 = v7[i5.actionId]
        v5.text = ("%*. %*"):format(m, v6 or "Unknown command")
        v5.selected = i5.id == a1.selectedCueId

        function v5.onActivated() -- Line: 77 -- upvalues: a1 (val), i5 (val)
            a1.onSelect(i5.id)
        end

        v4.Select = createElement(Button, v5)
        Text_3 = Controls.Text
        v5 = {
            size = 14,
            order = 2,
            text = ("%*%* · %*"):format(v2, v1, u26[i5.target] or "Choose who receives it"),
        }
        warning = if not v8[i5.id] then Theme.muted else Theme.warning
        v5.color = warning
        v4.Details = createElement(Text_3, v5)
        v9[id_2] = (createElement("Frame", v3, v4))
    end
    if #a1.cues == 0 then
        v9.Empty = createElement(Controls.Text, {
            text = "Add your first command, choose when it runs, then rehearse the sequence.",
            color = Theme.muted,
        })
    end
    return createElement(React.Fragment, {}, v9)
end