--[==[
    文件操作
]==]--

-- 用file操作
-- 打开文件
f1 = io.open("a.txt", "r+")
if not f1 then
    print("file not exist")
    os.exit()
end

-- 将文件句柄输入到当前io
io.input(f1)
-- 读取文件数据（默认每次读1行）
while true do
    str = io.read() -- 等于 io.read("*l")
    if not str then -- 读到nil结束
        break
    end
    print(str);
end
-- 读取所有内容
print(io.read("*a"))
-- 让io写入
io.output(f1)
-- 写入文件
io.write("\nab")

-- 用file操作
f2 = io.open("b.txt", "w+")
f2:write("ab\n")
f2:write("cd\n")
f2:write("ef\n")
f2:seek("set", 0) -- 设置指针回到开头
-- print(f2:read("*a"))
-- 自带循环iterator
for line in f2:lines() do
    print(line)
end