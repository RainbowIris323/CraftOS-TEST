local PrimeUI = require("/lib/PrimeUI")
local files = require("/lib/files")

PrimeUI.clear()
PrimeUI.label(term.current(), 3, 5, files.readJson("/config/installs.json"))
PrimeUI.borderBox(term.current(), 4, 7, 40, 1)
PrimeUI.run()