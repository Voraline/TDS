-- Script path: ReplicatedStorage.Resources.Universal.KeyCode
-- Decompile time: 0.75 ms

local UserInputService = game:GetService("UserInputService")
local u5 = {
    [Enum.KeyCode.LeftAlt] = "LAlt",
    [Enum.KeyCode.RightAlt] = "RAlt",
    [Enum.KeyCode.LeftControl] = "LCtrl",
    [Enum.KeyCode.RightControl] = "RCtrl",
    [Enum.KeyCode.LeftShift] = "LShift",
    [Enum.KeyCode.RightShift] = "RShift",
    [Enum.KeyCode.LeftSuper] = "LWin",
    [Enum.KeyCode.RightSuper] = "RWin",
    [Enum.KeyCode.PageUp] = "PgUp",
    [Enum.KeyCode.PageDown] = "PgDn",
    [Enum.KeyCode.ScrollLock] = "ScrLk",
    [Enum.KeyCode.NumLock] = "NumLk",
    [Enum.KeyCode.Return] = "⏎",
    [Enum.KeyCode.Backspace] = "⌫",
    [Enum.KeyCode.Space] = "Space",
    [Enum.KeyCode.KeypadDivide] = "NUM /",
    [Enum.KeyCode.KeypadMultiply] = "NUM *",
    [Enum.KeyCode.KeypadMinus] = "NUM -",
    [Enum.KeyCode.KeypadPlus] = "NUM +",
    [Enum.KeyCode.KeypadPeriod] = "NUM .",
    [Enum.KeyCode.KeypadEquals] = "NUM =",
    [Enum.KeyCode.KeypadZero] = "NUM 0",
    [Enum.KeyCode.KeypadOne] = "NUM 1",
    [Enum.KeyCode.KeypadTwo] = "NUM 2",
    [Enum.KeyCode.KeypadThree] = "NUM 3",
    [Enum.KeyCode.KeypadFour] = "NUM 4",
    [Enum.KeyCode.KeypadFive] = "NUM 5",
    [Enum.KeyCode.KeypadSix] = "NUM 6",
    [Enum.KeyCode.KeypadSeven] = "NUM 7",
    [Enum.KeyCode.KeypadEight] = "NUM 8",
    [Enum.KeyCode.KeypadNine] = "NUM 9",
    [Enum.KeyCode.KeypadEnter] = "NUM ⏎",
    [Enum.KeyCode.One] = "1",
    [Enum.KeyCode.Two] = "2",
    [Enum.KeyCode.Three] = "3",
    [Enum.KeyCode.Four] = "4",
    [Enum.KeyCode.Five] = "5",
    [Enum.KeyCode.Six] = "6",
    [Enum.KeyCode.Seven] = "7",
    [Enum.KeyCode.Eight] = "8",
    [Enum.KeyCode.Nine] = "9",
    [Enum.KeyCode.Zero] = "0",
}
return function(a1) -- Line: 48 -- upvalues: u5 (val), UserInputService (val)
    local Name
    if typeof(a1) == "string" then
        a1 = Enum.KeyCode[a1]
    end
    if u5[a1] then
        return u5[a1]
    end
    local StringForKeyCode = UserInputService:GetStringForKeyCode(a1)
    if (if StringForKeyCode == "" then a1.Name else StringForKeyCode) == "Unknown" then
        return "???"
    end
    return Name
end