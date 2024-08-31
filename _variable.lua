--[[
变量 
    1.lua为动态语言类型，定义变量不需要类型声明
    2.每行代码结束，可以加分号也可以不加
    3.lua变量类型可以随时改变
    4.变量名由数字字母下划线组成，不能以数字开头，不能是保留字
    5.变量区分大小写
]]--
a=123 --int
print(a)
a="abc" --string
print(a)
a=true --bool
print(a)
print("\n")
--[[
变量分为全局变量，局部变量和表字段 global variables, local variables, and table fields
    默认变量都是全局变量
    局部变量用local修饰
]]--

local b = 1 -- 局部变量
do -- 开启一个代码块
    c = 2 -- 全局变量
    local d = 3 -- 局部变量
    print(a)
    print(b)
    print(c)
    print(d)
end
print("\n")
print(a)
print(b)
print(c)
print(d)    -- nil 不能正常访问

--[==[
    lua 中有八种类型 nil, boolean, number, string, function, userdata, thread, table
    boolean
        在if条件判断中只有false和nil表示false，number 0 或者 空字符串 都表示true
    number 包括整数和浮点数(下面是合法的数字)
        3   3.0   3.1416   314.16e-2   0.31416E1   0xff   0x56
    string 
        单引号：同双引号
        双引号：同单引号
        级定义：中括号中带有多少个等号表示多少级（一个都不带表示0级）中括号只能同级匹配
            [[ ]] [=[ ]=]

]==]--
print("变量类型\n")
print(type(nil))    -- nil
print(type(true))   -- boolean
print(type(0))      -- number
print(type("a"))    -- string
print(type(function()end)) -- function
print(type({}))     -- table

print("string的特殊定义")
a = 'alo\n123"'
print(a)
a = "alo\n123\""
print(a)
a = '\97lo\10\04923"'
print(a)
-- 0级
a = [[alo
123"]]
print(a)
-- 2级(如果要输出中括号，可以通过增加级来输出 如下)
a = [==[ [[
alo
123" ]] ]==]
print(a)