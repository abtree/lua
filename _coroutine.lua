--[==[
    协程:由自己决定何时让出控制权的进程
    协程在主线程中运行，可以随时唤醒或挂起
]==]--

-- 协程运行的方法
function run()
    -- 获取当前协程
    local h = coroutine.running()
    print(coroutine.status(h)) -- 当前状态 running
    local a,b = coroutine.yield("yield") -- 挂起协程:返回yield
    print(a, b) -- a,b 为协程重启时传入的参数
    return "end"
end

-- 创建协程
handle = coroutine.create(run)
-- 查看当前协程status
print(coroutine.status(handle)) -- suspended 挂起
-- 开始执行协程
b,ret = coroutine.resume(handle)
print(b, ret)
print(coroutine.status(handle)) -- suspended 挂起
-- 重新开始执行协程
b,ret = coroutine.resume(handle, 123, "abc") -- 此时可以传入参数
print(b, ret)
print(coroutine.status(handle)) -- dead 结束

-- 协程实现双循环
function fun1()
    h2 = coroutine.create(fun2) -- 创建 h2
    for i=1,10 do
        print("fun1 ".. i)
        coroutine.resume(h2) -- 启动协程 h2
    end
end

function fun2()
    for i=1,10 do
        print("fun2 ".. i)
        coroutine.yield() -- h2 挂起
    end
end
h1 = coroutine.create(fun1) -- 创建 h1
coroutine.resume(h1) -- 启动协程 h1

-- 生产者消费者模型
function product()
    for i=1,10 do
        coroutine.yield("product"..i)
    end
end

function consumer()
    local p = coroutine.create(product)
    for i=1,10 do
        local b, v = coroutine.resume(p)
        print(v.." : ".. i)
    end
end
c = coroutine.create(consumer)
coroutine.resume(c)