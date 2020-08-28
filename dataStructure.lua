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

--[[
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

]]

--[[
--集合
--方式1：
reserved={
    ["while"]=true,
    ["end"]=true,
    ["function"]=true,
    ["local"]=true,
}

--方式2：
function Set(list)
    local set={}
    for _,l in ipairs(list) do
        set[l]=true
    end
    return set
end

reserved=Set{"while","end","function","local",}

--多重集合
--插入一个元素，需要递增其计数器
function insert(bag,element)
    bag[element]=(bag[element] or 0)+1
end

--删除一个元素，需要递减其计数器
function remove(bag,element)
    local count=bag[element]
    bag[element]=(count and count>1) and count-1 or nil
end

]]

--[[
--字符串缓冲
--Java/C#的StringBuffer
-- local buff=""
-- for line in io.lines() do
--     buff=buff .. line .. "\n"
-- end

local t={}
for line in io.lines() do
    t[#t+1]=line
end
local s=table.concat(t,"\n").."\n"
print(s)
]]

--图
local function name2node(graph,name)
    if not graph[name] then
        --节点不存在，创建一个新的
        graph[name]={name=name,adj={}}
    end
    return graph[name]
end

function readgraph()
    local graph={}
    for line in io.lines() do
        --切分行中的两个名称
        local namefrom,nameto=string.match(line,"(%S+)%s=(%S+)")
        --查找相应的结点
        local from=name2node(graph,namefrom)
        local to=name2node(graph,nameto)
        --将'to'添加到'from'的邻接集合
        from.adj[to]=true
    end
    return graph
end

function findpath(curr,to,path,visited)
    path=path or {}
    visited=visited or {}
    if visited[curr] then   --结点是否已访问过？
        return nil  --这里没有路径
    end
    visited[curr]=true  --将结点标记为已访问过
    path[#path+1] = curr    --将其加到路径中
    if curr==to then    --最后的结点吗
        return path
    end
    --尝试所有的邻接节点
    for node in pairs(curr.adj) do
        local p=findpath(node,to,path,visited)
        if p then
            return p
        end
    end
    path[#path]=nil --从路径中删除结点
end

function printpath(path)
    for i = 1, #path do
        print(path[i].name)
    end
end

g=readgraph()
a=name2node(g,"a")
b=name2node(g,"b")
p=findpath(a,b)
if p then
    printpath(p)
end