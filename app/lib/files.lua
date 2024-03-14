local json = require("json")

local files = {}

function files.read (path) 
    local file = fs.open(path, 'r')
    local content = file.readAll()
    file.close()
    return content
end

function files.write (path, data) 
    local file = fs.open(path, 'w')
    file.write(data)
    file.close()
end

function files.modify (path, callback)
    local content = callback(read(path))
    local file = fs.open(path, 'w')
    file.write(content)
    file.close()
    return content
end

function files.readJson (path)
    return json.decode(read(path))
end

function files.modifyJson (path, callback)
    local content = callback(readJson(path))
    local file = fs.open(path, 'w')
    file.write(content)
    file.close()
    return content
end

function files.downloadFile (path, URL)
    local file = fs.open(path, "w")
    file.write(http.get(URL).readALL())
    file.close()
end

function files.ensureFile (path, URL)
    if (fs.exists(path) == false) then
        downloadFile(path, URL)
        return "downloaded"
    end
    return "allready exists"
end

function files.syncFile (path, URL)
    if (read(path) == http.get(URL).readALL()) then return "not changed (file is up to date)" end
    if (fs.exists(path) == false) then
        downloadFile(path, URL)
        return "downloaded"
    end
    downloadFile(path, URL)
    return "updated"
end

return files