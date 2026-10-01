-- Script path: ReplicatedStorage.Resources.Universal.SharedAtom
-- Decompile time: 0.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local u17 = RunService:IsServer()
local Controllers = u17 and ServerStorage.Server.Modules.Universal.Controllers
local Controllers_2 = not u17 and ReplicatedStorage.Client.Modules.Universal.Compatibility.Controllers
local Charm = require(ReplicatedStorage.Packages.Charm)
local SharedAtomsManager = if not Controllers then nil else require(Controllers.SharedAtomsManager)
local SharedAtomsController = if not Controllers_2 then nil else require(Controllers_2.SharedAtomsController)
return function(a1, a2) -- Line: 19
    -- upvalues: u17 (val), Charm (val), SharedAtomsManager (val), SharedAtomsController (val)
    if not u17 then
        return SharedAtomsController.getSharedAtom(a1, a2)
    end
    local v1 = Charm.atom(a2)
    SharedAtomsManager.shareAtomWithId(a1, v1)
    return v1
end