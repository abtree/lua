--[==[
    元表 元方法 (运算符重载)
    在元表中重载方法
    add sub mul div mod pow unm concat len eq lt le index newindex call
]==]--
t1 = {11,22,nil,nil,33}
t2={111,222,333}
metaT3 = {}

-- 设置metaT3为t1，t2的元表
setmetatable(t1, metaT3)
setmetatable(t2, metaT3)

-- 加法
metaT3.__add = function(t1, t2)
    local rs={}
    local size = math.max(#t1, #t2)
    for i=1,size do 
        if not t1[i] then
            rs[i] = t2[i]
        elseif not t2[i] then
            rs[i] = t1[i]
        else 
            rs[i] = t1[i] + t2[i]
        end
    end
    return rs
end
t3 = t1+t2
for i,v in pairs(t3) do 
    print(i, v)
end

-- 相等（注意，数组末尾的nil无效）
metaT3.__eq = function(t1, t2)
    if #t1 ~= #t2 then
        return false
    end
    local size = #t1 
    for i = 1,size do 
        if t1[i] ~= t2[i] then 
            return false
        end
    end
    return true
end
print(t1 == t2)