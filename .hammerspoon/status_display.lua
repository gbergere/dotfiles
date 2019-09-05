--- === status_display ===
---
--- Small menubar text display
---
--- Inspired from https://github.com/andweeb/ki/blob/master/src/status-display.lua

local status_display = {}
status_display.__index = status_display
status_display.__name = "status-display"

status_display.DEFAULT_WIDTH = 500
status_display.DEFAULT_HEIGHT = 18
status_display.DEFAULT_FADE_TIMEOUT = 0.8

status_display.displays = {}

local _, inDarkMode = hs.osascript.applescript([[
    tell application "System Events" to tell appearance preferences to return dark mode
]])

-- Create the canvas text element
function status_display:createTextElement(text)
    return {
        type = "text",
        frame = {
            x = 0,
            y = 0,
            w = self.DEFAULT_WIDTH,
            h = self.DEFAULT_HEIGHT,
        },
        text = hs.styledtext.new(text, {
            color = inDarkMode
                and { red = 0.8, blue = 0.8, green = 0.8 }
                or { red = 0, blue = 0, green = 0 },
            font = { name = "Menlo", size = 10 },
            paragraphStyle = { alignment = "center" },
        }),
    }
end

--- status_display:show(status)
--- Method
--- Shows a text display on center of the menu bar to indicate the current mode
---
--- Parameters:
---  * `status` - a string value containing the current mode (i.e., `"normal"`, `"entity"`, etc.)
---
--- Returns:
---  * None
function status_display:show(text)
    local screenFrame = hs.screen.mainScreen():frame()

    local dimensions = {
        x = screenFrame.x + (screenFrame.w / 2) - (self.DEFAULT_WIDTH / 2),
        y = screenFrame.y - self.DEFAULT_HEIGHT,
        h = self.DEFAULT_HEIGHT,
        w = self.DEFAULT_WIDTH,
    }

    local textElement = self:createTextElement("-- "..text.." --", inDarkMode)
    self.display = hs.canvas.new(dimensions):appendElements({ textElement }):show()
end

function status_display:clear()
    self.display:hide()
end

return status_display
