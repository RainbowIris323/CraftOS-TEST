local baseRepoURL = "http://raw.githubusercontent.com/RainbowIris323/CraftOS-TEST/main/"

local joinURL = function (path)
    return baseRepoURL .. path
end

-- writes text to the terminal with a given color
local writeToTerminal = function (text, textColor)
    if (textColor == null) then textColor = colors.white end
    term.setTextColor(textColor)
    print(text)
    term.setTextColor(colors.white)
end

local checkVersion = function (path, URL)
    if (fs.exists(path)) then
        local file = fs.open(path, "r")
        local data = file.readAll()
        file.close()
        if (data == http.get(URL).readAll()) then
            return
        end
        writeToTerminal("updating file: " .. path .. " from url: " .. URL, colors.lime)
    else
        writeToTerminal("installing file: " .. path .. " from url: " .. URL, colors.lime)
    end
    local file = fs.open(path, "w")
    file.write(http.get(URL).readAll())
    file.close()
end

writeToTerminal("Updaing RaynboOS base runtime", colors.green)

-- core code
checkVersion("main.lua", joinURL("app/main.lua"))

-- core libs
checkVersion("lib/PrimeUI.lua", joinURL("app/lib/PrimeUI.lua"))
checkVersion("lib/files.lua", joinURL("app/lib/files.lua"))
checkVersion("lib/json.lua", joinURL("app/lib/json.lua"))
checkVersion("lib/screen.lua", joinURL("app/lib/screen.lua"))

writeToTerminal("RaynboOS base runtime has been updated", colors.green)

sleep(0.5)