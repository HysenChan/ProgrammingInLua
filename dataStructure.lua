--第十一章——数据结构
--[[
--基本数组的创建
a={}
for i = -5, 5 do
    a[i]=0
end

for key, value in pairs(a) do
    print(key,value)
end

squares={1,4,9,16,25,36,49,64,81}
print(#squares)
]]
--[[
--矩阵与多维数组
--NxM的零矩阵
--方式1：
mt={}   --创建矩阵
for i = 1, N do
    mt[i]={}    --创建一个新行
    for j = 1, M do
        mt[i][j]=0
    end
end

--方式2：
mt={}   --创建矩阵
for i = 1, N do
    mt[i]={}    --创建一个新行
    for j = 1, M do
        mt[(i-1)*M+j]=0
    end
end

function mult(a,rowindex,k)
    local row=a[rowindex]   --a这个table中的rowindex行的table
    for i,v in pairs(row) do
        row[i]=v*k  --每行都乘以一个k
    end
end
]]

--[[
--链表
list=nil    --列表头结点的变量
list={next=list,value=v}    --在表头插入一个元素，元素值为v
--遍历此列表
local l=list
while l do
    print(l.value)
    l=l.next
end
]]

--队列与双向队列
--方式1：
-- function ListNew()
--     return {first=0,last=-1}
-- end

--方式2：
List={}
function List.new()
    return {first=0,last=-1}
end

function List.pushFirst(list,value)
    local first=list.first-1
    list.first=first
    list[first]=value
end

function List.pushLast(list,value)
    local last=list.last+1
    list.last=last
    list[last]=value
end

function List.popFirst(list)
    local first=list.first
    if first>list.last then
        error("list is empty")
    end
    local value=list[first]
    list[first]=nil --为了允许垃圾收集
    list.first=first+1
    return value
end

function List.popLast(list)
    local last=list.last
    if list.first>last then
        error("list is empty")
    end
    local value=list[last]
    list[last]=nil  --为了允许垃圾收集
    list.last=last-1
    return value;
end

a=List.new()
List.pushFirst(a,5)
List.pushLast(a,10)

