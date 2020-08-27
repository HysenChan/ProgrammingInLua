--第九章——协同程序
--[[
co=coroutine.create(function () print("hi")end)
print(co)
print(coroutine.status(co)) --suspended
coroutine.resume(co)    --hi
print(coroutine.status(co)) --dead

co1=coroutine.create(function ()
    for i = 1, 10 do
        print("co1",i)
        coroutine.yield()
    end
end)

coroutine.resume(co1)   --co1   1
print(coroutine.status(co1))    --suspended
coroutine.resume(co1)   --co1   2

--resume-yield交换数据
co2=coroutine.create(function (a,b,c)
    print("co2",a,b,c)
end)
coroutine.resume(co2,1,2,3) --co2   1   2   3

--第一个值为true则表示没有错误，而后面所有的值都是对应yield传入的参数
co3=coroutine.create(function (a,b)
    coroutine.yield(a+b,a-b)
end)
print(coroutine.resume(co3,20,10))   --true,30,10

co4=coroutine.create(function ()
    print("co4",coroutine.yield())
end)
print(coroutine.status(co4))    --suspended
coroutine.resume(co4)
print(coroutine.status(co4))    --suspended
coroutine.resume(co4,4,5)   --co4   4   5
print(coroutine.status(co4))    --dead

co5=coroutine.create(function ()
    return 6,7
end)
print(coroutine.status(co5))    --suspended
print(coroutine.resume(co5))    --true  6   7
print(coroutine.status(co5))    --dead

]]

--管道与过滤器
function receive(prod)
    local status,value=coroutine.resume(prod)
    return value
end

function send(x)
    coroutine.yield(x)
end

function producer()
    return coroutine.create(function ()
        while true do
            local x=io.read()   --产生新值
            send(x)
        end
    end)
end

function filter(prod)
    return coroutine.create(function ()
        for line = 1, math.huge do
            local x=receive(prod)   --获取新值
            x=string.format("%5d %s",line,x)
            send(x) --将新值发给消费者
        end
    end)
end

function consumer(prod)
    while true do
        local x=receive(prod)   --获取新值
        io.write(x,"\n")    --消费新值
    end
end

p=producer()
f=filter(p)
consumer(f)

--等价于consumer(filter(producer()))

