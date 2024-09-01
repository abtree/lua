--[[
    lua中引入相关的redis包可以链接redis
]]--
local redis = require("redis")
-- 链接redis
local config = {host="127.0.0.1", port=6379}
local client = redis.connect(config)

-- 查看redis info
info = client:info()
for k,v in pairs(info.clients) do 
    print(k, v)
end

-- get set
print(client:set("key", "value"))
print(client:get("key"))

--[[
    也可以编写redis脚本，用redis命令eval运行
    eval script 1 key
]]--

local val=redis.call('GET', KEYS[1])
if _G.tonumber(val) > 0 then
    redis.call('DECR', KEYS[1])
end
return true