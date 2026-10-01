-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Text.EventGlitch
-- Decompile time: 2.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local spr = require(ReplicatedStorage.Resources.Universal.spr)
local New = require(game:GetService("ReplicatedStorage").Resources.UI.Fusion).New
local v1 = {DesiredType = "Letter", Particle = nil}
local u30 = Random.new()
local u31 = {}
local v2 = Color3.fromRGB(183, 0, 255)
local v3 = Color3.fromRGB(255, 0, 255)
u31[1] = v2
u31[2] = v3
u31[3] = Color3.fromRGB(255, 255, 255)

function v1.render(a1, a2) -- Line: 20 -- upvalues: New (val), spr (val), u30 (val), u31 (val)
    local Attribute_2, v1, v2, v3, v4, v5
    local stroke = a1.stroke
    local v6 = a1.labels:Get()
    local v7 = a1.container:Get()
    if not a1.update then
        a1.update = 0
    end
    a1.update = a1.update + a2
    if a1.animate then
        v1 = a1
    else
        a1.animate = true
        a1.animating = true
        local v8 = nil
        local v9 = nil
        v1 = a1
        for i, j in v6, v8, v9 do
            if not j:FindFirstChild("UIScale") then
                New("UIScale")({Scale = 0, Parent = j})
            end
            local Attribute = j:GetAttribute("BasePosition")
            local u49 = UDim2.fromOffset(Attribute.X.Offset, 100)
            task.defer(function() -- Line: 48 -- upvalues: j (val), u49 (val), i (val), spr (upval), Attribute (val)
                j.Position = u49
                task.wait(0.1 * i / 6)
                spr.target(j, 0.3, 2, {Position = Attribute})
                spr.target(j.UIScale, 0.3, 2, {Scale = 1})
            end)
        end
    end
    for i2, v in ipairs(v6) do
        v2 = Color3.new(1, 1, 1)
        v5 = (v:GetAttribute("BasePosition")) + UDim2.fromOffset(u30:NextInteger(-2, 2), (u30:NextInteger(-2, 2)))
        if (u30:NextNumber()) < 0.6 then
            v2 = u31[u30:NextInteger(1, #u31)]
        end
        if not v1.animating then
            v.Position = v5
        end
        v.TextColor3 = v2
        if not stroke then
            New("UIStroke")({Thickness = 4, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0), Parent = v})
        end
    end
    local v10 = v7.AbsoluteSize.Y / 4
    for i3, k in ipairs(v6) do
        Attribute_2 = k:GetAttribute("BaseTextSize")
        v3 = math.sin(tick() * 1 * 4 + i3 * 2)
        v4 = math.cos(tick() * 1 * 4 + i3 * 2)
        k.TextXAlignment = Enum.TextXAlignment.Center
        k.TextYAlignment = Enum.TextYAlignment.Center
        k.TextSize = Attribute_2 + v3 * v10
        k.Rotation = v4 * 4
        if not stroke then
            k.TextColor3 = Color3.new(1, 1, 1)
            New("UIStroke")({Thickness = 4, Transparency = 0.5, Parent = k})
        end
    end
    v1.stroke = true
end

return v1