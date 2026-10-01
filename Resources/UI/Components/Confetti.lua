-- Script path: ReplicatedStorage.Resources.UI.Components.Confetti
-- Decompile time: 3.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Resources = ReplicatedStorage.Resources
local Fusion = require(Resources.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
local Value = Fusion.Value
local Computed = Fusion.Computed
local ForValues = Fusion.ForValues
local u20 = {}
local u22 = Random.new()

local function u25(a1, a2, a3) -- Line: 37
    -- upvalues: New (val), Children (val), ForValues (val), u22 (val), Computed (val), u20 (val)
    local Frame = New("Frame")
    local v1 = {
        Name = "ConfettiStage",
        Parent = a3,
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = a1 or -100,
    }
    v1[Children] = (ForValues(a2, function(a1) -- Line: 47 -- upvalues: u22 (upval), New (upval), Computed (upval)
        local v1 = u22:NextNumber(10, 20)
        return New("Frame")({
            Name = "Confetti",
            Size = UDim2.fromOffset(v1, v1 * u22:NextNumber(0.4, 0.6)),
            Position = Computed(function() -- Line: 56 -- upvalues: a1 (val)
                return UDim2.fromOffset(a1.x:get(), a1.y:get())
            end),
            Rotation = a1.rotation,
            BackgroundColor3 = Color3.fromHSV(u22:NextNumber(), 0.5, 1),
            BackgroundTransparency = Computed(function() -- Line: 62 -- upvalues: a1 (val)
                return 1 - math.clamp(a1.life:get(), 0, 1)
            end),
        })
    end, function(a1) -- Line: 66
        a1:Destroy()
    end))
    u20[(Frame(v1))] = a2
end

local function u26(a1, a2, a3, a4, a5, a6, a7) -- Line: 74 -- upvalues: u22 (val), Value (val)
    local v1
    local v2 = a5 * 0.66
    local v3 = (a7 or 0.4) / 2
    for i = 1, a2 do
        v1 = (a4.Unit + (Vector2.new(u22:NextNumber(-v3, v3), (u22:NextNumber(-v3, v3))))).Unit * (a5 + u22:NextNumber(-v2, v2))
        table.insert(a1, {
            x = Value(a3.X),
            y = Value(a3.Y),
            rotation = Value(u22:NextInteger(0, 360)),
            life = Value(a6 + u22:NextNumber(0, 1)),
            velocityX = v1.X,
            velocityY = v1.Y,
        })
    end
end

RunService:UnbindFromRenderStep("UPDATE_CONFETTI")
RunService:BindToRenderStep("UPDATE_CONFETTI", Enum.RenderPriority.First.Value, function(a1) -- Line: 102 -- upvalues: u20 (val)
    local v1, v2, v3, v4
    for k, v in pairs(u20) do
        v3 = v:get()
        v4 = #v3
        if not (v4 < 1) then
            for i = v4, 1, -1 do
                v1 = v3[i]
                v2 = v1.life:get() - a1
                if not (v2 <= 0) then
                    v1.life:set(v2)
                    v1.x:set((v1.x:get()) + v1.velocityX)
                    v1.y:set((v1.y:get()) + v1.velocityY)
                    v1.velocityX = v1.velocityX * 0.95
                    v1.velocityY = v1.velocityY * 0.95
                    v1.velocityY = v1.velocityY + 0.2
                    v1.rotation:set((v1.rotation:get()) + 1)
                else
                    table.remove(v3, i)
                end
            end
            v:set(v3, true)
        else
            k:Destroy()
            u20[k] = nil
        end
    end
end)
return function(a1) -- Line: 140 -- upvalues: u26 (ref), u25 (ref), Value (val), New (val)
    local u1 = nil
    local u4 = if not a1.AlwaysOnTop then -1000 else 1000
    local Emitters = a1.Emitters
    if not Emitters then
        Emitters = {}
        Emitters[1] = {Amount = 20, Direction = Vector2.new(1, -1)}
    end
    a1.AlwaysOnTop = nil
    a1.Emitters = nil
    a1.Radius = nil
    local Size = a1.Size or UDim2.fromScale(1, 1)
    a1.Size = Size
    local Position = a1.Position or UDim2.fromScale(0, 0)
    a1.Position = Position
    a1.BackgroundTransparency = 1
    if a1.Event then
        a1.Event.Event:Connect(function() -- Line: 162 -- upvalues: u1 (ref), Emitters (val), u26 (upval), u25 (upval), u4 (val), Value (upval)
            if u1 and u1.Parent then
                local v1 = u1.AbsolutePosition + u1.AbsoluteSize / 2
                local Parent = u1:FindFirstAncestorOfClass("ScreenGui") or u1.Parent
                local v2 = {}
                for i, v in ipairs(Emitters) do
                    u26(v2, v.Amount, v1, v.Direction, v.Force or 30, v.Lifetime or 5, v.Radius)
                end
                u25(u4, Value(v2), Parent)
                return
            end
        end)
        a1.Event = nil
    end
    u1 = (New("Frame")(a1))
    return u1
end