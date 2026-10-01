-- Script path: ReplicatedStorage.Resources.Universal.EmitterManager
-- Decompile time: 5.38 ms

local Name, v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Resources.Common.EasySound)
local EmitterUtil = require(ReplicatedStorage.Resources.Universal.EmitterUtil)
local TimescaleUtilities = require(ReplicatedStorage.Resources.Common.TimescaleUtilities)
local v2 = {}
local u26 = {}
local u28 = Random.new()
local u45 = true
if not RunService:IsServer() then
    local Settings = require(ReplicatedStorage.Client.Modules.Universal.Static.Settings)
    u45 = Settings.Game:Get("HQ Effects")
    Settings.Game:On("HQ Effects", function(a1) -- Line: 29 -- upvalues: u45 (ref)
        u45 = a1
    end)
end

function v2.manualEmit(a1) -- Line: 34 -- upvalues: u45 (ref), EasySound (val), u28 (val) -- types: a1: userdata
    local emit, v1, v2
    if not u45 then
        return
    end
    local v3 = {"ParticleEmitter", "Beam", "Trail", "Sound"}
    local v4 = {}
    local Descendants = a1:GetDescendants()
    v4[1] = a1
    v4[2] = unpack(Descendants)
    local v5 = nil
    local v6 = nil
    for i, j in v4, v5, v6 do
        if table.find(v3, j.ClassName) then
            v1 = if not j:IsA("Sound") then "EmitDelay" else "Delay"
            v2 = j:GetAttribute(v1) or 0
            local u45_2 = j:GetAttribute("EmitCount") or 0
            local u50 = j:GetAttribute("EmitDuration") or 0

            function emit() -- Line: 52 -- upvalues: j (val), u45_2 (val), EasySound (upval), u28 (upval), u50 (val)
                if j:IsA("ParticleEmitter") then
                    j:Emit(u45_2)
                end
                if j:IsA("Sound") then
                    EasySound.Play({
                        soundGroupName = "Towers",
                        destroyOnEnd = true,
                        id = j.SoundId,
                        parent = j.Parent,
                        volume = j.Volume,
                        playbackSpeed = j.PlaybackSpeed * u28:NextNumber(0.9, 1.1),
                    })
                    return
                end
                if u50 > 0 then
                    task.defer(function() -- Line: 68 -- upvalues: j (upval), u50 (upval)
                        j.Enabled = true
                        task.wait(u50)
                        j.Enabled = false
                    end)
                end
            end

            if v2 > 0 then
                task.delay(v2, emit)
            else
                emit()
            end
        end
    end
end

function v2.register(a1, a2) -- Line: 85 -- upvalues: u26 (val) -- types: a1: string, a2: table
    local Attachment_2, Attribute, v1, v2
    local Attachment = Instance.new("Attachment")
    local v3 = {originalRadius = 1, attachment = Attachment}
    v3.emitters = {}
    v3.emitterData = {}
    v3.soundData = {}
    local v4 = nil
    local v5 = nil
    local v6 = a1
    for i, j in a2, v4, v5 do
        Attribute = j:GetAttribute("Radius")
        Attachment_2 = Instance.new("Attachment")
        Attachment_2.CFrame = j.CFrame
        if Attribute then
            v3.originalRadius = Attribute
        end
        for k, n in j:GetChildren() do
            if n:IsA("ParticleEmitter") then
                v1 = n:Clone()
                v1.Enabled = false
                v2 = {
                    emitter = v1,
                    emitDelay = n:GetAttribute("EmitDelay"),
                    emitDuration = n:GetAttribute("EmitDuration"),
                    emitCount = n:GetAttribute("EmitCount") or 1,
                }
                v1.Parent = Attachment_2
                table.insert(v3.emitters, v1)
                table.insert(v3.emitterData, v2)
            elseif n:IsA("Sound") then
                table.insert(v3.soundData, {sound = n, attachment = Attachment_2})
            end
        end
        Attachment_2.Parent = Attachment
    end
    Attachment.Name = ("%*Effect"):format(v6)
    Attachment.Parent = workspace.Terrain
    u26[v6] = v3
end

function v2.Emit(a1, a2, a3, a4, a5, a6) -- Line: 132
    -- upvalues: u45 (ref), u26 (val), EmitterUtil (val), TimescaleUtilities (val), EasySound (val), u28 (val)
    if not u45 then
        return
    end
    local v1 = u26[a1]
    if not v1 then
        warn("EmitterManager: Emitter " .. a1 .. " does not exist")
        return
    end
    if a3 and v1.originalRadius ~= nil then
        EmitterUtil:scaleEmitter(v1.emitters, a3 / v1.originalRadius, true)
    end
    v1.attachment.WorldCFrame = a2
    for i, v in ipairs(v1.emitterData) do
        local u67 = v.emitCount * (a4 or 1)
        local u69 = v.emitDuration or 0
        if not (0 < (v.emitDelay or 0)) then
            v.emitter:Emit(u67)
            if u69 > 0 then
                v.emitter.Enabled = true
                TimescaleUtilities.Delay(v.emitDuration, function() -- Line: 166 -- upvalues: v (val)
                    v.emitter.Enabled = false
                end)
            end
        else
            TimescaleUtilities.Delay(v.emitDelay, function() -- Line: 160 -- upvalues: v (val), u67 (val), u69 (val), TimescaleUtilities (upval)
                v.emitter:Emit(u67)
                if u69 > 0 then
                    v.emitter.Enabled = true
                    TimescaleUtilities.Delay(v.emitDuration, function() -- Line: 166 -- upvalues: v (upval)
                        v.emitter.Enabled = false
                    end)
                end
            end)
        end
    end
    if not a5 and a5 ~= nil then
        return
    end
    for i2, i3 in ipairs(v1.soundData) do
        EasySound.Play({
            destroyOnEnd = true,
            audioGroup = "Towers",
            id = i3.sound.SoundId,
            parent = i3.attachment,
            volume = i3.sound.Volume,
            playbackSpeed = u28:NextNumber(0.9, 1.1),
        })
    end
end

function v2.toggle(a1, a2, a3) -- Line: 196
    -- upvalues: TimescaleUtilities (val)
    local Attribute
    local v1 = a3
    for i, j in a1:GetDescendants() do
        if not v1 or j:IsA(v1) then
            if j:IsA("ParticleEmitter") or j:IsA("Beam") or j:IsA("Trail") then
                Attribute = j:GetAttribute("Delay")
                if not a2 or not Attribute or not (Attribute > 0) then
                    j.Enabled = a2
                else
                    TimescaleUtilities.Delay(Attribute, function() -- Line: 206 -- upvalues: j (val), a2 (val)
                        j.Enabled = a2
                    end)
                end
            end
        end
    end
end

for i, j in ReplicatedStorage.Assets.Effects.SingleEmit:GetChildren() do
    Name = j.Name
    v1 = {}
    for k, n in j:GetChildren() do
        if n:IsA("Attachment") then
            table.insert(v1, n)
        end
    end
    v2.register(Name, v1)
end
return v2