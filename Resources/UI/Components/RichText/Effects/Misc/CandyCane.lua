-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.CandyCane
-- Decompile time: 0.52 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Letter",
    render = function(a1) -- Line: 6 -- upvalues: New (val)
        local v1
        local v2 = a1.container:Get()
        if v2 == a1.root then
            v2 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v1 = not (i % 2 ~= 0) and Color3.new(1, 0, 0) or Color3.new(1, 1, 1)
            v.TextColor3 = v1
        end
        New("UIStroke")({
            Name = "UIStroke",
            Thickness = 4,
            Transparency = 0.5,
            Color = Color3.fromRGB(85, 0, 0),
        })
        return true
    end,
}