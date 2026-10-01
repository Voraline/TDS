-- Script path: ReplicatedStorage.Resources.Universal.GameType
-- Decompile time: 0.41 ms

local v1 = {}
local Type = workspace:WaitForChild("Type")
local Value = Type.Value
Type.Changed:Connect(function() -- Line: 6 -- upvalues: Value (ref), Type (val)
    Value = Type.Value
end)

function v1.Get(a1) -- Line: 11 -- upvalues: Value (ref), Type (val)
    return Value or Type.Changed:Wait()
end

function v1.IsA(a1, a2) -- Line: 16
    return a1:Get() == a2
end

return v1