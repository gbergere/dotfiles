-- Imports
local status = require("./status_display")

----------------------------------------------
-- Set up modal
-----------------------------------------------

local vim = hs.hotkey.modal.new()
vim_modal = hs.hotkey.bind({"alt"}, "`", function()
    vim:enter()
    status:show("VIM MODE")
end)

vim:bind({}, 'i', function()
    vim:exit()
    status:clear()
end)

vim:bind({"alt"}, '`', function()
    -- Unbind Alt + w while in the modal
end)

-- Disable modal on Terminal
hs.window.filter.new('Terminal')
    :subscribe(hs.window.filter.windowFocused, function()
        vim:exit()
        vim_modal:disable()
    end)
    :subscribe(hs.window.filter.windowUnfocused, function()
        vim_modal:enable()
    end)

