-- Script path: ReplicatedStorage.Resources.Common.Standalone.Create
-- Decompile time: 0.28 ms

return function(a1, a2) -- Line: 1
    local v1 = Instance.new(a1)
    if a2 then
        for k, v in pairs(a2) do
            if type(k) ~= "string" then
                v.Parent = v1
            else
                v1[k] = v
            end
        end
    end
    return v1
end