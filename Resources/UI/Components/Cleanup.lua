-- Script path: ReplicatedStorage.Resources.UI.Components.Cleanup
-- Decompile time: 0.28 ms

local Fusion = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Fusion")
local onDestroy = require(Fusion.Instances.onDestroy)
local semiWeakRef = require(Fusion.Instances.semiWeakRef)
return function(a1, a2) -- Line: 9 -- upvalues: semiWeakRef (val), onDestroy (val) -- types: a1: userdata, a2: function
    onDestroy(semiWeakRef(a1), a2)
end