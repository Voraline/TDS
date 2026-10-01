-- Script path: ReplicatedStorage.Resources.Common.WeightTable
-- Decompile time: 1.29 ms

return {
    new = function(a1) -- Line: 21 -- types: a1: table?
        local u1 = {}
        u1._random = Random.new()
        u1._sum = 0
        u1._table = a1 or {}

        local function updateSum() -- Line: 28 -- upvalues: u1 (val)
            local v1
            u1._sum = 0
            for i, j in u1._table do
                v1 = u1
                v1._sum = v1._sum + j.Chance
            end
        end

        function u1.AddEntry(a1, a2) -- Line: 35 -- upvalues: u1 (val) -- types: a1: table, a2: table
            local v1
            table.insert(a1._table, a2)
            u1._sum = 0
            for i, j in u1._table do
                v1 = u1
                v1._sum = v1._sum + j.Chance
            end
        end

        function u1.RemoveEntry(a1, a2) -- Line: 40 -- upvalues: u1 (val) -- types: a1: table, a2: table
            local v1
            for k, v in pairs(a1._table) do
                if v == a2 then
                    table.remove(a1._table, k)
                    break
                end
            end
            u1._sum = 0
            for i, j in u1._table do
                v1 = u1
                v1._sum = v1._sum + j.Chance
            end
        end

        function u1.Select(a1) -- Line: 50
            local v1 = a1._random:NextInteger(1, a1._sum)
            local v2 = 0
            for i, j in a1._table do
                v2 = v2 + j.Chance
                if v1 <= v2 then
                    if j.Prerequisite and not j.Prerequisite() then
                        continue
                    end
                    return j
                end
            end
            return nil
        end

        u1._sum = 0
        for i, j in u1._table do
            u1._sum = u1._sum + j.Chance
        end
        return u1
    end,
}