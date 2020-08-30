--第十三章——元表和元数据
--[[
--元表的基础使用
t={}
print(getmetatable(t))  --nil

t1={}
setmetatable(t,t1)
assert(getmetatable(t)==t1)

print(getmetatable("hi"))
print(getmetatable(10))
]]

--[[
--算术类的元方法
Set={}

function Set.union(a,b)
    -- if getmetatable(a)~=mt or getmetatable(b)~=mt then
    --     error("attempt to 'add' a set with a non-set value",2)
    -- end
    local res=Set.new{}
    for k in pairs(a) do
        res[k]=true
    end
    for k in pairs(b) do
        res[k]=true
    end
    return res
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
    return "{" .. table.concat(l,",") .. "}"
end

function Set.print(s)
    print(Set.tostring(s))
end

local mt={} --集合的元表

--根据参数列表中的值创建一个新的集合
function Set.new(l)
    local set={}
    setmetatable(set,mt)
    for _,v in ipairs(l) do
        set[v]=true
    end
    return set
end

mt.__add=Set.union
mt.__mul=Set.intersection
mt.__tostring=Set.tostring
--[[
s1=Set.new{10,20,30,50}
s2=Set.new{30,1}
print(getmetatable(s1))
print(getmetatable(s2))


s3=s1+s2
Set.print(s3)    --s1和s2的并集 1,20,30,10,50
Set.print(s3*s1)   --s3和s1的交集 20,50,30,10
]]

--[[
--关系类的元方法
mt.__le=function (a,b)--集合包含
    for k in pairs(a) do
        if not b[k] then
            return false
        end
    end
    return true
end

mt.__lt=function (a,b)
    return a<=b and not(b<=a)
end

mt.__eq=function (a,b)
    return a<=b and b<=a
end

--比较集合
s1=Set.new{2,4}
s2=Set.new{4,10,2}
print(s1<=s2)   --true
print(s1<s2)    --true
print(s1>=s1)   --true
print(s1>s1)    --false
print(s1==s2*s1)    --true

--库定义的元方法
print({})

s3=Set.new{10,20,30}
print(s3)

mt.__metatable="not your business"

s4=Set.new{}
print(getmetatable(s4)) --not your business
setmetatable(s4,{})

]]

--table访问的元方法
--[[
--__index的元方法
Window={}   --创建一个名字空间
--使用默认值来创建一个原型
Window.prototype={x=0,y=0,width=100,height=100}
Window.mt={}    --创建元表
--声明构造函数
function Window.new(o)
    setmetatable(o,Window.mt)
    return o
end

Window.mt.__index=Window.prototype

w=Window.new{x=10,y=20}
print(w.width)
]]

--__newindex的元方法
--用于table的更新

--具有默认值的table
--方式1：
function setDefault(t,d)
    local mt={__index=function ()
        return d
    end}
    setmetatable(t,mt)
end

--方式2：
local mt={__index=function (t)
    return t.___
end}

function setDefault1(t,d)
    t.___=d
    setmetatable(t,mt)
end

--方式3
local key={}
local mt={__index=function (t)
    return t[key]
end}

function setDefault2(t,d)
    t[key]=d
    setmetatable(t,mt)
end

--使用调试
tab={x=10,y=20}
print(tab.x,tab.z)  --10    nil
setDefault(tab,2)
print(tab.x,tab.z)  --10    2

