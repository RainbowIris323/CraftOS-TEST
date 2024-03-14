if (fs.exists("update.lua")) then
    local file = fs.open("update.lua", "r")
    local data = file.readAll()
    file.close()
    print(data)
    print(http.get("http://raw.githubusercontent.com/RainbowIris323/CraftOS-TEST/main/app/update.lua").readAll())
    if (data ~= http.get("http://raw.githubusercontent.com/RainbowIris323/CraftOS-TEST/main/app/update.lua").readAll()) then
        error("The updater has been updated please reinstall")
        return
    end
else
    error("The updater is missing please reinstall")
    return
end

shell.run("update run")
shell.run("main run")