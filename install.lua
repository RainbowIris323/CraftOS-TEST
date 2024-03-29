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

-- downloads or updates a file to the computer
local downloadFile = function (path, URL)
    if (fs.exists(path)) then
        fs.delete(path)
    end
    local file = fs.open(path, "w")
    writeToTerminal("installing file: " .. path .. " from url: " .. URL, colors.lime)
    file.write(http.get(URL).readAll())
    file.close()
end

writeToTerminal("Installing RaynboOS base runtime", colors.green)

-- core code
downloadFile("startup.lua", joinURL("app/startup.lua"))
downloadFile("update.lua", joinURL("app/update.lua"))

writeToTerminal("RaynboOS base runtime runtime installed", colors.green)

sleep(0.5)

shell.run('startup run')