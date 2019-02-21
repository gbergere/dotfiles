w = require("window")
s = require("hs._asm.undocumented.spaces")
----------------------------------------------
-- Set up
-----------------------------------------------

local hyper = {"alt", "cmd"}
local margin = 20

local smallScreenWidth = 1200

-----------------------------------------------
-- hyper b to center window
-----------------------------------------------

local center = function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = 1400
    f.h = max.h * (max.h > smallScreenWidth and 0.75 or 0.9)
    win:setFrame(f)
    win:centerOnScreen(screen)
end
hs.hotkey.bind(hyper, "b", center)
hs.hotkey.bind(hyper, "up", center)

-----------------------------------------------
-- hyper d for left one half window
-----------------------------------------------

local left50 = function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    local width = max.h > smallScreenWidth and 0.5 or 0.65
    f.x = max.x + margin
    f.y = max.y + margin
    f.w = max.w * width - margin * 1.5
    f.h = max.h - margin * 2
    win:setFrame(f)
end
hs.hotkey.bind(hyper, "d", left50)
hs.hotkey.bind(hyper, "left", left50)

-----------------------------------------------
-- hyper g for right one half window
-----------------------------------------------

local right50 = function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    local width = max.h > smallScreenWidth and 0.5 or 0.35
    f.x = max.x + (max.w + margin) * (1 - width)
    f.y = max.y + margin
    f.w = max.w * width - margin * 1.5
    f.h = max.h - margin * 2
    win:setFrame(f)
end
hs.hotkey.bind(hyper, "g", right50)
hs.hotkey.bind(hyper, "right", right50)

-----------------------------------------------
-- hyper space to maximize the window
-----------------------------------------------

hs.hotkey.bind(hyper, "space", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + margin
    f.y = max.y + margin
    f.w = max.w - margin * 2
    f.h = max.h - margin * 2
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper f to toggle fullscreen
-----------------------------------------------

hs.hotkey.bind(hyper, "f", function()
    hs.window.focusedWindow():toggleFullScreen()
end)

-----------------------------------------------
-- hyper r for top left one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "r", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + margin
    f.y = max.y + margin
    f.w = max.w / 2 - margin * 1.5
    f.h = max.h / 2 - margin * 1.5
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper t for top right one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "t", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w + margin) / 2
    f.y = max.y + margin
    f.w = max.w / 2 - margin * 1.5
    f.h = max.h / 2 - margin * 1.5
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper v for bottom right one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "v", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w + margin) / 2
    f.y = max.y + (max.h + margin) / 2
    f.w = max.w / 2 - margin * 1.5
    f.h = max.h / 2 - margin * 1.5
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper c for bottom left one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "c", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + margin
    f.y = max.y + (max.h + margin) / 2
    f.w = max.w / 2 - margin * 1.5
    f.h = max.h / 2 - margin * 1.5
    win:setFrame(f)
end)

-----------------------------------------------
--- hyper 4 for top right left-half quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "4", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w + margin) / 2
    f.y = max.y + margin
    f.w = max.w / 4 - margin
    f.h = max.h / 2 - margin * 1.5
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper 5 for top right right-half quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "5", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 4 * 3) + margin / 2
    f.y = max.y + margin
    f.w = max.w / 4 - margin * 1.5
    f.h = max.h / 2 - margin * 1.5
    win:setFrame(f)
end)

-----------------------------------------------
-- hyper = to resize horizontally window +10%
-----------------------------------------------

hs.hotkey.bind(hyper, "=", function()
    w.resizeWindow(hs.window.focusedWindow(), w.resize.bigger)
end)

-----------------------------------------------
-- hyper - to resize horizontally window -10%
-----------------------------------------------

hs.hotkey.bind(hyper, "-", function()
    w.resizeWindow(hs.window.focusedWindow(), w.resize.thiner)
end)

-----------------------------------------------
-- hyper shift = to resize vertically window +10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "=", function()
    w.resizeWindow(hs.window.focusedWindow(), w.resize.taller)
end)

-----------------------------------------------
-- hyper shift - to resize vertically window -10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "-", function()
    w.resizeWindow(hs.window.focusedWindow(), w.resize.shorter)
end)

-----------------------------------------------
-- hyper ] to move horizontally window +10%
-----------------------------------------------

hs.hotkey.bind(hyper, "]", function()
    w.moveWindow(hs.window.focusedWindow(), w.move.right)
end)

-----------------------------------------------
-- hyper [ to move horizontally window -10%
-----------------------------------------------

hs.hotkey.bind(hyper, "[", function()
    w.moveWindow(hs.window.focusedWindow(), w.move.left)
end)

-----------------------------------------------
-- hyper shift ] to move vertically window +10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "]", function()
    w.moveWindow(hs.window.focusedWindow(), w.move.down)
end)

-----------------------------------------------
-- hyper shift [ to move vertically window -10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "[", function()
    w.moveWindow(hs.window.focusedWindow(), w.move.up)
end)

-----------------------------------------------
-- hyper . to move on next screen
-----------------------------------------------

hs.hotkey.bind(hyper, ".", function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    win:moveToScreen(screen:next())
end)

-----------------------------------------------
-- hyper , to move on previous screen
-----------------------------------------------

hs.hotkey.bind(hyper, ",", function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    win:moveToScreen(screen:previous())
end)

-----------------------------------------------
-- hyper ctrl . to move window on next space
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "ctrl"), ".", function()
    local win = hs.window.focusedWindow()
    local space = s.activeSpace()

    if s.spaceType(space) ~= s.types.user then
        return
    end

    local screen = s.spaceScreenUUID(space)
    local spaces = s.spacesByScreenUUID()[screen]

    -- Need to find a way how to use table.getn() @TODO
    local spaces_count = 0
    for k, v in pairs(spaces) do
        spaces_count = spaces_count + 1
    end

    for k, v in pairs(spaces) do
        if k < spaces_count and v == space then
            win:spacesMoveTo(spaces[k + 1])
            s.changeToSpace(spaces[k + 1])
        end
    end

    win:focus()
end)

-----------------------------------------------
-- hyper ctrl , to move window on previous space
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "ctrl"), ",", function()
    local win = hs.window.focusedWindow()
    local space = s.activeSpace()

    if s.spaceType(space) ~= s.types.user then
        return
    end

    local screen = s.spaceScreenUUID(space)
    local spaces = s.spacesByScreenUUID()[screen]

    for k, v in pairs(spaces) do
        if k > 1 and v == space then
            win:spacesMoveTo(spaces[k - 1])
            s.changeToSpace(spaces[k - 1])
        end
    end

    win:focus()
end)

-----------------------------------------------
-- ctrl . to move on next space
-----------------------------------------------

hs.hotkey.bind({"ctrl"}, ".", function()
    local space = s.activeSpace()
    local screen = s.spaceScreenUUID(space)
    local spaces = s.spacesByScreenUUID()[screen]

    -- Need to find a way how to use table.getn() @TODO
    local spaces_count = 0
    for k, v in pairs(spaces) do
        spaces_count = spaces_count + 1
    end

    for k, v in pairs(spaces) do
        if k < spaces_count and v == space then
            s.changeToSpace(spaces[k + 1])
        end
    end
end)

-----------------------------------------------
-- ctrl , to move on previous space
-----------------------------------------------

hs.hotkey.bind({"ctrl"}, ",", function()
    local space = s.activeSpace()
    local screen = s.spaceScreenUUID(space)
    local spaces = s.spacesByScreenUUID()[screen]

    for k, v in pairs(spaces) do
        if k > 1 and v == space then
            s.changeToSpace(spaces[k - 1])
        end
    end
end)

-----------------------------------------------
-- Hyper hjkl to switch window focus
-----------------------------------------------

hs.hotkey.bind(hyper, 'k', function()
    hs.window.focusedWindow():focusWindowNorth()
end)

hs.hotkey.bind(hyper, 'j', function()
    hs.window.focusedWindow():focusWindowSouth()
end)

hs.hotkey.bind(hyper, 'l', function()
    hs.window.focusedWindow():focusWindowEast()
end)

hs.hotkey.bind(hyper, 'h', function()
    hs.window.focusedWindow():focusWindowWest()
end)
