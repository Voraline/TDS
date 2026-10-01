-- Script path: ReplicatedStorage.Resources.SharedData.SandboxWhitelists.Enemies
-- Decompile time: 1.72 ms

local DisplayInfo, Waves_3, v1, v2
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Content = require(ReplicatedStorage.Resources.Universal.Content)
local FFlagAtoms = require(ReplicatedStorage.Resources.SharedData.FFlagAtoms)
local u61 = {}
for i, j in Content("Gamemodes"):GetChildren() do
    for k, n in j.Difficulties:GetChildren() do
        v1 = ("%*/%*"):format(j.Name, n.Name)
        DisplayInfo = n:FindFirstChild("DisplayInfo")
        if DisplayInfo then
            v2 = require(DisplayInfo)
            Waves_3 = (require(n.Waves)).Waves
            u61[v1] = {
                Name = v1,
                DisplayName = v2.DisplayName,
                Description = v2.Description,
                Difficulty = n.Name,
                Gamemode = j.Name,
                Waves = Waves_3,
            }
        end
    end
end
local u39 = FFlagAtoms("sandbox.whitelist_gamemodes", {})
local u44 = Charm.computed(function() -- Line: 40 -- upvalues: u39 (val), u61 (val)
    local v1, v2
    local v3 = u39()
    local v4 = {}
    local v5 = {}
    local v6 = nil
    local v7 = nil
    for i, j in u61, v6, v7 do
        if table.find(v3, i) then
            v2 = nil
            v1 = nil
            for k, n in j.Waves, v2, v1 do
                for m, i5 in n.WaveTimeline.Enemies do
                    v5[i5.Name] = true
                end
            end
        end
    end
    for i6 in v5 do
        table.insert(v4, i6)
    end
    return v4
end)
return function(a1) -- Line: 64 -- upvalues: u44 (val)
    return u44
end