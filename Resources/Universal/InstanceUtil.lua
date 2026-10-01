-- Script path: ReplicatedStorage.Resources.Universal.InstanceUtil
-- Decompile time: 0.53 ms

return {
    clearDescendantsByType = function(a1, a2) -- Line: 1 -- types: a1: userdata, a2: table
        for i, j in a1:GetDescendants() do
            for k, n in a2 do
                if j:IsA(n) then
                    j:Destroy()
                    break
                end
            end
        end
    end,
    create = function(a1, a2) -- Line: 12 -- types: a1: string, a2: table?
        local v1 = Instance.new(a1)
        if a2 then
            for i, j in a2 do
                v1[i] = j
            end
        end
        return v1
    end,
}