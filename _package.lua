--[[
引用外部lua文件
]]--

-- 相对路径
require("helper/helper")
local help = require("helper/localhelper")
print(helper.getIp())
print(helper.getOs())

print(help.help.getVersion())
print(help.tool.getMode())

-- 绝对路径(将你要引入的路径加入到查找路径)
-- 不推荐使用
package.path = package.path..";your_path/?.lua"
print(package.path)
-- 预加载的module
for k,v in pairs(package.preload) do
    print(k)
end
-- 加载的module
for k,v in  pairs(package.loaded) do
    print(k)
end