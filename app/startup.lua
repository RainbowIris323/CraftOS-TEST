if (fs.exists(path)) then
    local file = fs.open(path, "r")
    local data = file.read()
    file.close()
    if (data ~= http.get(URL).readAll()) then
        error("The updater has been updated please reinstall")
        return
    end
else
    error("The updater is missing please reinstall")
    return
end

shell.run("update run")
shell.run("main run")