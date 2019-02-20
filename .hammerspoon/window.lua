-----------------------------------------------
-- Window Management Module
-----------------------------------------------

local module = {}

-----------------------------------------------
-- Window Movement Component
-----------------------------------------------

module.move = {
    up    = {  0,-.1},
    down  = {  0, .1},
    left  = {-.1,  0},
    right = { .1,  0}
}

module.moveWindow = function(win, movement)
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = f.x + max.w * movement[1]
    f.y = f.y + max.h * movement[2]
    win:setFrame(f)
end

-----------------------------------------------
-- Window Resizing Component
-----------------------------------------------

module.resize = {
    shorter = {  0,-.1},
    taller  = {  0, .1},
    thiner  = {-.1,  0},
    bigger  = { .1,  0}
}

module.resizeWindow = function(win, action)
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = f.w + max.w * action[1]
    f.h = f.h + max.h * action[2]
    win:setFrame(f)
end

return module
