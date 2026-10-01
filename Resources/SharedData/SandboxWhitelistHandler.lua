-- Script path: ReplicatedStorage.Resources.SharedData.SandboxWhitelistHandler
-- Decompile time: 0.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local FFlagAtoms = require(script.Parent.FFlagAtoms)
local table = require(ReplicatedStorage.Resources.Globals.table)
local u22 = {}
for i, j in ReplicatedStorage.Resources.SharedData.SandboxWhitelists:GetChildren() do
    u22[j.Name] = (require(j))
end
return function(a1) -- Line: 15 -- upvalues: FFlagAtoms (val), u22 (val), Charm (val), table (val) -- types: a1: string
    local u10 = FFlagAtoms(("sandbox.whitelist_%*"):format((string.lower(a1))), {})
    local u16 = nil
    local v1 = u22[a1]
    if v1 then
        u16 = v1()
    end
    return (Charm.computed(function() -- Line: 24 -- upvalues: table (upval), u10 (val), u16 (ref)
        return table.mergeList(u10(), if not u16 then nil else u16())
    end))
end