-- Ilia Kondrashov 08.01.2019 14:57:32, inspired by
-- Tit Petric, Monotek d.o.o., Thu 27 Oct 2016 10:43:38 AM CEST
-- https://github.com/orangle/openresty-proxy-purge-example/tree/master/purge_multi

function exec(cmd)
        ngx.log(ngx.INFO, cmd)
        local handle = io.popen(cmd)
        local result = handle:read("*all")
        handle:close()
        ngx.log(ngx.INFO, result)
        return result
end

if ngx ~= nil then
        local cmd = "/usr/bin/find " .. ngx.var.lua_purge_path .. " -type f -delete -print 2>&1"
        local result = exec(cmd)
        local lines  = select(2, string.gsub(result, '\n', ""))

        ngx.header["Content-type"] = "text/plain; charset=utf-8"
        ngx.header["X-Purged-Count"] = lines

        ngx.say("OK")
        ngx.exit(ngx.OK)
end
