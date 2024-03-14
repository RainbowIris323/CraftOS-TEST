local PrimeUI = require("/lib/PrimeUI")
local files = require("/lib/files")

local screen = {}

screen.draw = function ()
    PrimeUI.clear()
    local termWidth, termHeight = term.getSize()
    
    -- Background
    PrimeUI.borderBox(term.current(), 0, 0, termWidth, termHeight, colors.gray, colors.lightGray)

    -- Details
    PrimeUI.borderBox(term.current(), 0, 0, termWidth, termHeight / 20, colors.gray, colors.gray)
    PrimeUI.borderBox(term.current(), 0, termHeight - termHeight / 20, termWidth, termHeight / 20, colors.gray, colors.gray)

    -- Static
    local title = PrimeUI.textBox(term.current(), 0, termHeight / 20, termWidth, termHeight / 10, "RaynboOS v" .. files.readJson("/config/installs.json").base, colors.lime)

    -- lift off
    PrimeUI.run()
end

return screen