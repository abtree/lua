--[==[
string #t1
]==]--

-- 大小写转换
str1="abcd"
str2=string.upper(str1)
print(string.lower(str2))

-- 长度
print(string.len(str1))
print(#str1)

-- 反转
print(string.reverse(str2))

-- 拼接
str3=123
print("abc".."xyz"..str1..str2..123 ..456.78 ..str3..000)

-- 截取
print(string.sub(str1, 2, #str1))   -- 正数为从前往后截取
print(string.sub(str1, -#str1, -3)) -- 负数为从后往前截取

-- 查找子串
str4="abcd1234"
a,b=string.find(str4, "cd")
print(a, b) -- 开始位置 结束位置

-- 第3个参数表示从第几个元素开始找，可以填负数
-- 第4个参数表示是否正则表达式匹配，默认false,即开启正则表达式
a,b=string.find(str4, "123", 3, true) 
print(a, b)
a,b=string.find(str4, "(%d%d%d%d)", 1, false) -- 表示匹配4个数字
print(a, b)

-- 替换(会返回替换了多少次)
print(string.gsub(str4, "abcd", "ABCD"))    -- 将abcd替换为ABCD
print(string.gsub(str4, "ab", "AB", 1)) --最后一个参数表示替换多少次

-- byte 与 char 互相转换
print(string.char(65, 66, 67))  -- 将asc转换为char
print(string.byte(str1, 1 , #str1)) --  将char转换为byte，不指定转换多少个，默认只转换1个