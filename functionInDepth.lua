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

