--[==[
table: {}
    lua的表结构
]==]--

-- 定义一个普通的table（hash）
info = {
    id=123,
    name="tom",
    sex=false
}

-- 增加字段（修改，查找也是这样）
info.age = 18
info["country"] = "zn_ch"
-- 删除字段
info.id = nil 
info["name"] = nil
-- 遍历
for k,v in pairs(info) do 
    print(k, v)
end

-- 定义一个数组table
list = {"abc", 123, true}
-- 遍历 注意：lua的table下标从1开始
for k,v in pairs(list) do 
    print(k, v)
end
-- 可通过下标添加，修改，查找字段
-- 增加 
list[22] = 22
-- 修改
list[3] = false
-- 删除
list[2] = nil 

-- 混搭模式
info2 = {
    name="tom",
    age=18,
    sex=false,
    111,
    "222",
    {"a","b", 1, son="son"},
    child={son2="son2","son3",false,123456},
    country="en",
    333
}

print("\n")
-- 注意循环会先返回数组元素，再返回key-value对
for k,v in pairs(info2) do 
    if type(v) == "table" then 
        print(k)
        for k1, v1 in pairs(v) do 
            print("\t", k1, v1)
        end
    else 
        print(k, v)
    end
end
-- 修改子table元素(混合表中的kv对不影响数组元素的下标，所以第一个出现的数组元素下标为1)
info2.child[2] = false 
info2[3].son = "new_son"

--二维数组
arr ={
    {1,2,3},
    {4,5,6} 
}
-- table 内置函数
t1={"a","b","c"}
print(table.concat(t1)) -- 链接table的元素，拼接为字符串，数组中不能有nil(nil在最后可忽略)
print(table.concat(t1, ","))

table.remove(t1) -- remove 删除数组元素，默认删除最后一个
print(table.concat(t1))

table.insert(t1, "d") -- insert 插入元素， 默认插在最后
print(table.concat(t1))

table.sort(t1, function (a,b)  -- sort 数组排序
    return a > b 
end)
print(table.concat(t1))

--[==[ v >= 5.3
t2 = {}
table.move(t1, 1, #t1, 1, t2)
print(table.concat(t2))
]==]--