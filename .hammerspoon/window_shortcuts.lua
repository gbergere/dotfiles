local window = require("window")

----------------------------------------------
-- Set up
-----------------------------------------------

local hyper = {"ctrl", "cmd"}
local function withFocusedWindow(fn)
  local win = hs.window.focusedWindow()
  if not win then
    return
  end
  fn(win)
end

function isWideScreen(screen)
    local screenSize = screen:frame()
    return (screenSize.w/screenSize.h) > (20/9)
end
function isUltraWideScreen(screen)
    local screenSize = screen:frame()
    return (screenSize.w/screenSize.h) > (30/9)
end

-----------------------------------------------
-- hyper s to display info
-----------------------------------------------

hs.hotkey.showHotkeys(hyper, "s")

-----------------------------------------------
-- hyper f to center window
-----------------------------------------------

hs.hotkey.bind(hyper, "f", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.center44)
    elseif isWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.center60)
    else
      window:applyLayout(win, window.layout.maximized)
    end
  end)

end)

-----------------------------------------------
-- Cmd + Alt d for top left40 window
-----------------------------------------------

hs.hotkey.bind(hyper, "d", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.left28)
    else
      window:applyLayout(win, window.layout.left60)
    end
  end)
end)

-----------------------------------------------
-- Cmd + Alt g for top right60 window
-----------------------------------------------

hs.hotkey.bind(hyper, "g", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.right28)
    else
      window:applyLayout(win, window.layout.right40)
    end
  end)
end)

-----------------------------------------------
-- Cmd + Alt r for top topLeft40 window
-----------------------------------------------

hs.hotkey.bind(hyper, "r", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.topLeft28)
    else
      window:applyLayout(win, window.layout.topLeft40)
    end
  end)
end)

-----------------------------------------------
-- Cmd + Alt c for top bottomLeft40 window
-----------------------------------------------

hs.hotkey.bind(hyper, "c", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.bottomLeft28)
    else
      window:applyLayout(win, window.layout.bottomLeft40)
    end
  end)
end)

-----------------------------------------------
-- Cmd + Alt v for top bottomRightt60 window
-----------------------------------------------

hs.hotkey.bind(hyper, "v", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.bottomRight28)
    elseif isWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.bottomRight40)
    else
      window:applyLayout(win, window.layout.bottomRight60)
    end
  end)
end)

-----------------------------------------------
-- Cmd + Alt t for top topRight60 window
-----------------------------------------------

hs.hotkey.bind(hyper, "t", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.topRight28)
    elseif isWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.topRight40)
    else
      window:applyLayout(win, window.layout.topRight60)
    end
  end)
end)

-----------------------------------------------
-- hyper shift f to maximize the window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "f", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.center33)
    elseif isWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.center60)
    else
      window:applyLayout(win, window.layout.maximized)
    end
  end)
end)

-----------------------------------------------
-- hyper d for left one half window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "d", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.left33)
    else
      window:applyLayout(win, window.layout.left50)
    end
  end)
end)

-----------------------------------------------
-- Cmd + Alt + Shift g for right one half window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "g", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.right33)
    else
      window:applyLayout(win, window.layout.right50)
    end
  end)
end)

-----------------------------------------------
-- Cmd + Alt + Shift r for top left one quarter window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "r", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.topLeft22)
    else
      window:applyLayout(win, window.layout.topLeft)
    end
  end)
end)

-----------------------------------------------
-- Cmd + Alt + Shift t for top right one quarter window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "t", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.topRight22)
    else
      window:applyLayout(win, window.layout.topRight)
    end
  end)
end)

-----------------------------------------------
-- Cmd + Alt + Shift v for bottom right one quarter window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "v", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.bottomRight22)
    else
      window:applyLayout(win, window.layout.bottomRight)
    end
  end)
end)

-----------------------------------------------
-- Cmd + Alt + Shift c for bottom left one quarter window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "c", function()
  withFocusedWindow(function(win)
    if isUltraWideScreen(win:screen()) then
      window:applyLayout(win, window.layout.bottomLeft22)
    else
      window:applyLayout(win, window.layout.bottomLeft)
    end
  end)
end)

-----------------------------------------------
-- hyper = to resize horizontally window +10%
-----------------------------------------------

hs.hotkey.bind(hyper, "=", function()
  withFocusedWindow(function(win)
    window:moveAndResize(win, window.resize.bigger)
  end)
end)

-----------------------------------------------
-- hyper - to resize horizontally window -10%
-----------------------------------------------

hs.hotkey.bind(hyper, "-", function()
  withFocusedWindow(function(win)
    window:moveAndResize(win, window.resize.thiner)
  end)
end)

-----------------------------------------------
-- hyper shift = to resize vertically window +10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "=", function()
  withFocusedWindow(function(win)
    window:moveAndResize(win, window.resize.taller)
  end)
end)

-----------------------------------------------
-- hyper shift - to resize vertically window -10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "-", function()
  withFocusedWindow(function(win)
    window:moveAndResize(win, window.resize.shorter)
  end)
end)

-----------------------------------------------
-- hyper ] to move horizontally window +10%
-----------------------------------------------

hs.hotkey.bind(hyper, "]", function()
  withFocusedWindow(function(win)
    window:moveAndResize(win, window.move.right)
  end)
end)

-----------------------------------------------
-- hyper [ to move horizontally window -10%
-----------------------------------------------

hs.hotkey.bind(hyper, "[", function()
  withFocusedWindow(function(win)
    window:moveAndResize(win, window.move.left)
  end)
end)

-----------------------------------------------
-- hyper shift ] to move vertically window +10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "]", function()
  withFocusedWindow(function(win)
    window:moveAndResize(win, window.move.down)
  end)
end)

-----------------------------------------------
-- hyper shift [ to move vertically window -10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "[", function()
  withFocusedWindow(function(win)
    window:moveAndResize(win, window.move.up)
  end)
end)

-----------------------------------------------
-- hyper . to move on next screen
-----------------------------------------------

hs.hotkey.bind(hyper, ".", function()
  withFocusedWindow(function(win)
    local screen = win:screen()
    win:moveToScreen(screen:next())
  end)
end)

-----------------------------------------------
-- hyper , to move on previous screen
-----------------------------------------------

hs.hotkey.bind(hyper, ",", function()
  withFocusedWindow(function(win)
    local screen = win:screen()
    win:moveToScreen(screen:previous())
  end)
end)

-----------------------------------------------
-- Hyper hjkl to switch window focus
-----------------------------------------------

hs.hotkey.bind(hyper, 'k', function()
  withFocusedWindow(function(win)
    win:focusWindowNorth()
  end)
end)

hs.hotkey.bind(hyper, 'j', function()
  withFocusedWindow(function(win)
    win:focusWindowSouth()
  end)
end)

hs.hotkey.bind(hyper, 'l', function()
  withFocusedWindow(function(win)
    win:focusWindowEast()
  end)
end)

hs.hotkey.bind(hyper, 'h', function()
  withFocusedWindow(function(win)
    win:focusWindowWest()
  end)
end)
