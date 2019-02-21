-----------------------------------------------
-- Window Management Module
-----------------------------------------------

local module = {}

-----------------------------------------------
-- Window Movement Component
-----------------------------------------------

module.move = {
  up    = {  0,-.1,  0,  0},
  down  = {  0, .1,  0,  0},
  left  = {-.1,  0,  0,  0},
  right = { .1,  0,  0,  0}
}

module.resize = {
  shorter = {  0,  0,  0,-.1},
  taller  = {  0,  0,  0, .1},
  thiner  = {  0,  0,-.1,  0},
  bigger  = {  0,  0, .1,  0}
}

module.moveAndResize = function(win, commands)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = f.x + max.w * commands[1]
  f.y = f.y + max.h * commands[2]
  f.w = f.w + max.w * commands[3]
  f.h = f.h + max.h * commands[4]

  win:setFrame(f)
end

return module
