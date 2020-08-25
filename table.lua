-- a={}    --创建一个table，并将它的引用存储到a
-- k="x"
-- a[k]=10 --新条目，key="x",value=10
-- a[20]="great"   --新条目，key=20,value="great"
-- print(a["x"])   --10
-- k=20
-- print(a[k]) --"great"
-- a["x"]=a["x"]+5 --递增条目"x"
-- print(a["x"])   --15

-- a={}
-- a["x"]=10
-- b=a --b与a引用了同一个table
-- print(b["x"])   --10
-- b["x"]=20
-- print(a["x"])   --20
-- a=nil   --现在只有b还在引用table
-- print(b["x"]+2) --22
-- b=nil   --b也没有table的引用了

-- a={}
-- for i = 1, 1000 do
--     a[i]=i*2
-- end
-- print(#a)   --1000
-- print(a[9])
-- a["x"]=10
-- print(a["x"])   --10  ==print(a.x)
-- print(a["y"])   --nil  ==print(a.y)

-- b={}
-- x="y"   --a[x]=10
-- a[x]=10 --把10放入字段"y"   ==a["y"]=10
-- print(a[x]) --a["y"]
-- print(a.x)  --a["x"]=nil
-- print(a.y)  --a["y"]

--读取10行内容，并存储到一个table中
a={}
for i = 1, 10 do
    a[i]=io.read()
end

--#a来获取到a的长度，打印所有的行
for i = 1, #a do
    print(a[i])
end

print(a[#a])    --打印列表a的最后一个值
a[#a]=nil   --删除最后一个值
a[#a+1]=v   --将v添加到列表末尾
print(a[#a+1])

--另一种方法读取一个文件的前10行
b={}
for i = 1, 10 do
    b[#b+1] = io.read();    --#b是因为开始时b的长度为0，所以[#b+1]与上面a[1]是一致的
end

