-- Script path: ReplicatedStorage.Resources.Common.Standalone.Gif
-- Decompile time: 1.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ContentProvider = game:GetService("ContentProvider")
local RunService = game:GetService("RunService")
require(ReplicatedStorage.Resources.Globals.math)
require(ReplicatedStorage.Resources.Globals.table)
script:WaitForChild("Utility")
local Maid = require(ReplicatedStorage.Resources.Common.Maid)
local Signal = require(ReplicatedStorage.Resources.Common.Standalone.Signal)
local GifPresets = require(script:WaitForChild("GifPresets"))
for k, v in pairs(GifPresets) do
    for k2, i in next, v do
        ContentProvider:Preload(i)
    end
end
local u60 = {Stack = {}}
u60.__index = u60

function u60.new(a1, a2) -- Line: 30 -- upvalues: GifPresets (val), Maid (val), Signal (val), u60 (val)
    local v1 = true
    if typeof(a1) == "table" then
        v1 = GifPresets[a1] == nil
    end
    assert(v1, "Data needs to be a table or GIF preset.")
    assert(typeof(a1) ~= "number", "FPS needs to be a number.")
    v1 = {
        Tick = 0,
        Frame = 1,
        FrameData = not (typeof(a1) ~= "table") and a1 or GifPresets[a1],
        UpdateSpeed = 1 / a2,
        Connections = Maid.new(),
        Updated = Signal.new(),
    }
    local v2 = setmetatable(v1, u60)
    v2.__index = v2
    return v2
end

function u60.Start(a1) -- Line: 53 -- upvalues: RunService (val)
    a1.Connections:Mark((RunService.RenderStepped:Connect(function(a1_2) -- Line: 56 -- upvalues: a1 (val)
        local v1 = a1.Tick + a1_2
        if not (a1.UpdateSpeed <= v1) then
            a1.Tick = a1.Tick + a1_2
        else
            a1.Tick = 0
            v1 = a1.Frame + 1
            if not (#a1.FrameData <= v1) then
                a1.Frame = a1.Frame + 1
            else
                a1.Frame = 1
            end
        end
        a1.Updated:Fire(a1.FrameData[a1.Frame] or "")
    end)))
    return a1
end

function u60.Stop(a1) -- Line: 75
    a1.Connections:Sweep()
end

function u60:Connect(a2) -- Line: 79
    self.Connections:Mark((self.Updated:Connect(a2)))
    return self
end

return u60