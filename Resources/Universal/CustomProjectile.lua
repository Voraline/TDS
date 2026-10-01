-- Script path: ReplicatedStorage.Resources.Universal.CustomProjectile
-- Decompile time: 1.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Resources.Universal.GameState)
local Promise = require(ReplicatedStorage.Packages.Promise)
local u19 = {}
local u20 = 0

local function stepProjectiles(a1) -- Line: 24
    -- upvalues: GameState (val), u19 (val), Promise (val), u20 (ref)
    local v1, v2
    local TimeScale = GameState.TimeScale
    if TimeScale <= 0 then
        return
    end
    local v3 = a1 * TimeScale
    local v4 = {}
    local v5 = {}
    local v6 = {}
    local v7 = nil
    local v8 = nil
    for i, j in u19, v7, v8 do
        v1 = j.elapsedTime + v3
        v2 = math.min(v1 / j.timeToDest)
        j.elapsedTime = v1
        j.alpha = v2
        local u62 = nil
        ;(Promise.new(function() -- Line: 43 -- upvalues: u62 (ref), j (val)
            u62 = j.onStep(j)
        end)):catch(warn)
        if u62 and u62 ~= j.lastCFrame then
            table.insert(v4, u62)
            table.insert(v5, j.part)
            j.lastCFrame = u62
            if v2 >= 1 then
                table.insert(v6, j)
            end
        end
    end
    workspace:BulkMoveTo(v5, v4)
    for k, n in v6 do
        u19[n.part] = nil
        u20 = u20 - 1
        if n.onFinish then
            (Promise.new(function() -- Line: 67 -- upvalues: n (val)
                n.onFinish(n)
            end)):catch(warn)
        end
    end
    if u20 <= 0 then end
end

return {
    ThrowProjectile = function(a1, a2, a3, a4, a5, a6, a7, a8) -- Line: 81
        -- upvalues: u19 (val), u20 (ref), RunService (val), stepProjectiles (val)
        local v1 = {
            elapsedTime = 0,
            start = a2,
            goal = a3,
            lastCFrame = CFrame.new(a2),
            timeToDest = a4,
            part = a5,
            onStep = a6,
            onFinish = a7,
        }
        if a8 then
            for i, j in a8 do
                v1[i] = j
            end
        end
        u19[a5] = v1
        u20 = u20 + 1
        if not stepProjConn then
            stepProjConn = RunService.PreSimulation:Connect(stepProjectiles)
        end
    end,
}