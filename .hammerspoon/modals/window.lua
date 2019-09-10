----------------------------------------------
-- Modal to manage windows
--
-- Inspired from https://github.com/dbmrq/dotfiles/blob/master/home/.hammerspoon/vim.lua
----------------------------------------------

-- Imports
local window = require("../window")
local status = require("../status_display")

-- Variables
local smallScreenWidth = 1200

----------------------------------------------
-- Set up modal
-----------------------------------------------

local window_manager = hs.hotkey.modal.new()
window_manager_modal = hs.hotkey.bind({"alt"}, "w", function()
    window_manager:enter()
    status:show("WINDOW MANAGER")
end)

window_manager:bind({"alt"}, 'w', function()
    window_manager:exit()
    status:clear()
end)

-- Disable modal on Terminal
hs.window.filter.new('Terminal')
    :subscribe(hs.window.filter.windowFocused, function()
        window_manager:exit()
        window_manager_modal:disable()
    end)
    :subscribe(hs.window.filter.windowUnfocused, function()
        window_manager_modal:enable()
    end)

-----------------------------------------------
-- f to center window
-----------------------------------------------

window_manager:bind({}, "f", function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    local max = screen:frame()

    if (max.h > smallScreenWidth) then
        local width = .60
        local height = .85

        window:applyLayout(win, {(1 - width) / 2, (1 - height) / 2, width, height})
    else
        window:applyLayout(win, window.layout.maximized)
    end

end)

-----------------------------------------------
-- d for top left40 window
-----------------------------------------------

window_manager:bind({}, "d", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.left40)
end)

-----------------------------------------------
-- g for top right60 window
-----------------------------------------------

window_manager:bind({}, "g", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.right60)
end)

-----------------------------------------------
-- e for top up50 window
-----------------------------------------------

window_manager:bind({}, "e", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.up50)
end)

-----------------------------------------------
-- x for top bottom50 window
-----------------------------------------------

window_manager:bind({}, "x", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.bottom50)
end)

-----------------------------------------------
-- r for top topLeft40 window
-----------------------------------------------

window_manager:bind({}, "r", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.topLeft40)
end)

-----------------------------------------------
-- c for top bottomLeft40 window
-----------------------------------------------

window_manager:bind({}, "c", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.bottomLeft40)
end)

-----------------------------------------------
-- v for top bottomRightt60 window
-----------------------------------------------

window_manager:bind({}, "v", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.bottomRight60)
end)

-----------------------------------------------
-- t for top topRight60 window
-----------------------------------------------

window_manager:bind({}, "t", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.topRight60)
end)

-----------------------------------------------
-- f to maximize the window
-----------------------------------------------

window_manager:bind({"shift"}, "f", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.maximized)
end)

-----------------------------------------------
-- d for left one half window
-----------------------------------------------

window_manager:bind({"shift"}, "d", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.left50)
end)

-----------------------------------------------
-- + Shift g for right one half window
-----------------------------------------------

window_manager:bind({"shift"}, "g", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.right50)
end)

-----------------------------------------------
-- + Shift r for top left one quarter window
-----------------------------------------------

window_manager:bind({"shift"}, "r", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.topLeft)
end)

-----------------------------------------------
-- + Shift t for top right one quarter window
-----------------------------------------------

window_manager:bind({"shift"}, "t", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.topRight)
end)

-----------------------------------------------
-- + Shift v for bottom right one quarter window
-----------------------------------------------

window_manager:bind({"shift"}, "v", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.bottomRight)
end)

-----------------------------------------------
-- + Shift c for bottom left one quarter window
-----------------------------------------------

window_manager:bind({"shift"}, "c", function()
    window:applyLayout(hs.window.focusedWindow(), window.layout.bottomLeft)
end)

-----------------------------------------------
-- = to resize horizontally window +10%
-----------------------------------------------

window_manager:bind({}, "=", function()
    window:moveAndResize(hs.window.focusedWindow(), window.resize.bigger)
end)

-----------------------------------------------
-- - to resize horizontally window -10%
-----------------------------------------------

window_manager:bind({}, "-", function()
    window:moveAndResize(hs.window.focusedWindow(), window.resize.thiner)
end)

-----------------------------------------------
-- = to resize vertically window +10%
-----------------------------------------------

window_manager:bind({"shift"}, "=", function()
    window:moveAndResize(hs.window.focusedWindow(), window.resize.taller)
end)

-----------------------------------------------
-- - to resize vertically window -10%
-----------------------------------------------

window_manager:bind({"shift"}, "-", function()
    window:moveAndResize(hs.window.focusedWindow(), window.resize.shorter)
end)

-----------------------------------------------
-- ] to move horizontally window +10%
-----------------------------------------------

window_manager:bind({}, "]", function()
    window:moveAndResize(hs.window.focusedWindow(), window.move.right)
end)

-----------------------------------------------
-- [ to move horizontally window -10%
-----------------------------------------------

window_manager:bind({}, "[", function()
    window:moveAndResize(hs.window.focusedWindow(), window.move.left)
end)

-----------------------------------------------
-- ] to move vertically window +10%
-----------------------------------------------

window_manager:bind({"shift"}, "]", function()
    window:moveAndResize(hs.window.focusedWindow(), window.move.down)
end)

-----------------------------------------------
-- [ to move vertically window -10%
-----------------------------------------------

window_manager:bind({"shift"}, "[", function()
    window:moveAndResize(hs.window.focusedWindow(), window.move.up)
end)

-----------------------------------------------
-- . to move on next screen
-----------------------------------------------

window_manager:bind({}, ".", function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    win:moveToScreen(screen:next())
end)

-----------------------------------------------
-- , to move on previous screen
-----------------------------------------------

window_manager:bind({}, ",", function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    win:moveToScreen(screen:previous())
end)

-----------------------------------------------
-- Hyper hjkl to switch window focus
-----------------------------------------------

window_manager:bind({}, 'k', function()
    hs.window.focusedWindow():focusWindowNorth()
end)

window_manager:bind({}, 'j', function()
    hs.window.focusedWindow():focusWindowSouth()
end)

window_manager:bind({}, 'l', function()
    hs.window.focusedWindow():focusWindowEast()
end)

window_manager:bind({}, 'h', function()
    hs.window.focusedWindow():focusWindowWest()
end)
