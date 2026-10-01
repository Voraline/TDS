-- Script path: ReplicatedStorage.Resources.UI.Components.UIParticle.Colllector
-- Decompile time: 1.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Resources.Common.Maid)
local u17 = require(ReplicatedStorage.Resources.Common.Standalone.Signal).new()
;(workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(function() -- Line: 8 -- upvalues: u17 (val)
    if workspace.CurrentCamera then
        u17:Fire(workspace.CurrentCamera)
    end
end)

local function recomputeCollector(a1, a2) -- Line: 14 -- types: a1: userdata, a2: userdata
    local ViewportSize = workspace.CurrentCamera.ViewportSize
    local v1 = -a1.AbsolutePosition
    a2.Position = UDim2.fromOffset(v1.X, v1.Y)
    a2.Size = UDim2.fromOffset(ViewportSize.X, ViewportSize.Y)
end

return function(a1) -- Line: 22 -- upvalues: Maid (val), u17 (val) -- types: a1: userdata
    local Parent = a1.Parent
    if not Parent:IsA("LayerCollector") then
        assert(not Parent.AutomaticSize ~= Enum.AutomaticSize.None, "hook must have AutomaticSize set to None")
    end
    local u17_2 = Maid.new()
    local Frame = Instance.new("Frame")
    Frame.AnchorPoint = Vector2.new(0, 0)
    Frame.BackgroundTransparency = 1
    Frame.ZIndex = Parent.ZIndex
    u17_2:Mark((u17:Connect(function() -- Line: 37 -- upvalues: Parent (val), Frame (val)
        local v1 = Parent
        local v2 = Frame
        local ViewportSize = workspace.CurrentCamera.ViewportSize
        local v3 = -v1.AbsolutePosition
        v2.Position = UDim2.fromOffset(v3.X, v3.Y)
        v2.Size = UDim2.fromOffset(ViewportSize.X, ViewportSize.Y)
    end)))
    u17_2:Mark(((Parent:GetPropertyChangedSignal("AbsoluteSize")):Connect(function() -- Line: 41 -- upvalues: Parent (val), Frame (val)
        local v1 = Parent
        local v2 = Frame
        local ViewportSize = workspace.CurrentCamera.ViewportSize
        local v3 = -v1.AbsolutePosition
        v2.Position = UDim2.fromOffset(v3.X, v3.Y)
        v2.Size = UDim2.fromOffset(ViewportSize.X, ViewportSize.Y)
    end)))
    u17_2:Mark(((Parent:GetPropertyChangedSignal("AbsolutePosition")):Connect(function() -- Line: 45 -- upvalues: Parent (val), Frame (val)
        local v1 = Parent
        local v2 = Frame
        local ViewportSize = workspace.CurrentCamera.ViewportSize
        local v3 = -v1.AbsolutePosition
        v2.Position = UDim2.fromOffset(v3.X, v3.Y)
        v2.Size = UDim2.fromOffset(ViewportSize.X, ViewportSize.Y)
    end)))
    u17_2:Mark((Parent.AncestryChanged:Connect(function(a1, a2) -- Line: 49 -- upvalues: u17_2 (val), Frame (val)
        if not a2 then
            u17_2:Sweep()
            Frame:Destroy()
        end
    end)))
    local ViewportSize = workspace.CurrentCamera.ViewportSize
    local v1 = -Parent.AbsolutePosition
    Frame.Position = UDim2.fromOffset(v1.X, v1.Y)
    Frame.Size = UDim2.fromOffset(ViewportSize.X, ViewportSize.Y)
    Frame.Parent = Parent
    return Frame
end