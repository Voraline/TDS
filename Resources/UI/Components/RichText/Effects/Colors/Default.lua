-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Colors.Default
-- Decompile time: 0.44 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    render = function(a1) -- Line: 6 -- upvalues: New (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
        end
        New("UIStroke")({Thickness = 4, Transparency = 0.5, Color = Color3.new(0, 0, 0), Parent = v1})
        return true
    end,
}