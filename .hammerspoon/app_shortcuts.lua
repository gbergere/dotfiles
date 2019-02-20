-----------------------------------------------
-- App Shortcuts with Alt + Cmd
-----------------------------------------------
-- Alt + t -- Terminal
-- Alt + s -- Slack
-- Alt + c -- Google Chrome
-- Alt + e -- Mail
-- Alt + b -- Safari
-----------------------------------------------

local hyper = {"alt"}

-----------------------------------------------
-- hyper t to launch of focus on Terminal 
-----------------------------------------------

hs.hotkey.bind(hyper, "t", function()
    hs.application.launchOrFocus("Terminal")
    -- @TODO Full Screen
end)

-----------------------------------------------
-- hyper s to launch of focus on Slack 
-----------------------------------------------

hs.hotkey.bind(hyper, "s", function()
    hs.application.launchOrFocus("Slack")
end)

-----------------------------------------------
-- hyper c to launch of focus on Chrome
-----------------------------------------------

hs.hotkey.bind(hyper, "c", function()
    hs.application.launchOrFocus("Google Chrome")
end)

-----------------------------------------------
-- hyper e to launch of focus on Mail
-----------------------------------------------

hs.hotkey.bind(hyper, "e", function()
    hs.application.launchOrFocus("Mail")
end)

-----------------------------------------------
-- hyper b to launch of focus on Safari
-----------------------------------------------

hs.hotkey.bind(hyper, "b", function()
    hs.application.launchOrFocus("Safari")
end)
