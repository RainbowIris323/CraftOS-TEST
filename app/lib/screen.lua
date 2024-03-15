local PrimeUI = require("/lib/PrimeUI")
local files = require("/lib/files")

local screen = {}

screen.draw = function ()
    PrimeUI.clear()
    local termWidth, termHeight = term.getSize()
    
    -- Background
    PrimeUI.borderBox(term.current(), 1, 1, termWidth - 1, termHeight - 1, colors.gray, colors.lightGray)

    -- Details
    PrimeUI.borderBox(term.current(), 1, 1,                                             termWidth - 1, math.floor(termHeight / 20) - 1, colors.gray, colors.gray)
    PrimeUI.borderBox(term.current(), 1, termHeight - math.floor(termHeight / 20) + 1,  termWidth - 1, math.floor(termHeight / 20) - 1, colors.gray, colors.gray)

    -- lift off
    PrimeUI.run()
end

return screen