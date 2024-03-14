local baseRepoURL = "http://raw.githubusercontent.com/" -- update url!

local joinURL = function (path) 
    return baseRepoURL .. path
end

-- writes text to the terminal with a given color
local writeToTerminal = function (text, textColor)
    local color = colors[textColor]
    if (!color) then color = colors.white end
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
downloadFile("lib/display.lua", joinURL("app/lib/display.lua"))
downloadFile("lib/files.lua", joinURL("app/lib/files.lua"))
downloadFile("lib/json.lua", joinURL("app/lib/json.lua"))

-- core configs
downloadFile("config/installs.json", joinURL("app/config/installs.json"))

writeToTerminal("RaynboOS base runtime runtime installed", colors.lime)

sleep(0.5)

shell.run('startup run')