-- Script path: ReplicatedStorage.Resources.Root
-- Decompile time: 2.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local v1 = {"UI", "Packages", "TestEZ"}
local u21 = table.create(#v1)
for i, v in ipairs(v1) do
    table.insert(u21, (string.split(v, ".")))
end
local u178 = {}

local function resultHandler(a1, a2, a3, ...) -- Line: 20 -- types: a1: thread, a2: string, a3: boolean
    if not a3 then
        error(debug.traceback(a1, (...)), 2)
    end
    return ...
end

local function noYield(a1, a2, ...) -- Line: 29 -- upvalues: resultHandler (val) -- types: a1: string, a2: function
    local u2 = {}
    u2[1] = ...
    local u4 = nil
    local u5 = false
    local v1 = coroutine.create(function() -- Line: 35 -- upvalues: u4 (ref), a2 (val), u2 (val), u5 (ref)
        u4 = a2(unpack(u2))
        u5 = true
        return u4
    end)
    resultHandler(v1, a1, coroutine.resume(v1, ...))
    while not u5 do
        if u4 then
            break
        end
        task.wait()
    end
    return u4
end

local function addIfAllowed(a1) -- Line: 51 -- upvalues: u21 (val), u178 (val) -- types: a1: userdata
    local v1
    local v2 = a1
    for i, v in ipairs(u21) do
        v1 = true
        for i2, i3 in ipairs(v) do
            if not v2:FindFirstAncestor(i3) then
                v1 = false
                break
            end
        end
        if v1 then
            return
        end
    end
    u178[v2.Name] = v2
end

local function addPackages(a1) -- Line: 68 -- upvalues: u178 (val) -- types: a1: userdata
    for i, v in ipairs(a1:GetChildren()) do
        if v:IsA("ModuleScript") then
            u178[v.Name] = v
        end
    end
end

local function debugModules() -- Line: 76 -- upvalues: RunService (val), u178 (val)
    local v1 = string.format("[%s] {\n", if not RunService:IsServer() then "CLIENT" else "SERVER")
    for i, j in u178 do
        v1 = v1 .. string.format("\t[%q] = %q,\n", i, j:GetFullName())
    end
    v1 = v1 .. "}"
    print(v1)
end

for k, i2 in pairs(ReplicatedStorage.Resources:GetDescendants()) do
    if i2:IsA("ModuleScript") then
        addIfAllowed(i2)
    end
end
addPackages(ReplicatedStorage.Packages)
if not RunService:IsServer() then
    for k2, j in pairs(ReplicatedStorage.Client:GetChildren()) do
        if j.Name ~= "Interfaces" then
            for k3, k4 in pairs(j:GetDescendants()) do
                if k4:IsA("ModuleScript") then
                    addIfAllowed(k4)
                end
            end
        end
    end
else
    addPackages(ServerStorage.Packages)
    for k5, n in pairs(ServerStorage.Server:GetDescendants()) do
        if n:IsA("ModuleScript") then
            addIfAllowed(n)
        end
    end
    addPackages(ServerStorage.Packages)
end
u178.Effects = (((((ReplicatedStorage:WaitForChild("Client")):WaitForChild("Modules")):WaitForChild("Game")):WaitForChild("Compatibility")):WaitForChild("Controllers")):WaitForChild("Effects")
if not RunService:IsServer() then end
return function(a1) -- Line: 132 -- upvalues: u178 (val), noYield (val)
    if typeof(a1) ~= "string" then
        return (noYield(a1:GetFullName(), require, a1))
    end
    if not u178[a1] then
        error((("Module '%*' does not exist"):format(a1)))
    end
    return (noYield(a1, require, u178[a1]))
end