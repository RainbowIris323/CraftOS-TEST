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
local downloadFile = function (path, url)
    if (fs.exists(path)) then
        fs.delete(path)
    end
    local file = fs.open(path, "w")
    writeToTerminal("installing file: " .. path .. " from url: " .. url, colors.lime)
    for i, v in pairs(http.get(url)) do
        print(i .. " | " .. v)
    end
    sleep(5)
    file.write(http.get(url).readALL())
    file.close()
end

writeToTerminal("Installing RaynboOS base runtime", colors.green)

-- core code
downloadFile("startup.lua", joinURL("app/startup.lua"))
downloadFile("install-module.lua", joinURL("app/install-module.lua"))

-- core libs
downloadFile("lib/PrimeUI.lua", joinURL("app/lib/PrimeUI.lua"))
downloadFile("lib/files.lua", joinURL("app/lib/files.lua"))
downloadFile("lib/json.lua", joinURL("app/lib/json.lua"))

-- core configs
downloadFile("config/installs.json", joinURL("app/config/installs.json"))

writeToTerminal("RaynboOS base runtime runtime installed", colors.green)

sleep(0.5)

shell.run('startup run')