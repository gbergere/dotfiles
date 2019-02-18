-----------------------------------------------
-- Function Shortcuts with Fn
-----------------------------------------------
-- F3 -- Window Hint
-- F11 -- Show Desktop (default from OS X)
-- F12 -- Lock Screen
-----------------------------------------------

-----------------------------------------------
-- F3 to show window hints
-----------------------------------------------

hs.hotkey.bind({}, "f3", function()
    hs.hints.windowHints()
end)

-----------------------------------------------
-- F12 to Lock Screen
-----------------------------------------------
hs.hotkey.bind({}, "f12", function() 
    hs.caffeinate.lockScreen()
end)
