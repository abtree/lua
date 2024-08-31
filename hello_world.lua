-- lua 命令行执行有两种方式
-- lua hello_world.lua 执行源文件
-- luac -o hello_world.out hello_world.lua 编译为二进制文件(注意 源文件列表要放在选项(如 -o)后面)
-- lua hello_world.out 在用lua运行
print("hello world")
