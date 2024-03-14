local baseRepoURL = "https://raw.githubusercontent.com/RainbowIris323/CraftOS-TEST/main/"
os.loadAPI("https")
os.loadAPI("colors")

local joinURL = function (path)
    return baseRepoURL .. path
end

-- writes text to the terminal with a given color
local writeToTerminal = function (text, textColor)
    term.setTextColor(color)
    print(text)
    term.setTextColor(colors.white)
end

-- downloads or updates a file to the computer
local downloadFile = function (path, url)
    local status = "downloaded"
    if (fs.exists(path)) then
        fs.delete(path)
        status = "updated"
    end
    local file = fs.open(path, "w")
    writeToTerminal("installing file: " .. path .. " from url: " .. url, colors.red)
    file.write(http.get(url).readALL())
    file.close()
end

writeToTerminal("Installing RaynboOS base runtime", colors.lime)

-- core code
downloadFile("startup.lua", joinURL("app/startup.lua"))
downloadFile("install-module.lua", joinURL("app/install-module.lua"))

-- core libs
downloadFile("lib/PrimeUI.lua", joinURL("app/lib/PrimeUI.lua"))
downloadFile("lib/files.lua", joinURL("app/lib/files.lua"))
downloadFile("lib/json.lua", joinURL("app/lib/json.lua"))

-- core configs
downloadFile("config/installs.json", joinURL("app/config/installs.json"))

writeToTerminal("RaynboOS base runtime runtime installed", colors.lime)

sleep(0.5)

shell.run('startup run')