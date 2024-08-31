--[==[
    lua 中函数的使用
]==]--

-- 不带参数和返回值的函数
function f1()
    print("~~~~ f1 ~~~~")
end
f1()

-- 带参数的函数
function f2(a,b,c)
    print(a,b,c)
end
f2(1,2,3)

-- 带返回值的函数(可以同时返回多个值)
function f3(a, b, c)
    return a,b,c,"d","e"
end
print(f3(1,true,"c"))

-- 局部函数
local function f5()
    print("local function")    
end

-- 匿名函数
f6 = function(a, b)
    return a+b
end

-- 函数作为参数
function f7(func, a, b)
    print(func(a, b))
end
f7(f6, 1, 3)
f7(f1, nil, nil) -- 这种也可以正常运行

-- 可变参数
function f4(...)
    -- 通过循环取值
    print(select(1, ...)) -- 取出第1个参数后所有参数（即全部参数）
    print((select(2, ...))) -- 取出第2个参数,用小括号包起来，子取单个元素

    count = select("#", ...) -- 获取参数个数
    for i=1,count do
        print((select(i, ...))) -- 取出每个元素
    end
end
f4(1,2,3)
-- 用pack处理可变参数（将可变参数，打包为table）
-- function f8(...)
--     local t1 = table.pack(...)  -- 需要版本5.2以上
--     print(t1.n) -- 打印table长度 
--     for k,v in ipairs(t1) do
--         print(k, v)
--     end
-- end
-- f8(1,2,3, nil, {4,5,6})

function f8(...)
    local t = {...} -- 可以直接转table
    for k,v in pairs(t) do
        if type(v) == "table" then
            print(k.."{")
            for k1,v1 in pairs(v) do
                print("\t", k1, v1)
            end
            print("}")
        else
            print(k, v)
        end
    end
end
f8(1,2,3, nil, {4,5,6})

-- 闭包问题
function f9(a, b)
    return function()
        print(a+b)
    end
end
local add = f9(1,2)
add()

function f10()
    local x = 0
    return function()
        x=x+1
        return x
    end
end
local incr = f10()
print(incr())   -- 1
print(incr())   -- 2
print(incr())   -- 3

-- 用闭包实现迭代器
local t2 = {11,22,33}
function myPairs(tb)
    local count = #tb   -- 这里保存长度
    local i = 0         -- 这里保持当前位置
    return function()
        i=i+1   -- 这里更新位置
        if i <= count then
            return i, tb[i] -- 返回当前值
        else
            return nil -- 遍历结束
        end
    end 
end
for k,v in myPairs(t2) do
    print(k, v) 
end
