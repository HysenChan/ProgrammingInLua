--第六章——深入函数
--[[
--函数作为类值，赋值使用
a={p=print}
a.p("Hello World")
print=math.sin  --print 现在引用了正弦函数
a.p(print(1))   --0.8414709848079
sin=a.p --sin   现在引用了print函数
sin(10,20)  --10,20

]]

--[[
network={
    {name="grauna",IP="210,26.30.34"},
    {name="arraial",IP="210,26.30.23"},
    {name="lua",IP="210,26.23,12"},
    {name="derain",IP="210,26.23,20"},
}

function printNetwork()
    for key,value in pairs(network) do
        print(key,value.IP,value.name)
    end
end

printNetwork()

--按照名称顺序排序
-- table.sort(network,function (a,b)
--     return (a.name<b.name)
-- end)

--按照IP从小到大排序
table.sort(network,function (x,y)
    return (x.IP<y.IP)
end)

print("-----Sort-----")
printNetwork()

--高阶函数
function derivative(f,delta)
    delta=delta or 1e-4
    return function (x)
        print((f(x+delta)-f(x))/delta)
        return (f(x+delta)-f(x))/delta
    end
end

c=derivative(math.sin)
print(math.cos(10),c(10))

]]

--[[
--closure闭合函数
names={"Peter","Paul","Mary"}
grades={Mary=10,Paul=7,Peter=8}

function soryByGrade(names,grades)
    table.sort(names,function (n1,n2)
        return grades[n1]<grades[n2]    --比较年级
    end)
end

soryByGrade(names,grades)

for key, value in pairs(names) do
    print(key,value)
end

function newCounter()
    local i=0
    return function ()
        i=i+1
        return i
    end
end

--c1和c2是同一个函数所创建的两个不同的colsure，它们各自拥有局部变量i的独立实例
c1=newCounter()
print(c1()) --1
print(c1()) --2
c2=newCounter()
print(c2()) --1
print(c1()) --3
print(c2()) --2

-- function digitButton(digit)
--     return Button{
--         label=tostring(digit),
--         action=function ()
--             add_to_display(digit)
--         end
--     }
-- end

--重写math.sin使用度来表示
print(math.sin(20)) --原型  0.91294525072763
oldSin=math.sin
math.sin=function (x)
    return oldSin(x*math.pi/180)
end

print(math.sin(20)) --度   0.34202014332567
print(oldSin(20))   --弧度  0.91294525072763

]]

--非全局的函数
--方式1：
Lib={}
Lib.foo=function (x,y)
    return x+y
end
Lib.goo=function (x,y)
    return x-y
end

--方式2：
Lib={
    foo=function (x,y)
        return x+y
    end,
    goo=function (x,y)
        return x-y
    end
}

--方式3：
Lib={}
function Lib.foo(x,y)
    return x+y
end
function Lib.goo(x,y)
    return x-y
end

