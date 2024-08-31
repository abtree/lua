--[==[
    元表 默认值
    __index 用于读值
    __newindex 用于写值
    rawset,rawget 是对本表进行操作，不会走元表
]==]--

t1 = {id=123, name="sam"}
meta ={}
setmetatable(t1, meta)

-- 此时找不到
print(t1.phone) -- nil
-- 在元表中设置默认值
meta.__index={phone = "123123"}
-- 在t1中找不到，会在其元表中找寻
print(t1.phone) -- 123123
-- 如果自己设置了值
t1.phone = "321321"
-- 会用自己的值
print(t1.phone) -- 321321

-- __index的另一种用法
t2={}
meta1={}
setmetatable(t2, meta1)

meta1.__index=function(t, k)
    t[k] = "new value"  -- 为t2表设置值
    return "once value"
end
-- 第一次拿到返回值
print(t2.key) -- once value
-- 之后拿到设置值(t2表中的值)
print(t2.key) -- new value

--[[
    __newindex的用法
    __newindex会阻止向元表中写入新值，而是在写入时调用__newindex
]]--

t3={hadkey="hadvalue"}
meta2={}
t4={}
setmetatable(t3, meta2)
meta2.__newindex = t4 --这样会阻止向t3写入新值，新值被写入t4中

print(t3.key) -- nil 
t3.key = "value" -- 实际是写入t4中
print(t3.key)  -- nil (t3中没有值)
print(t4.key) -- value
-- 如果想在 t3中访问到新值 需要设置其__index
meta2.__index = t4 
print(t3.key) -- value (实际上是取t4的值)
-- 如果原表有的字段，直接修改原表的字段
t3.hadkey = "newvalue"
print(t3.hadkey) -- newvalue
print(t4.hadkey) -- nil

--[[
当__newindex为方法的时候
]]--
t5={id=123}
meta3={}
setmetatable(t5, meta3)
meta3.__newindex=function(t, k, v)
    -- 可以对k和v进行处理
    print("key:"..k.."\tvalue:"..v)
    -- t[k]=v  注意不能直接这样赋值，会死循环
    rawset(t, k, v) -- 需要用该方法设置值
end
t5.key = "value"
print(t5.key)
t5.id=321   -- 如果是已有的值，不会走元方法
print(t5.id)