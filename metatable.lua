--第十三章——元表和元数据
--元表的基础使用
t={}
print(getmetatable(t))  --nil

t1={}
setmetatable(t,t1)
assert(getmetatable(t)==t1)

print(getmetatable("hi"))
print(getmetatable(10))

--算术类的元方法
Set={}

--根据参数列表中的值创建一个新的集合
function Set.new(l)
    local set={}
    for _,v in ipairs(l) do
        set[v]=true
    end
end

function Set.union(a,b)
    local res=Set.new{}
    for k in pairs(a) do
        res[k]=true
    end
    for k in pairs(b) do
        res[k]=true
    end
end

function Set.intersection(a,b)
    local res=Set.new{}
    for k in pairs(a) do
        res[k]=b[k]
    end
    return res
end

function Set.tostring(set)
    local l={}  --用于存放集合中所有元素的列表
    for e in pairs(set) do
        l[#l+1]=e
    end
    return "{"..table.concat(l,",").."}"
end

function Set.print(s)
    print(Set.tostring(s))
end

local mt={} --集合的元表


