local window = require("window")

----------------------------------------------
-- Set up
-----------------------------------------------

local hyper = {"alt", "cmd"}
local smallScreenWidth = 1200

-----------------------------------------------
-- hyper s to display info
-----------------------------------------------

hs.hotkey.showHotkeys(hyper, "s")

-----------------------------------------------
-- hyper f to maximize the window
-----------------------------------------------

hs.hotkey.bind(hyper, "f", function()
  window.applyLayout(hs.window.focusedWindow(), window.layout.maximized)
end)

-----------------------------------------------
-- hyper space to center window
-----------------------------------------------

hs.hotkey.bind(hyper, "b", function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local max = screen:frame()

  local width = max.h > smallScreenWidth and 0.60 or 0.95
  local height = max.h > smallScreenWidth and 0.85 or 0.95

  window.applyLayout(win, {.175,.075, width, height})
  win:centerOnScreen(screen)
end)

-----------------------------------------------
-- hyper d for left one half window
-----------------------------------------------

hs.hotkey.bind(hyper, "d", function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local max = screen:frame()

  local layout = max.h > smallScreenWidth and window.layout.left50 or window.layout.left75
  window.applyLayout(hs.window.focusedWindow(), layout)
end)

-----------------------------------------------
-- hyper g for right one half window
-----------------------------------------------

hs.hotkey.bind(hyper, "g", function()
  local win = hs.window.focusedWindow()
  local screen = win:screen()
  local max = screen:frame()

  local layout = max.h > smallScreenWidth and window.layout.right50 or window.layout.right25
  window.applyLayout(hs.window.focusedWindow(), layout)
end)

-----------------------------------------------
-- hyper r for top left one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "r", function()
  window.applyLayout(hs.window.focusedWindow(), window.layout.topLeft)
end)

-----------------------------------------------
-- hyper t for top right one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "t", function()
  window.applyLayout(hs.window.focusedWindow(), window.layout.topRight)
end)

-----------------------------------------------
-- hyper v for bottom right one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "v", function()
  window.applyLayout(hs.window.focusedWindow(), window.layout.bottomRight)
end)

-----------------------------------------------
-- hyper c for bottom left one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "c", function()
  window.applyLayout(hs.window.focusedWindow(), window.layout.bottomLeft)
end)

-----------------------------------------------
--- hyper 4 for top right left-half quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "4", function()
  window.applyLayout(hs.window.focusedWindow(), {.5, 0, .25, .5})
end)

-----------------------------------------------
-- hyper 5 for top right right-half quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "5", function()
  window.applyLayout(hs.window.focusedWindow(), {.75, 0, .25, .5})
end)

-----------------------------------------------
-- hyper = to resize horizontally window +10%
-----------------------------------------------

hs.hotkey.bind(hyper, "=", function()
  window.moveAndResize(hs.window.focusedWindow(), window.resize.bigger)
end)

-----------------------------------------------
-- hyper - to resize horizontally window -10%
-----------------------------------------------

hs.hotkey.bind(hyper, "-", function()
  window.moveAndResize(hs.window.focusedWindow(), window.resize.thiner)
end)

-----------------------------------------------
-- hyper shift = to resize vertically window +10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "=", function()
  window.moveAndResize(hs.window.focusedWindow(), window.resize.taller)
end)

-----------------------------------------------
-- hyper shift - to resize vertically window -10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "-", function()
  window.moveAndResize(hs.window.focusedWindow(), window.resize.shorter)
end)

-----------------------------------------------
-- hyper ] to move horizontally window +10%
-----------------------------------------------

hs.hotkey.bind(hyper, "]", function()
  window.moveAndResize(hs.window.focusedWindow(), window.move.right)
end)

-----------------------------------------------
-- hyper [ to move horizontally window -10%
-----------------------------------------------

hs.hotkey.bind(hyper, "[", function()
  window.moveAndResize(hs.window.focusedWindow(), window.move.left)
end)

-----------------------------------------------
-- hyper shift ] to move vertically window +10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "]", function()
  window.moveAndResize(hs.window.focusedWindow(), window.move.down)
end)

-----------------------------------------------
-- hyper shift [ to move vertically window -10%
-----------------------------------------------

hs.hotkey.bind(table.concat(hyper, "shift"), "[", function()
  window.moveAndResize(hs.window.focusedWindow(), window.move.up)
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
