--[==[
循环
循环中可以break
但没有continue
goto 跳转到指定标记(应该已经废弃)
]==]--

-- while loop
i,sum = 0,0
while i<100 do
    i=i+1
    -- if i > 50 then
    --    goto FLAG --跳转到flag继续执行
    -- end
    sum = sum+i     
end
-- ::FLAG:: -- 定义一个flag
print(sum)

-- repeat loop 相当于 do while
i,sum = 0,0
repeat
    i=i+1
    sum = sum + i
until i >= 100
print(sum)

-- for loop 1 数值循环
for i=1,10 do 
    print(i)
end
for i=1,100,10 do -- 步长为10 
    print(i)
end
for i=10,1,-1 do -- 倒叙循环
    print(i)
end

list = {1,2,3,4,5,6}
for i=1,#list do
    print(list[i]*10)
end
-- for loop 2 in pairs循环
for k,v in pairs(list) do
    print(k, v*10)
end
-- pairs 既可以遍历下标 也可以遍历kv(遇见nil不会停止，但是会忽略nil)
-- ipairs 只能遍历下标（并且遇见第一个nil就会停止遍历）另外ipairs不能输出小于1的下标
tab = {1,2,3, a="11", b="22", nil, 4,5}
for k,v in ipairs(tab) do
    print(k, v*10) -- a,b 不会遍历
end
-- 99乘法表
for i=1,9 do
    for j=1,i do
        io.write(j,"*",i,"=",j*i,"\t")
    end
    io.write("\n")
end