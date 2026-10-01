-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.GlitchEffectTextEvent
-- Decompile time: 2.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local GameType = require(ReplicatedStorage.Shared.Modules.GameType)
local GlitchEventText = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.GlitchEventText)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local u38 = {
    EVENT_START = {
        id = 107096495392778,
        timeStamps = {
            {time = 0, text = "A feeling can transcend a lifetime"},
            {time = 3.923, text = "even when the memory is forgotten."},
            {time = 7.048, text = "Suffering is the beginning of creation."},
            {time = 10.947, text = "But to create, and only create,"},
            {time = 14.769, text = "is the true definition of suffering."},
            {time = 18.418, text = "So I will end it,"},
            {time = 20.654, text = "and nothing will remain. Including you."},
        },
    },
    EVENT_END = {
        id = 119907461473670,
        timeStamps = {
            {
                time = 0.183,
                text = "Survival is an illusion the weak cling to until they stand before me.",
            },
            {time = 6.346, text = "The realms have fractured, and all are beyond saving."},
            {time = 11.192, text = "What is to come cannot be stopped,"},
            {time = 14.077, text = "and you will not live to see it."},
        },
    },
}

local function render(a1) -- Line: 39 -- upvalues: createElement (val), GlitchEventText (val)
    return a1.enabled and createElement(GlitchEventText, {text = a1.text})
end

return function(a1) -- Line: 45
    -- upvalues: React (val), GameState (val), u38 (val), EasySound (val), RunService (val), GameType (val)
    -- upvalues: ReplicatedStorage (val), createElement (val), render (val)
    a1.setDisplayOrder(99999999)
    a1.setIgnoreGuiInset(true)
    local u10, u11 = React.useState(false)
    local v1, u16 = React.useState("")
    local v2 = u10 ~= false
    React.useEffect(function() -- Line: 54 -- upvalues: GameState (upval), u11 (val)
        local u9 = (GameState.Replicator:GetStateChangedSignal("TextGlitchEffectEvent")):Connect(function() -- Line: 57 -- upvalues: GameState (upval), u11 (upval)
            local v1 = GameState.Replicator:Get("TextGlitchEffectEvent")
            u11(v1)
        end)
        return function() -- Line: 62 -- upvalues: u9 (val)
            u9:Disconnect()
        end
    end, {})
    local v3 = {v2}
    React.useEffect(function() -- Line: 67
        -- upvalues: u38 (upval), u10 (val), EasySound (upval), RunService (upval), u16 (val), GameType (upval)
        -- upvalues: ReplicatedStorage (upval)
        local u2 = u38[u10]
        if not u2 then
            return
        end
        local u7 = EasySound.Create({volume = 0.5, id = u2.id})
        u7:Play()
        local u16_2 = RunService.Heartbeat:Connect(function() -- Line: 81 -- upvalues: u7 (val), u2 (val), u16 (upval)
            for i, j in u2.timeStamps do
                if j.time <= u7.TimePosition then
                    u16(j.text)
                end
            end
        end)
        u7.Ended:Once(function() -- Line: 90 -- upvalues: u16_2 (val), u16 (upval), GameType (upval), ReplicatedStorage (upval)
            u16_2:Disconnect()
            u16("")
            if GameType:IsA("Lobby") then
                task.spawn((require(ReplicatedStorage.Client.Controllers.Lobby.LiveEventEffectsController)).OnSequenceComplete)
            end
        end)
        return function() -- Line: 102 -- upvalues: u16_2 (val)
            u16_2:Disconnect()
        end
    end, v3)
    return createElement(render, {enabled = v2, text = v1})
end