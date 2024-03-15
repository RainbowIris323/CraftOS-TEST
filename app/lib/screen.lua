local PrimeUI = require("/lib/PrimeUI")

local screen = {}

screen.draw = function ()
    PrimeUI.clear()
    local termWidth, termHeight = term.getSize()
    
    -- Background

    -- Details
    PrimeUI.borderBox(term.current(), 2, 2,                                             termWidth - 1, math.floor(termHeight / 20) - 2, colors.gray, colors.gray)
    PrimeUI.borderBox(term.current(), 1, termHeight - math.floor(termHeight / 20) + 1,  termWidth - 1, math.floor(termHeight / 20) - 2, colors.gray, colors.gray)

    -- lift off
    PrimeUI.run()
end

return screen