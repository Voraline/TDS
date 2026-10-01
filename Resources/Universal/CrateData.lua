-- Script path: ReplicatedStorage.Resources.Universal.CrateData
-- Decompile time: 0.55 ms

local Name, v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Resources.Universal.Asset)
local table = require(ReplicatedStorage.Resources.Globals.table)
local v2 = {}
for k, v in pairs((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Crates"):GetChildren()) do
    Name = v.Name
    v1 = Asset("NewCrates", Name)
    if v1 then
        v1.Backup = table.freeze(table.deepClone(v1))
        v1.Name = Name
        v2[Name] = v1
    end
end
return v2