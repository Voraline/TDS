-- Script path: ReplicatedStorage.Resources.Universal.GameData
-- Decompile time: 1.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AssetService = game:GetService("AssetService")
local GameType = require(ReplicatedStorage.Resources.Universal.GameType)
local Signal = require(ReplicatedStorage.Resources.Common.Standalone.Signal)
local u21 = {Places = {}}
u21.OnPlacesLoaded = Signal.new()
local u25 = {"tower defense simulator", "tds", "game", "lobby"}

local function isNameValid(a1) -- Line: 20 -- upvalues: u25 (val) -- types: a1: string
    local v1 = a1:lower()
    for i, j in u25 do
        if v1:find((j:lower())) then
            return true
        end
    end
    return false
end

function u21:Init() -- Line: 32
    pcall(function() -- Line: 33 -- upvalues: self (val)
        self:LoadPlaces()
    end)
    self.HasPlaces = true
    self.OnPlacesLoaded:Fire()
end

function u21:LoadPlaces() -- Line: 41 -- upvalues: GameType (val), AssetService (val), isNameValid (val)
    local PlaceId
    local PlaceId_2 = game.PlaceId
    local v1 = GameType:Get()
    local v2 = if v1 ~= "Lobby" then "Lobby" else "Game"
    self.Places[v1] = PlaceId_2
    local GamePlacesAsync = AssetService:GetGamePlacesAsync()
    while true do
        for i, j in GamePlacesAsync:GetCurrentPage() do
            PlaceId = j.PlaceId
            if isNameValid(j.Name) and PlaceId ~= PlaceId_2 then
                v3.Places[v2] = PlaceId
            end
        end
        if not GamePlacesAsync.IsFinished then
            break
        end
        GamePlacesAsync:AdvanceToNextPageAsync()
    end
end

function u21:GetPlaceId(a2) -- Line: 69
    if not self.HasPlaces then
        self.OnPlacesLoaded:Wait()
    end
    return self.Places[a2]
end

task.spawn(function() -- Line: 77 -- upvalues: u21 (val)
    u21:Init()
end)
return function(a1) -- Line: 82 -- upvalues: u21 (val)
    return u21:GetPlaceId(a1)
end