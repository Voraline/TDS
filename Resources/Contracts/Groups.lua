-- Script path: ReplicatedStorage.Resources.Contracts.Groups
-- Decompile time: 0.14 ms

return {
    daily = {expireTime = 86400, claimToStart = true, maxContracts = 4, maxClaimableContracts = 2},
    weekly = {maxContracts = 2, maxClaimableContracts = 1, expireTime = 604800, claimToStart = true},
    christmas = {
        claimToStart = true,
        maxContracts = 8,
        maxClaimableContracts = 1,
        groupOnly = true,
        disabled = true,
    },
}