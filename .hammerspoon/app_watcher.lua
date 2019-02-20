-----------------------------------------------
-- Watch Application Events
-----------------------------------------------

appWatcher = hs.application.watcher.new(function(appName, event, app)
    -- Always launch Terminal in full screen.
    if event == hs.application.watcher.launched and appName == "Terminal" then
        app:mainWindow():setFullScreen(true)
    end
end)
appWatcher:start()
