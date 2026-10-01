-- Script path: ReplicatedStorage.Resources.UI.Components.WrapChildren
-- Decompile time: 0.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Resources.UI.Fusion)
local Children = Fusion.Children
local New = Fusion.New
return function(a1) -- Line: 7 -- upvalues: New (val), Children (val)
    local Position, Size, v1
    local v2 = {}
    for k, v in pairs(a1) do
        v1 = v
        if v:IsA("GuiObject") then
            Size = v.Size
            Position = v.Position
            v.Size = UDim2.fromScale(1, 1)
            v.Position = UDim2.fromScale(0, 0)
            v1 = New("Frame")({Size = Size, Position = Position, BackgroundTransparency = 1, [Children] = v})
        end
        table.insert(v2, v1)
    end
    return v2
end