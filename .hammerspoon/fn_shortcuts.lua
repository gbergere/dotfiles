-----------------------------------------------
-- Function Shortcuts with Fn
-----------------------------------------------
-- F1  -- Mail
-- F2  -- Messages
-- F3  -- WhatsApp
-- F4  -- Messages
-- F11 -- Show Desktop (default from OS X)
-- F12 -- Finder
-----------------------------------------------

-----------------------------------------------
-- F1 to launch or focus on Mail
-----------------------------------------------

hs.hotkey.bind({}, "f1", "Jump to Mail", function()
  hs.application.launchOrFocus("Mail")
end)

-----------------------------------------------
-- F2 to launch or focus on Messages
-----------------------------------------------

hs.hotkey.bind({}, "f2", "Jump to Messages", function()
  hs.application.launchOrFocus("Messages")
end)

-----------------------------------------------
-- F3 to launch or focus on WhatsApp
-----------------------------------------------

hs.hotkey.bind({}, "f3", "Jump to WhatsApp", function()
  hs.application.launchOrFocus("WhatsApp")
end)

-----------------------------------------------
-- F4 to launch or focus on Signal
-----------------------------------------------

hs.hotkey.bind({}, "f4", "Jump to Signal", function()
  hs.application.launchOrFocus("Signal")
end)

-----------------------------------------------
-- F12 to focus on Finder
-----------------------------------------------

hs.hotkey.bind({}, "f12", "Jump to Finder", function()
  hs.application.launchOrFocus("Finder")
end)
