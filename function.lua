--第五章——函数
-- print(8*9,9/8)
-- a=math.sin(3)+math.cos(10)
-- print(a)
-- print(os.date())

--一个函数只有一个参数，并且参数是一个字面字符串或table构造式，则圆括号可有可无
-- print "Hello World" --Hello World
-- print [[a multi-line message]]  --a multi-line message
-- type{}

--冒号操作符
--调用o.foo时将o隐含地作为函数的第一个参数
-- o.foo(o,x)  --> ==o:foo(x)

--一个Lua程序既可以使用Lua编写的函数，也可以调用C语言编写的函数
-- local b={1,2,3,4,5}
-- function add(a)
--     local sum=0
--     for i,v in ipairs(a) do
--         print(i,v)
--         sum=sum+v
--     end
--     print(sum)  --15
-- end

-- add(b)

--当实参数>形参数   -舍弃多余的实参
--当实参数<形参数   -多余形参初始nil
-- function f(x,y)
--     print(x,y)
--     return x or y
-- end

-- f(3)    --3     nil
-- f(3,4)  --3     4
-- f(3,4,5)    --3     4

-- function incCount(n)
--     n = n or 1
--     count=count+n
-- end

-- incCount(1)

--多重返回值
s,e=string.find("hello Lua user","Lua")
print(s,e)  --7     9

--查找数组中的最大元素，并返回该元素的位置
function maximum(a)
    local mi=1  --最大值的索引
    local m=a[mi]   --最大值
    for i,val in ipairs(a) do
        if val>m then
            mi=i
            m=val
        end
    end
    return m,mi
end

print(maximum({8,10,23,12,5}))  --23    3

--无返回值
function foo0()
    
end

--返回1个结果
function foo1()
    return "a"
end

--返回2个结果
function foo2()
    return "a","b"
end

x=foo2()
print(x,y)  --a  nil
x,y=foo2()
print(x,y)  --a   b
x,y,z=10,foo2()
print(x,y,z)    --10    a   b
--只产生一个值
x,y=foo2(),20
print(x,y)  --a  20
x,y=foo0(),20,30
print(x,y)  --nil   20
--当函数作为另一个函数的实参时，其返回数量调整为1，即   a
print(foo2(),1)     --a     1

