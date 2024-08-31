--[==[
    模拟类
    自索引
]==]--

-- 常规写法
t1={id=123,name="tom"}
-- 索引表 相当于t1的基类
indexTable={phone="123456"}
meta={
    __index=indexTable
}
setmetatable(t1, meta)
print(t1.phone) -- 会去indexTable取

-- 自己索引自己的写法
t2={id=123,name="tom"}
meta1 ={phone="123456"}
--[[
自己索引自己
注意，不能在meta1定义时就索引自己，只能在外面写
因为要想索引自己，自己要先存在，不然__index=nil
]]--
meta1.__index=meta1
setmetatable(t2, meta1)
print(t2.phone)

-- 通过索引表可以实现继承
father={a=1,b=2}
father.say=function()
    print("say")
end
function father:faSay()
    print("father say")
end
son={c=3,d=4}
function son:sonSay()
    print("son say")
end
-- 设置元表
setmetatable(son, father)
son:sonSay()
-- 此时son并不能访问father的方法
-- 但是设置索引后就可以了(加__index后，son中没有的key会去father中取)
father.__index=father
son.say()
son:faSay()
-- 此时还可以定义son2，依然可以继承father的方法