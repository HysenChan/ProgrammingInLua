-- x=math.pi
-- print(x%1)  --0.14159265358979
-- print(x-x%1)    --3.0
-- print(x-x%0.01) --3.14

--角度
-- local tolerance=10
-- function isturnback(angle)
--     angle=angle%360
--     return (math.abs(angle-180)<tolerance)
-- end

--弧度
-- local tolerance=10*math.pi/180
-- print(tolerance)
-- function isturnback(angle)
--     angle=angle%(2*math.pi) --angle%(2*math.pi)就是把任意角度规范化为区间[0,2pi]
--     return (math.abs(angle-math.pi)<tolerance)
-- end

-- print(isturnback(120))
-- print(isturnback(-180))
-- print(isturnback(190))

-- 只有false和nil为假，其余都为真
-- print(0 and 2)  --2 --and:第一个为假才返回0，否则返回2
-- print(a and 2)  --nil
-- print(0 or 2)   --0 --or:第一个为真才返回0，否则返回2
-- print(a or 2)   --2

-- x=1;y=2
-- print(x==x or v)
-- --等价于
-- if not x then
--     x=v
-- end

-- max=(x>y) and x or y
-- print(max)  --2

--操作符not永远只返回true或false
-- print(not nil)  --ture
-- print(not false) --true
-- print(not 0)    --false
-- print(not not 0)    --true
-- print(not not nil) --false

--使用 .. 进行拼接字符串
-- print("Hello" .. "World")   -->Hello World
-- print(0 .. 1)   -->01
-- print(0 .. "H" .. "W")  --0HW

--不会对原操作数进行修改
-- a="Hello"
-- print(a .. "World") --Hello World
-- print(a)    --Hello

--"^"和".."是”右结合“的，如果不确定优先级，可以使用括号来达到期望运算次序
-- x=2;y=2;z=3

-- print(-x^2) --4.0
-- print(-(x^2))   --4.0

-- print(x^y^z)    --256.0
-- print(x^(y^z))  --256.0

--table构造式
-- w={x=0,y=0,lable="console"}
-- z={math.sin(0),math.sin(1),math.sin(2)}
-- w[1]="another field"    --添加key1到table w
-- z.f=w   --添加key "f"到table z
-- print(w[x]) --nil
-- print(w["x"])   --0
-- print(w[1]) --another field
-- print(z.f[1])   --another field
-- w.x=nil --删除a["x"]

-- list = nil
-- for line in io.lines() do
--     list = {
--         next = list,
--         value = line
--     }
-- end

-- local l = list
-- while l do
--     print(l.value)
--     l = l.next
-- end

-- polyline={
--     color="blue",thickness=2,
--     npoints=4,
--     {x=0,y=0},
--     {x=-10,y=0},
--     {x=-10,y=2},
--     {x=30,y=1}
-- }

-- print(polyline.color) --blue
-- print(polyline["color"])    --blue
-- print(polyline[1].y)    --0
-- print(polyline[2].x)    --10
-- print(polyline[4].x)    --30

-- opnames={
--     ["+"]="add",
--     ["-"]="sub",
--     ["*"]="mul",
--     ["/"]="div",
-- }

-- i=20;s="-"
-- a={
--     [i+0]=s,
--     [i+1]=s..s,
--     [i+2]=s..s..s
-- }

-- print(opnames[s])   -->sub
-- print(opnames["/"]) -->div
-- print(a[22])    -->---

--多重赋值的使用
-- a,b=10,20
-- print(a,b)  --10    20
-- a,b=b,a --交换a与b
-- print(a,b)  --20    10

-- x,y,z=0,1
-- print(x,y,z)    --0   1  nil
-- x,y=4,5,6
-- print(x,y,z)    --4   5  nil
-- x,y,z=10
-- print(x,y,z)    --10   nil   nil

--局部变量与块（block）
-- i=1 --全局变量
-- local j=2   --局部变量

-- x=10
-- local i=1

-- while i<=x do
--     local x=i*2
--     print(x)
--     i=i+1
-- end

-- print("----------")

-- if i>10 then
--     local x
--     x=20
--     print(x+2)  --22
-- else
--     print(x)
-- end

-- print(x)    --10

-- local a,b=1,2
-- if a<b then
--     print(a)    --1
--     local a
--     print(a)    --nil
-- end
-- print(a,b)  --1 2

-- --创建了一个局部变量foo，并将全局变量foo的初始化它；
-- --目的：先保存一份局部foo的值，防止后续其他函数改变了全局foo的值
-- local foo=foo

--控制结构
-- local a=-1
-- if a<0 then
--     a=0
-- end
-- print(a)    --0

-- function findMin(a,b)
--     if a<b then
--         return a
--     else
--         return b
--     end
-- end

-- local a,b=1,2
-- local min=findMin(a,b)

-- print(min)  --1

--if..then..elseif..then..end的使用
-- op=io.read()    --直接输入+ - * / ；不需要加双引号“”
-- local a,b=2,3
-- if op=="+" then
--     r=a+b
-- elseif op=="-" then
--     r=a-b
-- elseif op=="*" then
--     r=a*b
-- elseif op=="/" then
--     r=a/b
-- else
--     error("invalid operation")
-- end

-- print(r)

--while .. do .. end语句
-- local a={}
-- local i,j=1,5
-- while i<j do
--     a[i]=i
--     print(a[i])
--     i=i+1
-- end

--repeat .. until .. 语句
-- local a,b=1,5
-- repeat
--     print(a)    --1 2 3 4 5
--     a=a+1
-- until a>b

-- --打印输入的第一行不为空的内容
-- repeat
--     line=io.read()
-- until line~=""
-- print(line)

-- local x=100
-- local sqr=x/2
-- repeat
--     sqr=(sqr+x/sqr)/2
--     local error=math.abs(sqr^2-x)
-- until error<x/10000     --此处还能访问到local的error

-- print(sqr)

--数字型for
-- for i = 12,15 do    --默认步长为1
--     print(i)
-- end

-- max =i
-- print(max)  --nil

-- for i = 1, 10, 2 do     --指定后步长为2
--     print(i)
-- end

-- for i = 1, math.huge do     --不想给循环设置上限可以使用常量：math.huge
--     if (0.3*i^3-20*i^2-500>=0) then
--         print(i)
--         break
--     end
-- end

-- --在一个列表中查找一个值
-- local a={1,3,-5,4,3,7}
-- local found=nil
-- for i = 1, #a do
--     if a[i]<0 then
--         found=i
--         a[i]=nil
--         break
--     end
-- end

-- print(found)
-- print(a[found])

--泛型for
--迭代文件中每行的（io.lines)
--迭代table元素的（pairs）
--迭代数组元素的（ipairs）
--迭代字符串中单词的（string.gmatch)

--[[

--打印数组a的所有值
local a={4,3,5,2,6}
for key, value in pairs(a) do
    print("key=",key,"value=",value)
end

for key in ipairs(a) do
    print("k=",key)
end

--只会输出从1开始的key到连续的最大值，不存在key为1或者从1开始遇到断开的key，将不输出或者停止输出
local t={[5]=5,[1]=1,[4]=4,[2]=2}
for key, value in ipairs(t) do
    print(key,value)
end

local str="Hello World from Lua"
for w in string.gmatch(str,"%a+") do
    print(w)
end

days={"Monday","Tuesday","Wednessday","Thursday","Friday","Saturday","Sunday"}

--方法一：
-- revDays={["Monday"]=1,["Tuesday"]=2,["Wednessday"]=3,["Thursday"]=4,["Friday"]=5,["Saturday"]=6,["Sunday"]=7,}

--方法二：
--利用days的key作为revDays的key快速地赋值revDays表
revDays={}
for key, value in pairs(days) do
    revDays[value]=key
end

x="Thursday"
print(days[4])
 print(revDays[x])   --4

--]]

--break和return的使用
local v=2;a={1,2}
local i=1
while a[i] do
    if a[i]==v then
        break
    end
    i=i+1
end

print(i)

--do return end就是最后一条语句了
--return后面不能再执行代码了，但是可以打印print()
function foo()
    print("foo")
    do return end
    print("do return end")
    return
    print("return")
end

foo()