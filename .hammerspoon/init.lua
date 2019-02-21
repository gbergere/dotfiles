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

hs.hotkey.bind({"cmd", "shift"}, 'v', function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)
