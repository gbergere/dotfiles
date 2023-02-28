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

function module:moveAndResize(win, action)
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = f.x + max.w * action[1]
    f.y = f.y + max.h * action[2]
    f.w = f.w + max.w * action[3]
    f.h = f.h + max.h * action[4]

    win:setFrame(f)
end

-----------------------------------------------
-- Window Layouts Component
-----------------------------------------------

module.layout = {
    maximized     = hs.layout.maximized,
    left50        = hs.layout.left50,
    right50       = hs.layout.right50,
    up50          = {  0,  0,  1, .5},
    bottom50      = {  0, .5,  1, .5},
    left40        = {  0,  0,.40,  1},
    right60       = {.40,  0,.60,  1},
    topLeft       = {  0,  0, .5, .5},
    topLeft40     = {  0,  0, .4, .5},
    topRight      = { .5,  0, .5, .5},
    topRight60    = { .4,  0, .6, .5},
    bottomLeft    = {  0, .5, .5, .5},
    bottomLeft40  = {  0, .5, .4, .5},
    bottomRight   = { .5, .5, .5, .5},
    bottomRight60 = { .4, .5, .6, .5},

    -- Layout for wideScreen
    left60        = {  0,  0, .6,  1},
    right40       = { .6,  0, .4,  1},
    center60      = { .2,  0, .6,  1},
    topRight40    = { .6,  0, .4, .5},
    bottomRight40 = { .6, .5, .4, .5},

    -- Layout for ultraWideScreen
    left33        = {  0,  0, .33,  1},
    center33      = {.33,  0, .34,  1},
    right33       = {.67,  0, .33,  1},

    topLeft28     = {  0,  0, .28, .5},
    topRight28    = {.72,  0, .28, .5},
    center44      = {.28,  0, .44,  1},
    bottomLeft28  = {  0, .5, .28, .5},
    bottomRight28 = {.72, .5, .28, .5},

    topLeft22     = {  0,  0, .22, .5},
    topRight22    = {.78,  0, .22, .5},
    left28        = {.22,  0, .28,  1},
    right28       = { .5,  0, .28,  1},
    bottomLeft22  = {  0, .5, .22, .5},
    bottomRight22 = {.78, .5, .22, .5},
}

function module:applyLayout(win, layout)
    hs.layout.apply({{nil, win, win:screen(), layout, nil, nil}})
end

-- Return functions
return module
