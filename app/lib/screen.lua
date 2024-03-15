local PrimeUI = require("/lib/PrimeUI")

local screen = {}

screen.draw = function ()
    PrimeUI.clear()
    local termWidth, termHeight = term.getSize()
    
    -- Background

    -- Details
    PrimeUI.borderBox(term.current(), 2, 1,                                             termWidth - 1, math.floor(termHeight / 20) - 1, colors.gray, colors.gray)
    PrimeUI.borderBox(term.current(), 2, termHeight - math.floor(termHeight / 20) + 1,  termWidth - 1, math.floor(termHeight / 20) - 1, colors.gray, colors.gray)

    -- lift off
    PrimeUI.run()
end

return screen