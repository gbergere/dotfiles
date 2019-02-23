----------------------------------------------
-- Set up
-----------------------------------------------

-- Disable animation transition on windows
hs.window.animationDuration = 0
-- Disable alert on hotkey trigger
hs.hotkey.alertDuration = 0

-----------------------------------------------
-- Load all configuration parts
-----------------------------------------------

require("app_shortcuts")
require("fn_shortcuts")
require("reload")
require("app_watcher")
require("window_shortcuts")

-----------------------------------------------
-- Defeating paste blocking (when shift)
-----------------------------------------------

hs.hotkey.bind({"cmd", "shift"}, 'v', "Defeating past blocking",  function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)
