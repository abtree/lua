--[==[
  lua中模拟类 self 指针
]==]--
t1={
    id=123,
    name="tom",
    getId=function()
       return t1.id -- 这里硬编码指向t1
    end,
    getIdObj=function(obj)
        return obj.id -- 这里将obj传入可以解决问题
    end
}
-- 如果要启用self指针 需要这样定义成员方法
function t1:getName()
    return self.name
end

-- 带self的方法需要用：访问
print(t1:getName())
-- 如果这里将t1赋值给t2
t2=t1 
-- 再将t1注销
t1=nil 
-- 此时会照成t2的getId方法无法调用
print(t2.id) -- 此时id是可以访问的
-- print(t2.getId())
print(t2.getIdObj(t2)) -- 传入self
-- t2也可以访问该方法
print(t2:getName())