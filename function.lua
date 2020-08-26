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
local b={1,2,3,4,5}
function add(a)
    local sum=0
    for i,v in ipairs(a) do
        print(i,v)
        sum=sum+v
    end
    print(sum)  --15
end

add(b)

--当实参数>形参数   -舍弃多余的实参
--当实参数<形参数   -多余形参初始nil
function f(x,y)
    print(x,y)
    return x or y
end

f(3)    --3     nil
f(3,4)  --3     4
f(3,4,5)    --3     4

function incCount(n)
    n = n or 1
    count=count+n
end

incCount(1)

