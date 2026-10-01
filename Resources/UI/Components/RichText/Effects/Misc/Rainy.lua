-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.Rainy
-- Decompile time: 0.65 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "Rainy",
    render = function(a1) -- Line: 7 -- upvalues: New (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(126, 137, 188)
        end
        New("UIStroke")({Thickness = 4, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0), Parent = v1})
        return true
    end,
}