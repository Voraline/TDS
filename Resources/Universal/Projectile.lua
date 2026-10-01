-- Script path: ReplicatedStorage.Resources.Universal.Projectile
-- Decompile time: 22.51 ms

local Container
local ServerStorage = game:GetService("ServerStorage")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Resources.Universal.GameState)
local Scheduler = require(ReplicatedStorage.Resources.Scheduler)
local TypedPromise = require(ReplicatedStorage.Resources.Common.TypedPromise)
local u36 = RunService:IsServer()
local u37 = {}
if not u36 then
    Container = workspace
else
    Container = require(ServerStorage.Server.Modules.Game.Modules.NPC).Container
    if not Container then
        Container = workspace
    end
end
local v1 = {}
local TimescaleUtilities = require(ReplicatedStorage.Resources.Common.TimescaleUtilities)
local Enum = require(ReplicatedStorage.Resources.Universal.Enum)
local GameState_2 = require(ReplicatedStorage.Resources.Universal.GameState)
local math = require(ReplicatedStorage.Resources.Globals.math)
local Heartbeat = u36 and RunService.Heartbeat or RunService.RenderStepped
local u77 = {}
local u78 = {}
local u79 = {}
local u80 = {}
local u95 = nil
if u36 then
    u95 = require(ServerStorage.Server.Modules.Game.Modules.NPC)
end

local function quadBezier(a1, a2, a3, a4) -- Line: 42
    return (1 - a1) ^ 2 * a2 + 2 * (1 - a1) * a1 * a3 + a1 ^ 2 * a4
end

local function getCurved(a1, a2, a3, a4) -- Line: 46 -- upvalues: u36 (val)
    local p = a3.Start.p
    local End = a3.End
    local v1 = (1 - a2) ^ 2 * p + 2 * (1 - a2) * a2 * a4 + a2 ^ 2 * End
    if u36 then
        return CFrame.new(v1)
    end
    return (CFrame.new(a1.Position, v1)) - a1.Position + v1
end

local function getLinear(a1, a2, a3) -- Line: 55 -- upvalues: math (val)
    local v1 = math.lerp(CFrame.new(a3.Start.p).p, a3.End, a2)
    return (CFrame.new(a1.Position, v1)) - a1.Position + v1
end

if not u36 then
    local DebugController = require(ReplicatedStorage.Client.Modules.Universal.Compatibility.Controllers.DebugController)
    local Gizmo = DebugController.Gizmo
    DebugController.createGizmo("Projectiles", function() -- Line: 67 -- upvalues: u37 (val), Gizmo (val)
        local CFrame, Size
        for i, j in u37 do
            CFrame = i.CFrame
            Size = i.Size
            Gizmo.PushProperty(Gizmo.Styles.Color, Color3.fromRGB(122, 245, 241))
            Gizmo.Box:Draw(CFrame, Size, false)
            Gizmo.PushProperty(Gizmo.Styles.Color, Color3.fromRGB(255, 53, 144))
            Gizmo.Ray:Draw(CFrame.Position, CFrame.Position + j)
        end
    end)
end

function v1.CalcDuration(a1, a2) -- Line: 81
    return (a2.Start.p - a2.End).Magnitude / a2.Speed
end

function MultiHitRayCast(a1) -- Line: 86 -- upvalues: Container (val), CollectionService (val)
    local v1, v2, v3
    local v4 = Ray.new(a1.Position, a1.Direction)
    local v5 = {}
    local v6 = 0
    local v7 = a1
    repeat
        v2 = Container:FindPartOnRayWithIgnoreList(v4, v7.Ignore)
        if not v2 then
            v1 = true
        elseif not CollectionService:HasTag(v2, "NPCHitbox") then
            table.insert(v7.Ignore, v2)
            v1 = false
        else
            table.insert(v7.Ignore, v2.Parent)
            table.insert(v5, v2.Parent)
            v1 = false
            v6 = v6 + 1
        end
        if v1 then
            break
        end
        v3 = v7.Hits + v6
    until (v7.MaxHits or 1) <= v3
    return nil, nil, nil, v5
end

local function laser(a1, a2) -- Line: 114 -- upvalues: TimescaleUtilities (val)
    local Part = Instance.new("Part")
    Part.Parent = workspace.Trash
    Part.BrickColor = BrickColor.new("Bright red")
    Part.Material = "Neon"
    Part.Transparency = 0.25
    Part.Anchored = true
    Part.CanCollide = false
    local magnitude = (a1 - a2).magnitude
    Part.Size = Vector3.new(0.1, 0.1, magnitude)
    Part.CFrame = (CFrame.new(a1, a2)) * CFrame.new(0, 0, -magnitude / 2)
    TimescaleUtilities.CleanUp(Part, 1)
end

if not u36 then
    local DebugController_2 = require(ReplicatedStorage.Client.Modules.Universal.Compatibility.Controllers.DebugController)
    local Gizmo_2 = DebugController_2.Gizmo
    DebugController_2.createGizmo("Projectiles", function() -- Line: 135 -- upvalues: u37 (val), Gizmo_2 (val)
        local CFrame, Size
        for i, j in u37 do
            CFrame = i.CFrame
            Size = i.Size
            Gizmo_2.PushProperty(Gizmo_2.Styles.Color, Color3.fromRGB(122, 245, 241))
            Gizmo_2.Box:Draw(CFrame, Size, false)
            Gizmo_2.PushProperty(Gizmo_2.Styles.Color, Color3.fromRGB(255, 53, 144))
            Gizmo_2.Ray:Draw(CFrame.Position, CFrame.Position + j)
        end
    end)
end

local function createHitscanModel(a1) -- Line: 149 -- upvalues: ServerStorage (val), u80 (val)
    local WorldModel = Instance.new("WorldModel")
    WorldModel.Name = ("%*'s world model"):format(a1.UserId)
    WorldModel.Parent = ServerStorage
    u80[a1] = WorldModel
    return WorldModel
end

function v1.MultiRaycast(a1) -- Line: 159
    -- upvalues: CollectionService (val), Container (val), u95 (ref)
    local v1, v2
    local v3 = 0
    local v4 = {}
    local v5 = {}
    local v6 = RaycastParams.new()
    v6.FilterDescendantsInstances = CollectionService:GetTagged("NPCHitbox")
    v6.FilterType = Enum.RaycastFilterType.Include
    local v7 = a1
    repeat
        v1 = Container:Raycast(v7.Origin, v7.Direction, v6)
        if v1 then
            v2 = u95.getNPCByModel(v1.Instance)
            if not v2 then
                table.insert(v5, v1.Position)
                v3 = v3 + 1
            elseif not v7.EnemyFilter or not v7.EnemyFilter(v2) then
                table.insert(v4, v2)
                table.insert(v5, v1.Position)
                v3 = v3 + 1
            end
        end
    until v1 == nil or v7.MaxHits <= v3
    return v4, v5
end

function v1.LagCompensatedRaycast(a1, a2) -- Line: 195
    -- upvalues: u80 (val), ServerStorage (val), u95 (ref), math (val), Enum (val)
    local CFrame_2, v1, v2, v3, v4, v5, v6
    local v7 = u80[a2.player]
    if not v7 then
        local player = a2.player
        v7 = Instance.new("WorldModel")
        v7.Name = ("%*'s world model"):format(player.UserId)
        v7.Parent = ServerStorage
        u80[player] = v7
    end
    if a2.clientSync == nil then
        return
    end
    local Attribute = workspace:GetAttribute("Sync")
    if not Attribute then
        return nil, Vector3.new(), nil, {}
    end

    local function getClosestSync() -- Line: 215 -- upvalues: u95 (upval), a2 (val)
        local CurrentSync = 0
        local v1 = nil
        local v2 = nil
        for i, j in u95.PreviousPositions, v1, v2 do
            for k, n in j do
                if n.CurrentSync <= a2.clientSync and CurrentSync < n.CurrentSync then
                    CurrentSync = n.CurrentSync
                end
            end
            if CurrentSync ~= 0 then
                break
            end
        end
        return CurrentSync
    end

    local function getNextClosestSync(a1) -- Line: 232 -- upvalues: u95 (upval) -- types: a1: number
        local v1 = nil
        local v2 = nil
        for i, j in u95.PreviousPositions, v1, v2 do
            for k, n in j do
                if j[k - 1] and v3 == j[k - 1].CurrentSync then
                    return n.CurrentSync
                end
            end
        end
        return nil
    end

    local v8 = getClosestSync()
    local v9 = math.ilerp(v8, getNextClosestSync(v8) or Attribute, a2.clientSync)
    local v10 = {}
    local v11 = false
    v7:ClearAllChildren()
    local v12 = nil
    local v13 = nil
    for i, j in u95.PreviousPositions, v12, v13 do
        v3 = nil
        v4 = nil
        for k, n in j, v3, v4 do
            CFrame_2 = i.CFrame
            if n[k + 1] then
                CFrame_2 = n[k + 1].CFrame
            end
            if n.CurrentSync == v8 then
                v11 = true
                local Part = Instance.new("Part")
                Part:AddTag("NPCHitbox")
                Part.Size = i.Size + Vector3.new(0, 0, 2)
                Part.CFrame = (n.CFrame:Lerp(CFrame_2, v9)) * CFrame.new(0, (math.abs(n.Model.PrimaryPart.Node.Position.Y)) - Part.Size.Y / 2, 0)
                Part.Anchored = true
                Part.CanCollide = false
                Part.Size = Part.Size + Vector3.new(0, 1, 0)
                Part.Parent = v7
                v10[Part] = i
                task.delay(10, function() -- Line: 294 -- upvalues: Part (val)
                    Part:Destroy()
                end)
                break
            end
        end
        if not v11 then
            local Part_2 = Instance.new("Part")
            Part_2:AddTag("NPCHitbox")
            Part_2.Size = i.Size + Vector3.new(0, 0, 2)
            Part_2.CFrame = i.CFrame
            Part_2.Anchored = true
            Part_2.CanCollide = false
            Part_2.Size = Part_2.Size + Vector3.new(0, 1, 0)
            Part_2.Parent = v7
            v10[Part_2] = i
            task.delay(10, function() -- Line: 315 -- upvalues: Part_2 (val)
                Part_2:Destroy()
            end)
        end
    end
    local v14 = Ray.new(a2.position, a2.direction)
    local v15 = 0
    v3 = {}
    repeat
        v4, v5, v6 = v7:FindPartOnRayWithIgnoreList(v14, a2.ignore)
        v13 = v4
        v1 = v5
        v2 = v6
        if not v13 then
            v12 = true
        elseif not v13:HasTag("NPCHitbox") then
            table.insert(a2.ignore, v13)
            v12 = false
        else
            table.insert(a2.ignore, v13)
            v12 = false
            v4 = u95.getNPCByModel(v10[v13])
            if v4.Team ~= a2.inheritance.Team then
                a2.inheritance:DealDamage(v4, v15, Enum.DamageType.Normal)
                table.insert(v3, v4.Replicator.ReplicationFolder)
                v15 = v15 + 1
            end
        end
    until v12 or v15 >= 3
    return v13, v1, v2, v3
end

function v1.PeirceRaycast(a1, a2) -- Line: 361
    -- upvalues: Container (val), CollectionService (val), u95 (ref), Enum (val)
    local v1, v2, v3
    local v4 = 0
    local v5 = RaycastParams.new()
    v5.FilterType = Enum.RaycastFilterType.Exclude
    v5.FilterDescendantsInstances = {}
    local v6 = {}
    local v7 = a2
    repeat
        v2 = Container:Raycast(v7.start, v7.direction, v5)
        if not v2 then
            v1 = true
        else
            v3 = CollectionService
            if not v3:HasTag(v2.Instance, "NPCHitbox") then
                v5:AddToFilter({v2.Instance})
                v1 = false
            else
                v5:AddToFilter({v2.Instance.Parent})
                v1 = false
                v3 = u95.getNPCByModel(v2.Instance)
                if v3.Team ~= v7.tower.Team then
                    v7.tower:DealDamage(v3, v4, Enum.DamageType.Normal)
                    table.insert(v6, v3.Replicator.ReplicationFolder)
                    v4 = v4 + 1
                end
            end
        end
    until v1 or v7.maxPerice <= v4
    return v6
end

function v1.Raycast(a1, a2, a3, a4, a5) -- Line: 403
    -- upvalues: Container (val), CollectionService (val), u95 (ref), Enum (val)
    local v1, v2, v3, v4, v5, v6, v7
    local v8 = Ray.new(a3, a4)
    local v9 = 0
    local v10 = {}
    local v11, v12 = a5, a2
    repeat
        v1, v2, v3 = Container:FindPartOnRayWithIgnoreList(v8, v11)
        v5 = v1
        v6 = v2
        v7 = v3
        if not v5 then
            v4 = true
        elseif not CollectionService:HasTag(v5, "NPCHitbox") then
            table.insert(v11, v5)
            v4 = false
        else
            table.insert(v11, v5.Parent)
            v4 = false
            v1 = u95.getNPCByModel(v5)
            if v1.Team ~= v12.Team then
                v12:DealDamage(v1, v9, Enum.DamageType.Normal)
                table.insert(v10, v1.Replicator.ReplicationFolder)
                v9 = v9 + 1
            end
        end
    until v4 or v9 >= 3
    return v5, v6, v7, v10
end

function v1.Throw(a1, a2, a3) -- Line: 445 -- upvalues: u36 (val), GameState_2 (val), u77 (val), u37 (val), math (val)
    local u35
    local u3 = 0
    local Start = a2.Start
    local u5 = 0
    local u12 = nil
    if not u36 then
        u12 = a2.Part:Clone()
        u12.CFrame = Start
        u12.Parent = workspace.CurrentCamera
    end
    local Magnitude = (Start.p - a2.End).Magnitude
    local u22 = Magnitude / a2.Speed
    local u33 = (Start.p + a2.End) / 2 + Vector3.new(0, Magnitude / a2.Gravity, 0)

    function u35(a1) -- Line: 465
        -- upvalues: GameState_2 (upval), u3 (ref), u22 (val), u5 (ref), a2 (val), u77 (upval), u35 (ref), u36 (upval)
        -- upvalues: u37 (upval), u12 (ref), u33 (val), math (upval), a3 (val)
        local v1 = a1 * GameState_2.TimeScale
        u3 = u3 + v1
        local v2 = u3 / u22
        if not (v2 >= 1) then
            local v3 = u5
            if not ((a2.MaxHits or 1) <= v3) then
                local Position, v4, v5, v6, v7, v8, v9
                if a2.Type ~= "Curve" then
                    v4 = u12
                    v5 = a2
                    v6 = math.lerp(CFrame.new(v5.Start.p).p, v5.End, v2)
                    v3 = (CFrame.new(v4.Position, v6)) - v4.Position + v6
                else
                    v4 = u12
                    v5 = a2
                    v6 = u33
                    local p = v5.Start.p
                    local End = v5.End
                    v7 = (1 - v2) ^ 2 * p + 2 * (1 - v2) * v2 * v6 + v2 ^ 2 * End
                    v3 = if not u36 then (CFrame.new(v4.Position, v7)) - v4.Position + v7 else CFrame.new(v7)
                    if not v3 then
                        v4 = u12
                        v5 = a2
                        v6 = math.lerp(CFrame.new(v5.Start.p).p, v5.End, v2)
                        v3 = (CFrame.new(v4.Position, v6)) - v4.Position + v6
                    end
                end
                if not u36 then
                    v3 = if a2.Type ~= "Curve" then v3 * CFrame.Angles(math.rad(-a2.Turn * u3), 0, 0) else v3 * CFrame.Angles(0, 0, math.rad(a2.Turn * u3))
                end
                if a2.Type ~= "Curve" then
                    v5 = u12
                    v6 = v2 - v1
                    v7 = a2
                    v8 = math.lerp(CFrame.new(v7.Start.p).p, v7.End, v6)
                    Position = ((CFrame.new(v5.Position, v8)) - v5.Position + v8).Position
                else
                    v5 = u12
                    v6 = v2 - v1
                    v7 = a2
                    v8 = u33
                    local p_2 = v7.Start.p
                    local End_2 = v7.End
                    v9 = (1 - v6) ^ 2 * p_2 + 2 * (1 - v6) * v6 * v8 + v6 ^ 2 * End_2
                    Position = (if not u36 then (CFrame.new(v5.Position, v9)) - v5.Position + v9 else CFrame.new(v9)).Position
                    if not Position then
                        v5 = u12
                        v6 = v2 - v1
                        v7 = a2
                        v8 = math.lerp(CFrame.new(v7.Start.p).p, v7.End, v6)
                        Position = ((CFrame.new(v5.Position, v8)) - v5.Position + v8).Position
                    end
                end
                v5 = (v3.Position - Position) * 2
                v6 = MultiHitRayCast
                v7 = {Position = v3.Position, Direction = v5}
                local Ignore = a2.Ignore or {}
                v7.Ignore = Ignore
                v7.Hits = u5
                v7.MaxHits = a2.MaxHits or 1
                _, _, _, v9 = v6(v7)
                for k, v in pairs(v9) do
                    if a3 then
                        a3(v)
                    end
                    u5 = u5 + 1
                end
                if not u36 then
                    u37[u12] = v5
                    u12.CFrame = v3
                end
                return
            end
        end
        u77[u35] = nil
        if not u36 then
            u37[u12] = nil
            if u12.Name == "RailgunBullet" then
                u12.Transparency = 1
                task.wait(1)
            end
            u12:Destroy()
        end
    end

    u77[u35] = true
    return u12
end

function v1.Pierce(a1, a2, a3) -- Line: 530
    -- upvalues: GameState_2 (val), math (val), TimescaleUtilities (val), u37 (val), u78 (val), u36 (val)
    local u83
    local magnitude = (a2.Start - a2.End).magnitude
    local u91 = magnitude / a2.Speed
    local u87 = 0
    local u95 = 0
    local u74 = nil
    local u75 = {}
    if a2.Projectile then
        u74 = a2.Projectile:Clone()
        u74.CFrame = CFrame.new(a2.Start, a2.End)
        u74.Parent = workspace.CurrentCamera
        for k, v in pairs(u74:GetDescendants()) do
            if v:IsA("Trail") or v:IsA("ParticleEmitter") or v:IsA("Beam") then
                v.Enabled = true
                table.insert(u75, v)
            elseif v:IsA("Weld") or v:IsA("WeldConstraint") then
                v:Destroy()
            end
        end
        u74.Anchored = true
    end

    function u83(a1) -- Line: 564
        -- upvalues: u87 (ref), GameState_2 (upval), math (upval), u91 (val), u95 (ref), a2 (val), u74 (ref)
        -- upvalues: TimescaleUtilities (upval), u37 (upval), u78 (upval), u83 (ref), u75 (val), magnitude (val)
        -- upvalues: u36 (upval), a3 (val)
        u87 = u87 + a1 * GameState_2.TimeScale
        local v1 = math.clamp(u87 / u91, 0, 1)
        if not (v1 >= 1) then
            local v2 = u95
            if not (a2.MaxHits <= v2) then
                local v3
                v2 = (CFrame.new(a2.Start, a2.End)) * CFrame.new(0, 0, -magnitude * v1)
                local lookVector = v2.lookVector
                _, _, _, v3 = MultiHitRayCast({
                    Position = v2.p,
                    Direction = lookVector * a2.Size,
                    Ignore = a2.Ignore,
                    Hits = u95,
                    MaxHits = a2.MaxHits,
                })
                u95 = u95 + #v3
                if u74 then
                    u74.CFrame = v2
                end
                if not u36 then
                    u37[u74] = lookVector * a2.Size
                end
                if #v3 > 0 then
                    if u36 then
                        for k2, i in pairs(v3) do
                            if a3 then
                                a3(i)
                            end
                        end
                        return
                    end
                    if u74 then
                        local HitSound = u74:FindFirstChild("HitSound")
                        if HitSound then
                            local v4 = HitSound:Clone()
                            v4.PlaybackSpeed = (Random.new()):NextNumber(v4.PlaybackSpeed * 0.8, v4.PlaybackSpeed * 1.3)
                            v4.Name = "HitClone"
                            v4.Parent = u74
                            v4:Play()
                            TimescaleUtilities.CleanUp(v4, v4.TimeLength)
                        end
                        local Indicator = u74:FindFirstChild("Indicator")
                        if Indicator then
                            Indicator.DamageEmitter:Emit((math.random(5, 10)))
                            Indicator.HitEmitter:Emit(1)
                        end
                    end
                    for k, v in pairs(v3) do
                        if a3 then
                            a3(v)
                        end
                    end
                end
                return
            end
        end
        if u74 then
            if not a2.Decay then
                u37[u74] = nil
                u74:Destroy()
            else
                u74.Transparency = 1
                TimescaleUtilities.CleanUp(u74, a2.Decay, function() -- Line: 572 -- upvalues: u37 (upval), u74 (upval)
                    u37[u74] = nil
                end)
                for k3, j in pairs(u74:GetDescendants()) do
                    if j:IsA("ParticleEmitter") then
                        j.Enabled = false
                    elseif j:IsA("BasePart") then
                        j.Transparency = 1
                    end
                end
            end
        end
        u78[u83] = nil
        if #u75 > 0 then
            for k4, k5 in pairs(u75) do
                k5.Enabled = false
            end
        end
    end

    u78[u83] = true
end

function v1.throwWithPhysics(a1, a2) -- Line: 674
    -- upvalues: TypedPromise (val), GameState (val), math (val), u37 (val), u79 (val)
    return TypedPromise.new(function(a1, a2_2) -- Line: 675 -- upvalues: a2 (val), GameState (upval), math (upval), u37 (upval), u79 (upval)
        local u66, velocity
        local asset = a2.asset
        assert(asset and asset:IsA("BasePart"), "asset must be a BasePart")
        local bounce = a2.bounce
        local rotation = a2.rotation
        local gravity = a2.gravity
        if not gravity then
            gravity = Vector3.new(0, -workspace.Gravity, 0)
        end
        local start = a2.start
        local u28 = 0
        if not a2.velocity then
            local duration = a2.duration
            velocity = (a2.target - start - 0.5 * gravity * duration * duration) / duration
        else
            velocity = a2.velocity
        end
        local u46 = nil
        local u48 = RaycastParams.new()
        u48.FilterType = Enum.RaycastFilterType.Include
        local include = a2.include or {}
        u48.FilterDescendantsInstances = include
        u48.RespectCanCollide = true
        u48.IgnoreWater = true
        asset.Anchored = true
        asset.CanCollide = false
        asset.Position = a2.start

        function u66(a1_2) -- Line: 712
            -- upvalues: GameState (upval), u28 (ref), gravity (val), velocity (ref), start (ref), asset (val)
            -- upvalues: math (upval), u48 (val), u37 (upval), rotation (val), a2 (upval), bounce (val), u46 (ref)
            -- upvalues: u79 (upval), u66 (ref), a1 (val)
            local v1
            local v2 = a1_2 * GameState.TimeScale
            u28 = u28 + v2
            local v3 = 0.5 * gravity * u28 * u28 + velocity * u28 + start
            local v4 = v3 - asset.Position
            v4 = v4.Unit * math.max(v4.Magnitude, (asset.Size * v4.Unit).Magnitude / 2)
            local v5 = workspace:Shapecast(asset, v4, u48)
            u37[asset] = v4
            local v6 = false
            if not v5 then
                v1 = CFrame.new(v3)
                asset.CFrame = v1 * (rotation and rotation(v4) or CFrame.identity)
            else
                v6 = true
                v1 = CFrame.new(v5.Position + v5.Normal * asset.Size * 0.57)
                asset.CFrame = v1 * (rotation and rotation(velocity) or CFrame.identity)
                velocity = (v4 - 2 * v4:Dot(v5.Normal) * v5.Normal).Unit * velocity.Magnitude * 0.3
                start = asset.Position
                u28 = 0
                if a2.onHit then
                    a2.onHit(v5.Instance)
                end
                if bounce then
                    bounce(velocity)
                end
            end
            if not (v3.Y < workspace.FallenPartsDestroyHeight) and not (velocity.Magnitude < 0.1) then
                if v6 and a2.finishOnHit then
                    u46:Disconnect()
                    u79[u66] = nil
                    u37[asset] = nil
                    a1(v3)
                    return true
                end
                return false
            end
            u46:Disconnect()
            u79[u66] = nil
            u37[asset] = nil
            a1(v3)
            return true
        end

        u79[u66] = true
        local v1 = asset.Destroying:Once(function() -- Line: 764 -- upvalues: u79 (upval), u66 (ref), a2_2 (val)
            u79[u66] = nil
            a2_2()
        end)
        if a2.delta and a2.delta < u28 then
            local v2 = u28
            local delta = a2.delta
            for i = v2, delta, 0.016666666666666666 do
                if u66(a2.delta) then
                    break
                end
            end
        end
    end)
end

Scheduler.add("Projectile_PreSim", RunService.PreSimulation, function(a1) -- Line: 783 -- upvalues: u79 (val)
    for i in u79 do
        i(a1)
    end
end)
Scheduler.add("Projectile_Heartbeat", RunService.Heartbeat, function(a1) -- Line: 789 -- upvalues: u77 (val)
    for i in u77 do
        i(a1)
    end
end)
Scheduler.add("Projectile_Conn", Heartbeat, function(a1) -- Line: 795 -- upvalues: u78 (val)
    for i in u78 do
        i(a1)
    end
end)
return v1