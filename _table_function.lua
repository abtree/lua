--[==[
用table构建类
]==]--

-- 外部定义的函数赋值给table
function show(a, b)
    print(a, b)
end

c1 ={
    show=show,
    add = function(a, b) -- table内部的函数
        return a + b
    end
}
c1.sub = function(a, b) -- table添加的函数
    return a- b
end
c1["mul"] = function(a, b)
    return a*b
end
de="dev"
c1[de] = function(a, b)
    return a / b
end

c1.show("a", "b")
print(c1.add(21,34))
print(c1.sub(34,21))
print(c1.mul(3, 8))
print(c1.dev(6, 3)) -- 通过变量值访问
print(c1[de](8, 2)) -- 直接通过变量访问

-- 通过table直接访问成员
c2={
    a=0,
    b=0,
    result = 0,
    add=function()
        c2.result = c2.a + c2.b -- 注意，成员都要用table名访问
    end,
    show=function()
        print(c2.result)
    end
}
c2.a=11
c2.b=22
c2.add()
c2.show()