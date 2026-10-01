-- Script path: ReplicatedStorage.Resources.UI.Components.RichText.Effects.Misc.Snowflakes
-- Decompile time: 0.47 ms

local New = (require((game:GetService("ReplicatedStorage")).Resources.UI.Fusion)).New
return {
    DesiredType = "Word",
    Particle = "Snowflakes",
    render = function(a1) -- Line: 7 -- upvalues: New (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
            New("UIStroke")({
                Name = "UIStroke",
                Thickness = 4,
                Transparency = 0.84,
                Color = Color3.fromRGB(255, 255, 255),
                Parent = v,
            })
        end
        return true
    end,
}