-----------------------------------------------
-- Watch Application Events
-----------------------------------------------

appWatcher = hs.application.watcher.new(function(appName, event, app)
  -- Always launch Terminal in full screen.
  if event == hs.application.watcher.launched and appName == "Terminal" then

    -- Find tallest screen
    local initialScreen = hs.screen.primaryScreen()
    local screen = initialScreen
    local i = initialScreen
    repeat
      if i:currentMode()["h"] > screen:currentMode()["h"] then
        screen = i
      end
      i = i:next()
    until i:id() == initialScreen:id()

    app:mainWindow():moveToScreen(screen):setFullScreen(true)
  end
end)
appWatcher:start()
