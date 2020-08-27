--第七章——迭代器
--[[
--迭代器与closure

function values(t)
    local i=0
    return function ()
        i=i+1
        return t[i]
    end
end

t={10,20,30}
--迭代器遍历
iter=values(t)  --创建迭代器
while true do
    local element=iter()    --调用迭代器
    if element==nil then
        break
    end
    print(element)
end

--泛型for遍历
for element in values(t) do
    print(element)
end

--遍历文件的单词
function allwords()
    local line=io.read()    --当前行
    local pos=1 --一行中的当前位置
    return function ()  --迭代器函数
        while line do   --若为有效的行内容就进入循环
            local s,e=string.find(line,"%w+",pos)
            if s then   --是否找到一个单词
                pos=e+1 --该单词的下一个位置
                return string.sub(line,s,e) --返回该单词
            else
                line=io.read()  --没有找到单词，尝试下一行
                pos=1   --在第一个位置上重新开始
            end
        end
        return nil  --没有其余行了，遍历结束
    end
end

for word in allwords() do
    print(word)
end

]]

--[[
--无状态的迭代器（自身不保存任何状态的迭代器，可以在多个循环中使用同一个无状态的迭代器，避免创建新的closure开销）
--例如ipairs
a={"one","two","three"}
for i,v in ipairs(a) do
    print(i,v)
end

--ipairs迭代器
local function iter(a,i)
    i=i+1
    local v=a[i]
    if v then
        return i,v
    end
end

function ipairs(a)
    return iter,a,0
end

t={10,8,6,4}
local x,y=ipairs(t)
print(y[1])

--do .. in  pairs(t) 的另一种写法
for key, value in next,t do
    print(key,value)
end

--遍历链表的迭代器
local function getNext(list,node)
    if not node then
        return list
    else
        return node.next
    end
end

function traverse(list)
    return getNext,list,nil
end

list=nil
for line in io.lines() do
    list={
        val=line,
        next=list
    }
end

for node in traverse(list)  do
    print(node.val)
end

]]

--具有复杂状态的迭代器
local iterator

function allwords()
    local state={
        line=io.read(),
        pos=1
    }
    return iterator,state
end

function iterator(state)
    while state.line do --若为有效的行内容就进入循环
        --搜索下一个单词
        local s,e=string.find(state.line,"%w+",state.pos)
        if s then   --找到了一个单词
            state.pos=e+1   --更新下一个位置
            return string.sub(state.line,s,e)
        else
            state.line=io.read()    --尝试下一行
            state.pos=1 --从第一个位置开始
        end
    end
    return nil  --没有更多行了，结束循环
end

