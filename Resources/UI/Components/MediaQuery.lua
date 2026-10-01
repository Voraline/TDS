-- Script path: ReplicatedStorage.Resources.UI.Components.MediaQuery
-- Decompile time: 1.91 ms

local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local Fusion = require(ReplicatedStorage.Resources.UI.Fusion)
local Observer = Fusion.Observer
local Value = Fusion.Value
local CurrentCamera = Workspace.CurrentCamera
local ViewportSize = CurrentCamera.ViewportSize
local u34 = Value(Vector2.zero)
local u38 = Value(UserInputService.TouchEnabled)

local function connectCamera() -- Line: 19
    -- upvalues: CurrentCamera (ref), Workspace (val), u34 (ref), ViewportSize (val)
    CurrentCamera = Workspace.CurrentCamera
    ;(CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(function() -- Line: 21 -- upvalues: u34 (upval), CurrentCamera (upval)
        u34:set((Vector2.new(CurrentCamera.ViewportSize.X, CurrentCamera.ViewportSize.Y)))
    end)
    u34:set((Vector2.new(ViewportSize.X, ViewportSize.Y)))
end

;(UserInputService:GetPropertyChangedSignal("TouchEnabled")):Connect(function() -- Line: 28 -- upvalues: u38 (ref), UserInputService (val)
    u38:set(UserInputService.TouchEnabled)
end)
;(workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(connectCamera)
connectCamera()

local function getPlatform(a1) -- Line: 36 -- upvalues: UserInputService (val), GuiService (val)
    local v1 = "Computer"
    if UserInputService.TouchEnabled then
        if 600 < a1.Y then
            return "Tablet"
        end
        return "Phone"
    end
    if GuiService:IsTenFootInterface() then
        v1 = "Console"
    end
    return v1
end

return function(a1) -- Line: 57 -- upvalues: u34 (ref), u38 (ref), UserInputService (val), GuiService (val), Observer (val)
    local function v1() -- Line: 58
        -- upvalues: u34 (upval), u38 (upval), a1 (val), UserInputService (upval), GuiService (upval)
        local v1 = u34:get(false)
        local v2 = u38:get(false)
        local v3 = "Computer"
        if UserInputService.TouchEnabled then
            v3 = if not (600 < v1.Y) then "Phone" else "Tablet"
        elseif GuiService:IsTenFootInterface() then
            v3 = "Console"
        end
        a1(v1, v3, v2)
    end

    local u8 = Observer(u34):onChange(v1)
    local u15 = Observer(u38):onChange(v1)
    local v2 = u34:get(false)
    local v3 = u38:get(false)
    local v4 = "Computer"
    if UserInputService.TouchEnabled then
        v4 = if not (600 < v2.Y) then "Phone" else "Tablet"
    elseif GuiService:IsTenFootInterface() then
        v4 = "Console"
    end
    a1(v2, v4, v3)
    return function() -- Line: 70 -- upvalues: u8 (val), u15 (val)
        u8()
        u15()
    end
end