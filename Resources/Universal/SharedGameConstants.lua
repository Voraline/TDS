-- Script path: ReplicatedStorage.Resources.Universal.SharedGameConstants
-- Decompile time: 0.34 ms

local v1 = {
    DEFAULT_BOUNDARY_SIZE = 1.5,
    BOUNDARY_HEIGHT = 1,
    GAME_ID = 1176784616,
    CRATES_PACKAGE_ID = 17659357912,
    TROOPS_PACKAGE_ID = 16077169215,
    UNITS_PACKAGE_ID = 16078207782,
    ENEMIES_PACKAGE_ID = 16078273431,
    LEGACY_ENEMIES_PACKAGE_ID = 16078275334,
    EASTER_UGC_ID = 16736381810,
    MATERIALS_PACKAGE_ID = 96963410453641,
}
v1.IS_PROD = game.GameId == v1.GAME_ID
v1.LEADERBOARD_TYPES = {"Triumphs", "Experience"}
v1.WM_MECHA_WHITELIST = {[230717039] = true, [315354328] = true, [7972514] = true}
v1.VALUE_OBJECT_OVERRIDES = {}
for i, j in v1 do
    if typeof(j) == "table" then
        table.freeze(j)
    end
end
table.freeze(v1)
return v1