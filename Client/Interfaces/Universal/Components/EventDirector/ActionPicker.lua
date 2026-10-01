-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.ActionPicker
-- Decompile time: 2.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Controls = require(script.Parent.Controls)
local React = require(ReplicatedStorage.Shared.UI.React)
local Theme = require(script.Parent.Theme)
require(script.Parent.Types)
local createElement = React.createElement
return function(a1) -- Line: 16 -- upvalues: React (val), createElement (val), Controls (val), Theme (val) -- types: a1: table
    local id
    local v1, v2 = React.useState("")
    local All, All_2 = React.useState("All")
    local v3 = {}
    local v4 = {}
    for i, j in a1.actions do
        if not v4[j.category] then
            v4[j.category] = true
            table.insert(v3, j.category)
        end
    end
    table.sort(v3)
    local v5 = {{id = "All", label = "All commands"}}
    for k, n in v3 do
        table.insert(v5, {id = n, label = n})
    end
    local v6 = {
        Title = createElement(Controls.Text, {text = "Add a command", size = 24, strong = true, order = 1}),
    }
    v6.Back = createElement(Controls.Button, {text = "Back to sequence", order = 2, onActivated = a1.onBack})
    v6.Search = createElement(Controls.Input, {label = "Search commands", order = 3, value = v1, onChanged = v2})
    v6.Category = createElement(Controls.Select, {
        label = "Category",
        order = 4,
        value = All,
        options = v5,
        onChanged = All_2,
    })
    local v7 = 0
    local v8 = nil
    local v9 = nil
    for m, i5 in a1.actions, v8, v9 do
        if string.find(string.lower(i5.label .. " " .. i5.description), string.lower(v1), 1, true) then
            if All == "All" or All == i5.category then
                v7 = v7 + 1
                id = i5.id
                v6[id] = (createElement("Frame", {
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Theme.raised,
                    LayoutOrder = m + 10,
                    Size = UDim2.fromScale(1, 0),
                }, {
                    Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
                    Padding = createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 12),
                        PaddingBottom = UDim.new(0, 12),
                        PaddingLeft = UDim.new(0, 12),
                        PaddingRight = UDim.new(0, 12),
                    }),
                    Layout = createElement("UIListLayout", {
                        Padding = UDim.new(0, 8),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    }),
                    Title = createElement(Controls.Text, {size = 20, strong = true, order = 1, text = i5.label}),
                    Description = createElement(Controls.Text, {order = 2, text = i5.description, color = Theme.muted}),
                    Audience = createElement(Controls.Text, {
                        order = 3,
                        text = ("%* · %*"):format(
                            i5.category,
                            if not (#i5.contexts > 1) then if i5.contexts[1] ~= "Lobby" then "Match" else "Lobby" else "Lobby or match"
                        ),
                        color = Theme.muted,
                    }),
                    Add = createElement(Controls.Button, {
                        text = "Add to sequence",
                        order = 4,
                        disabled = a1.disabled,
                        onActivated = function() -- Line: 100 -- upvalues: a1 (val), i5 (val)
                            a1.onAdd(i5)
                        end,
                    }),
                }))
            end
        end
    end
    if v7 == 0 then
        v6.Empty = createElement(Controls.Text, {
            text = "No commands found. Try another search or category.",
            order = 10,
            color = Theme.muted,
        })
    end
    return createElement(Controls.Scroll, {}, v6)
end