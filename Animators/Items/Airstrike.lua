-- Script path: ReplicatedStorage.Animators.Items.Airstrike
-- Decompile time: 2.51 ms

local Root = require(((game:GetService("ReplicatedStorage")):WaitForChild("Resources")):WaitForChild("Root"))
local ReplicatedStorage_2 = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Effects = (ReplicatedStorage_2:WaitForChild("Assets")):WaitForChild("Effects")
local Effects_2 = Root("Effects")
Root("Projectile")
local Thread = Root("Thread")
return {
    Bomb = function(a1, a2, a3) -- Line: 13 -- upvalues: Effects (val), TweenService (val), Thread (val), Effects_2 (val)
        local v1
        local u8 = Effects.Misc.AirstrikePlane:Clone()
        local v2 = a2[1] * CFrame.new(0, 0, 200) + Vector3.new(0, 25, 0)
        local v3 = a2[1] * CFrame.new(0, 0, -200) + Vector3.new(0, 25, 0)
        u8.Parent = workspace.CurrentCamera
        u8.Body.Engine:Play()
        u8:SetPrimaryPartCFrame(v2)
        TweenService:Create(
            u8.PrimaryPart,
            TweenInfo.new(a1.flightDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
            {CFrame = v3}
        ):Play()
        game.Debris:AddItem(u8, a1.flightDuration)
        local u62 = {}
        spawn(function() -- Line: 32
            -- upvalues: a2 (val), Effects (upval), u8 (val), TweenService (upval), a1 (val), a3 (val), u62 (val)
            local v1
            for k, v in pairs(a2) do
                v1 = Effects.Client.AirstrikeField:Clone()
                v1.CFrame = v
                v1.Mesh.Scale = Vector3.new(0, 5, 0)
                v1.Transparency = 0.3
                v1.Parent = u8
                TweenService:Create(
                    v1,
                    TweenInfo.new(1.8 + a1.bomb_time, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
                    {Transparency = 0}
                ):Play()
                TweenService:Create(
                    v1.Mesh,
                    TweenInfo.new(
                        1.8 + a1.bomb_time + (k - 1) * a1.bomb_delay,
                        Enum.EasingStyle.Linear,
                        Enum.EasingDirection.In,
                        0,
                        false,
                        0
                    ),
                    {Scale = Vector3.new(a3.radius, 5, a3.radius)}
                ):Play()
                table.insert(u62, v1)
                wait(a1.bomb_delay)
            end
        end)
        Thread.Wait(1.8)
        for k, v in pairs(a2) do
            local u87 = Effects.Projectile.StrikeMissile:Clone()
            v1 = u8.Body.CFrame - u8.Body.Position
            u87.CFrame = CFrame.new(u8.Body.BombPos.WorldPosition) * v1 * CFrame.Angles(0.4363323129985824, 0, 0)
            u87.Parent = u8
            u87.Drop:Play()
            u87.Drop.PlaybackSpeed = 0.7 + Random.new():NextNumber(0, 0.5)
            TweenService:Create(
                u87,
                TweenInfo.new(a1.bomb_time, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
                {CFrame = v * CFrame.Angles(-0.6108652381980153, 0, 0)}
            ):Play()
            TweenService:Create(
                u62[k],
                TweenInfo.new(0.75, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {Transparency = 1}
            ):Play()
            delay(a1.bomb_time, function() -- Line: 85 -- upvalues: u87 (val), Effects_2 (upval), v (val), a3 (val)
                u87.Transparency = 1
                u87.Emitter.Smoke.Enabled = false
                Effects_2.Nuke({
                    Position = v.p,
                    Radius = a3.radius,
                    Color = BrickColor.new("Br. yellowish orange"),
                    Sound = 5264403010,
                    Material = Enum.Material.Neon,
                    Particles = true,
                    Visible = true,
                })
            end)
            Thread.Wait(a1.bomb_delay)
        end
    end,
}