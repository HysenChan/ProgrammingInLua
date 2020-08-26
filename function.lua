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

polyline={
    color="blue",thickness=2,
    npoints=4,
    {x=0,y=0},
    {x=-10,y=0},
    {x=-10,y=2},
    {x=30,y=1}
}

print(polyline.color) --blue
print(polyline["color"])    --blue
print(polyline[1].y)    --0
print(polyline[2].x)    --10
print(polyline[4].x)    --30

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

