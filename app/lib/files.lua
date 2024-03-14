local json = require("json")

local files = {}

function files.read (path) 
    local file = fs.open(path, 'r')
    local content = file.read()
    file.close()
    return content
end

function files.write (path, data) 
    local file = fs.open(path, 'w')
    file.write(data)
    file.close()
end

function files.modify (path, callback)
    local file = fs.open(path, 'w')
    local content = callback(read(path))
    file.write(content)
    file.close()
    return content
end

function files.readJson (path)
    return json.decode(read(path))
end

function files.modifyJson (path, callback)
    local file = fs.open(path, 'w')
    local content = callback(readJson(path))
    file.write(content)
    file.close()
    return content
end

function files.downloadFile (path, url)
    local file = fs.open(path, "w")
    file.write(http.get(url).readALL())
    file.close()
end

function files.ensureFile (path, url)
    if (fs.exists(path) == false) then
        downloadFile(path, url)
        return "downloaded"
    end
    return "allready exists"
end

function files.syncFile (path, url)
    if (read(path) == http.get(url).readALL()) then return "not changed (file is up to date)" end
    if (fs.exists(path) == false) then 
        downloadFile(path, url)
        return "downloaded"
    end
    downloadFile(path, url)
    return "updated"
end

return files