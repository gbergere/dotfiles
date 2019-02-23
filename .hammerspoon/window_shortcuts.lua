local window = require("window")
local s = require("hs._asm.undocumented.spaces")

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

hs.hotkey.bind(hyper, "space", function()
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
  local filtered_spaces = {}
  local spaces_count = 0
  for _, v in pairs(spaces) do
    if s.spaceType(v) == s.types.user then
      table.insert(filtered_spaces, v)
      spaces_count = spaces_count + 1
    end
  end

  for k, v in pairs(filtered_spaces) do
    if k < spaces_count and v == space then
      win:spacesMoveTo(filtered_spaces[k + 1])
      s.changeToSpace(filtered_spaces[k + 1])
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

  local filtered_spaces = {}
  for _, v in pairs(spaces) do
    if s.spaceType(v) == s.types.user then
      table.insert(filtered_spaces, v)
    end
  end


  for k, v in pairs(filtered_spaces) do
    if k > 1 and v == space then
      win:spacesMoveTo(filtered_spaces[k - 1])
      s.changeToSpace(filtered_spaces[k - 1])
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
