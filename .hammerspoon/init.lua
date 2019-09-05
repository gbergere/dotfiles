----------------------------------------------
-- Set up
-----------------------------------------------

-- Disable animation transition on windows
hs.window.animationDuration = 0.05
-- Disable alert on hotkey trigger
hs.hotkey.alertDuration = 0

-----------------------------------------------
-- Reload config on write
-----------------------------------------------

function reload_config(files)
  hs.reload()
end
hs.hotkey.bind({}, "f1", "Reload Hammerspoon config", reload_config)
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")

-----------------------------------------------
-- Load all configuration parts
-----------------------------------------------

require("app_shortcuts")
require("app_watcher")
require("fn_shortcuts")
require("window_shortcuts")

-----------------------------------------------
-- Defeating paste blocking (when shift)
-----------------------------------------------

hs.hotkey.bind({"cmd", "shift"}, 'v', "Defeating past blocking",  function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)
