--[==[
运算符：
    +     -     *     /     %     ^     #
    ==    ~=    <=    >=    <     >     =
    (     )     {     }     [     ]
    ;     :     ,     .     ..    ...

    lua 中没有++ -- += -= 等运算符
    # 取长度操作符 如 #table
]==]--

-- 赋值运算符(不同类型变量也可以赋值)
a=1
b="abc"
a=b
-- 多重赋值
a,b,c = 1,"2",false 
a,b,c,d = 1,2 -- c = nil, d = nil
a,b = 1,2,3,4 -- 3,4 丢弃
a,b = b,a -- 交换a,b 
-- 算数运算符
print(1+2) -- 3
print(2-1) -- 1
print(2*1) -- 2
print(3/2) -- 1.5
print(10^2) -- 100
print(1+"1") -- 2 自动类型转换
-- 关系运算符(结果只能为true或false且只能相同类型间运算)
print(2 > 1) -- 大于
print(2 < 1) -- 小于
print(2 >= 1) -- 大于等于
print(2 <= 1) -- 小于等于
print(2 ~= 1) -- 不等于
print(2 == 1) -- 等于
print(1==1.0) -- true 
print(1=="1") -- false 类型不同不可能等
--[==[
逻辑运算符
    and or not
    false和nil为假，其余都为真
    a and b：如果a为真，返回b；如果a不为真，返回a(不会计算b)
    a or b: 如果a为真，返回a（不会计算b）；如果a不为真，返回b
    not a：如果为真返回false；如果a为假，返回true
]==]--
a,b = 1,2
print(a and b) -- 2
print(false and b) -- false
print(a or b) -- 1
print(false or b) -- 2
print(not a) -- false 
print(not d) -- true d=nil
-- 可以利用逻辑运算符的短路特性，来决定是否运算后续逻辑
a = a or 10 -- 如果a未赋值，a=10
-- 三目运算
d = (a and b) or c -- 如果a为真，取b；a为假，取c （此处如果b为假，会取不到b）
print(d)
e = ((a and {b}) or {c})[1]
print(e)