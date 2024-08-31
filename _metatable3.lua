--[[
    元表 其他方法
]]--
t1={id=123, name="aaa"}
meta = {}
setmetatable(t1, meta)

-- tostring输出
meta.__tostring = function(t)
    local str=""
    for k,v in pairs(t) do 
        str = str.."(key): "..k.."\t(value): "..v.."\n"
    end
    return str
end

-- 这里会调用tostring方法
print(t1)

-- __call 方法 
t2={id=123, name="aaa"}
meta1 = {}
setmetatable(t2, meta1)
meta1.__call = function(t, ...)
    print(...)  -- 先打印传入参数
    for k, v in pairs(t) do -- 在打印table中原有的值
        print("(key):", k, "(value):", v)
    end
end
-- __call方法相当于重载（），为table提供一个默认调用
t2("1","a","b")