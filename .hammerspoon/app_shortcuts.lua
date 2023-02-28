-----------------------------------------------
-- App Shortcuts with Cmd
-----------------------------------------------
-- Ctrl + Alt + 1 -- Akiflow
-- Ctrl + Alt + 2 -- Slack
-- Ctrl + Alt + 3 -- Google Chrome
-- Ctrl + Alt + 4 -- Terminal
-- Ctrl + Alt + 9 -- Notes
-- Ctrl + Alt + 0 -- Safari
-----------------------------------------------

local hyper = {"ctrl", "cmd"}

-----------------------------------------------
-- hyper 1 to launch of focus on Akiflow
-----------------------------------------------

hs.hotkey.bind(hyper, "1", "Jump to Akiflow", function()
    hs.application.launchOrFocus("Akiflow")
end)
-----------------------------------------------
-- hyper 2 to launch of focus on Slack
-----------------------------------------------

hs.hotkey.bind(hyper, "2", "Jump to Slack", function()
    hs.application.launchOrFocus("Slack")
end)

-----------------------------------------------
-- hyper 3 to launch of focus on Chrome
-----------------------------------------------

hs.hotkey.bind(hyper, "3", "Jump to Google Chrome", function()
  hs.application.launchOrFocus("Google Chrome")
end)

-----------------------------------------------
-- hyper 4 to launch of focus on Terminal
-----------------------------------------------

hs.hotkey.bind(hyper, "4", "Jump to Terminal", function()
  hs.application.launchOrFocus("Terminal")
  -- @TODO Full Screen
end)

-----------------------------------------------
-- hyper 9 to launch of focus on Notes
-----------------------------------------------

hs.hotkey.bind(hyper, "9", "Jump to Notes", function()
  hs.application.launchOrFocus("Notes")
end)

-----------------------------------------------
-- hyper 0 to launch of focus on Safari
-----------------------------------------------

hs.hotkey.bind(hyper, "0", "Jump to Safari", function()
  hs.application.launchOrFocus("Safari")
end)
