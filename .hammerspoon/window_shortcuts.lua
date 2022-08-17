local window = require("window")

----------------------------------------------
-- Set up
-----------------------------------------------

local hyper = {"ctrl", "cmd"}
function isWideScreen(screen)
    local screenSize = screen:frame()
    return (screenSize.w/screenSize.h) > (16/9)
end

-----------------------------------------------
-- hyper s to display info
-----------------------------------------------

hs.hotkey.showHotkeys(hyper, "s")

-----------------------------------------------
-- hyper f to center window
-----------------------------------------------

hs.hotkey.bind(hyper, "f", function()
  local win = hs.window.focusedWindow()
  if isWideScreen(win:screen()) then
    window:applyLayout(win, window.layout.center60)
  else
    window:applyLayout(win, window.layout.maximized)
  end

end)

-----------------------------------------------
-- Cmd + Alt d for top left40 window
-----------------------------------------------

hs.hotkey.bind(hyper, "d", function()
  local win = hs.window.focusedWindow()
  window:applyLayout(win, window.layout.left60)
end)

-----------------------------------------------
-- Cmd + Alt g for top right60 window
-----------------------------------------------

hs.hotkey.bind(hyper, "g", function()
  local win = hs.window.focusedWindow()
  window:applyLayout(win, window.layout.right40)
end)

-----------------------------------------------
-- Cmd + Alt r for top topLeft40 window
-----------------------------------------------

hs.hotkey.bind(hyper, "r", function()
  local win = hs.window.focusedWindow()
  if isWideScreen(win:screen()) then
    window:applyLayout(win, window.layout.wideTopLeft)
  else
    window:applyLayout(win, window.layout.topLeft40)
  end
end)

-----------------------------------------------
-- Cmd + Alt c for top bottomLeft40 window
-----------------------------------------------

hs.hotkey.bind(hyper, "c", function()
  local win = hs.window.focusedWindow()
  if isWideScreen(win:screen()) then
    window:applyLayout(win, window.layout.wideBottomLeft)
  else
    window:applyLayout(win, window.layout.bottomLeft40)
  end
end)

-----------------------------------------------
-- Cmd + Alt v for top bottomRightt60 window
-----------------------------------------------

hs.hotkey.bind(hyper, "v", function()
  local win = hs.window.focusedWindow()
  if isWideScreen(win:screen()) then
    window:applyLayout(win, window.layout.wideBottomRight)
  else
    window:applyLayout(win, window.layout.bottomRight60)
  end
end)

-----------------------------------------------
-- Cmd + Alt t for top topRight60 window
-----------------------------------------------

hs.hotkey.bind(hyper, "t", function()
  local win = hs.window.focusedWindow()
  if isWideScreen(win:screen()) then
    window:applyLayout(win, window.layout.wideTopRight)
  else
    window:applyLayout(win, window.layout.topRight60)
  end
end)

-----------------------------------------------
-- hyper shift f to maximize the window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "f", function()
  local win = hs.window.focusedWindow()
  if isWideScreen(win:screen()) then
    window:applyLayout(win, window.layout.wideMiddle)
  else
    window:applyLayout(win, window.layout.maximized)
  end
end)

-----------------------------------------------
-- hyper d for left one half window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "d", function()
  local win = hs.window.focusedWindow()
  if isWideScreen(win:screen()) then
    window:applyLayout(win, window.layout.wideLeft)
  else
    window:applyLayout(win, window.layout.left50)
  end
end)

-----------------------------------------------
-- Cmd + Alt + Shift g for right one half window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "g", function()
  local win = hs.window.focusedWindow()
  if isWideScreen(win:screen()) then
    window:applyLayout(win, window.layout.wideRight)
  else
    window:applyLayout(win, window.layout.right50)
  end
end)

-----------------------------------------------
-- Cmd + Alt + Shift r for top left one quarter window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "r", function()
  window:applyLayout(hs.window.focusedWindow(), window.layout.topLeft)
end)

-----------------------------------------------
-- Cmd + Alt + Shift t for top right one quarter window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "t", function()
  window:applyLayout(hs.window.focusedWindow(), window.layout.topRight)
end)

-----------------------------------------------
-- Cmd + Alt + Shift v for bottom right one quarter window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "v", function()
  window:applyLayout(hs.window.focusedWindow(), window.layout.bottomRight)
end)

-----------------------------------------------
-- Cmd + Alt + Shift c for bottom left one quarter window
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "c", function()
  window:applyLayout(hs.window.focusedWindow(), window.layout.bottomLeft)
end)

-----------------------------------------------
-- hyper = to resize horizontally window +10%
-----------------------------------------------

hs.hotkey.bind(hyper, "=", function()
  window:moveAndResize(hs.window.focusedWindow(), window.resize.bigger)
end)

-----------------------------------------------
-- hyper - to resize horizontally window -10%
-----------------------------------------------

hs.hotkey.bind(hyper, "-", function()
  window:moveAndResize(hs.window.focusedWindow(), window.resize.thiner)
end)

-----------------------------------------------
-- hyper shift = to resize vertically window +10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "=", function()
  window:moveAndResize(hs.window.focusedWindow(), window.resize.taller)
end)

-----------------------------------------------
-- hyper shift - to resize vertically window -10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "-", function()
  window:moveAndResize(hs.window.focusedWindow(), window.resize.shorter)
end)

-----------------------------------------------
-- hyper ] to move horizontally window +10%
-----------------------------------------------

hs.hotkey.bind(hyper, "]", function()
  window:moveAndResize(hs.window.focusedWindow(), window.move.right)
end)

-----------------------------------------------
-- hyper [ to move horizontally window -10%
-----------------------------------------------

hs.hotkey.bind(hyper, "[", function()
  window:moveAndResize(hs.window.focusedWindow(), window.move.left)
end)

-----------------------------------------------
-- hyper shift ] to move vertically window +10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "]", function()
  window:moveAndResize(hs.window.focusedWindow(), window.move.down)
end)

-----------------------------------------------
-- hyper shift [ to move vertically window -10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "[", function()
  window:moveAndResize(hs.window.focusedWindow(), window.move.up)
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
