--[==[
    模拟类 
    构造子对象
    实现继承和继承链
]==]--

base={a=1,b=2}
base.fn1=function()
    print("fn1")
end
function base:fn2()
    print("fn2: "..self.a .. " , ".. self.b)
end
print(base.fn1())
print(base:fn2())
-- 添加自索引
base.__index=base
-- 定义new方法
function base:new()
    local obj={}
    setmetatable(obj, self)
    return obj
end

-- 用new方法生成实例
impl = base:new()
print(impl.a)
print(impl.fn1())
print(impl:fn2())

-- 如果要实现继承链 可以再将impl继续继承
impl.c=3
-- impl 继续自索引
impl.__index = impl
-- 为impl实现new
function impl:new(obj)
    local obj= obj or {}
    setmetatable(obj, self)
    return obj
end
impl2 = impl:new({d=4})
print(impl2.a, impl2.b, impl2.c, impl2.d)
print(impl2.fn1())
print(impl2:fn2())

--[[ 
    重写
    如果继承重新赋值了key，key就重写了，
    不影响父对象的key值
]]--
impl2.c=33
print(impl2.c, impl.c) -- 33 3
impl2.fn1=function()
    print("impl2 fn1") -- impl2 fn1
end
impl2.fn1()

--[[
    私有化
    当变量和部分方法不想被外部访问或修改时，
    可以进行私有化保护
]]--
function newUser()
    local id= 1
    local name = "tom"
    function getId()
        return id        
    end
    function getName()
        return name        
    end
    return { -- 这里返回一个新table，只返回需要暴露的对象或方法
        getId = getId,
        getName = getName
    }
end

user = newUser()
print(user.getId(), user.getName())