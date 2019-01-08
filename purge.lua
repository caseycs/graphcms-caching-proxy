-- Ilia Kondrashov 08.01.2019 14:57:32, inspired by
-- Tit Petric, Monotek d.o.o., Thu 27 Oct 2016 10:43:38 AM CEST
-- https://github.com/orangle/openresty-proxy-purge-example/tree/master/purge_multi

function exec(cmd)
        ngx.log(ngx.INFO, cmd)
        local handle = io.popen(cmd)
        local result = handle:read("*all")
        handle:close()
        ngx.log(ngx.INFO, result)
end

if ngx ~= nil then
        local cmd = "/usr/bin/find " .. ngx.var.lua_purge_path .. " -type f -delete -print0 2>&1"
        exec(cmd)

        ngx.say("OK")
        ngx.exit(ngx.OK)
end
