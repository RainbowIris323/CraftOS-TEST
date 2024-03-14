local PrimeUI = require("/lib/PrimeUI")
local files = require("/lib/files")

PrimeUI.clear()
PrimeUI.label(term.current(), 3, 5, "Hello!", colors.lime, colors.gray)
PrimeUI.run()