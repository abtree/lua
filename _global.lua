--[[
    lua 中默认包含一个环境变量 _G 
    调用 _G.print() == print()
]]--

-- 查看_G中包含的东西，我们用的所有内置的函数（如 print）和变量（如 _VERSION）都在_G里面
for k,v in pairs(_G) do
    print(k, v)
end

--[[
    如果要执行外部导入的脚步，而保证不进行危险炒作，可以设置执行环境
]]--
function execScript(code)
    -- 执行的脚步，错误信息，文本和二进制，环境
    --环境中只有print，就只会执行print
    -- 后面的os不会执行
    local rs, err= load(code,"code_error","bt",{print=_G.print}) 
    if rs == nil then 
        print(err)
        return false
    end
    return pcall(rs)
end

function execScript1()
    local t ={}
    for k, v in pairs(_G) do
        if k ~= "os" then -- 将os包从环境中移除
            t[k] = v
        end
    end 
    local _ENV = t 
    print(os) -- 此时函数中就不能访问os库了
end

str = "print(124);os.remove('a.txt')"
execScript(str)

execScript1()