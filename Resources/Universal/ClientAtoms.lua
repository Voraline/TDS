-- Script path: ReplicatedStorage.Resources.Universal.ClientAtoms
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local atom = Charm.atom
return {
    hideTowerRings = atom(false),
    cloneTowerAtom = atom({
        enabled = false,
        selected = "none",
        dontSelect = "none",
        isCloning = false,
        costPercent = 0,
    }),
    cloneTowerRangeRing = atom({
        position = Vector3.new(0, 0, 0),
        enabled = false,
        range = 0,
        towerBoundary = 0,
        color = Color3.fromRGB(255, 255, 255),
    }),
    pvpLeaderboardPlayers = atom({}),
    towerSelectorAtom = Charm.atom({enabled = false, tower = false}),
    elevatorAtom = Charm.atom(nil),
}