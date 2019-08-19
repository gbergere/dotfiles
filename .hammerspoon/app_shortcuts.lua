-----------------------------------------------
-- App Shortcuts with Alt + Cmd
-----------------------------------------------
-- Alt + 1 -- Mail
-- Alt + 2 -- Slack
-- Alt + 3 -- Google Chrome
-- Alt + 4 -- Terminal
-- Alt + 7 -- iTunes
-- Alt + 8 -- WhatsApp
-- Alt + 9 -- Messages
-- Alt + 0 -- Safari
-----------------------------------------------

local hyper = {"ctrl", "cmd"}

-----------------------------------------------
-- hyper 1 to launch of focus on Mail
-----------------------------------------------

hs.hotkey.bind(hyper, "1", "Jump to Mail", function()
  hs.application.launchOrFocus("Mail")
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
-- hyper 7 to launch of focus on iTunes
-----------------------------------------------

hs.hotkey.bind(hyper, "7", "Jump to iTunes", function()
  hs.application.launchOrFocus("iTunes")
end)

-----------------------------------------------
-- hyper 8 to launch of focus on WhatsApp
-----------------------------------------------

hs.hotkey.bind(hyper, "8", "Jump to WhatsApp", function()
  hs.application.launchOrFocus("WhatsApp")
end)

-----------------------------------------------
-- hyper 9 to launch of focus on Messages
-----------------------------------------------

hs.hotkey.bind(hyper, "9", "Jump to Messages", function()
  hs.application.launchOrFocus("Messages")
end)

-----------------------------------------------
-- hyper 0 to launch of focus on Safari
-----------------------------------------------

hs.hotkey.bind(hyper, "0", "Jump to Safari", function()
  hs.application.launchOrFocus("Safari")
end)
