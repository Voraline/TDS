-- Script path: ReplicatedStorage.Resources.Universal.HumanoidUtil
-- Decompile time: 0.20 ms

return {
    createBlankHumanoid = function() -- Line: 1
        local Humanoid = Instance.new("Humanoid")
        Humanoid.Name = "Humanoid"
        Humanoid.AutoJumpEnabled = false
        Humanoid.AutoRotate = false
        Humanoid.AutomaticScalingEnabled = false
        Humanoid.BreakJointsOnDeath = false
        Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        Humanoid.EvaluateStateMachine = false
        Humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
        Humanoid.NameOcclusion = Enum.NameOcclusion.NoOcclusion
        Humanoid.RequiresNeck = false
        Humanoid.UseJumpPower = false
        Instance.new("Animator").Parent = Humanoid
        return Humanoid
    end,
}