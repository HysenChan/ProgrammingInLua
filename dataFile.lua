--第十二章——数据文件

--[[
local count=0
function Entry(_)
    count=count+1
end
dofile("data.lua")
print("number of entries:"..count)

local authors={}    --作者姓名的集合
function Entry(b)
    if b.author then
        authors[b.author]=true
    end
end
dofile("data.lua")
for name in pairs(authors) do
    print(name)
end

]]

--串行化
function serialize(o)
    if type(o)=="number" then   --对于一个数字值，如果是字符串值：type(o)=="string"
        io.write(o)
    elseif type(o)=="string" then
        io.write(string.format("%q",o))
    else
        print("nil")
    end
end

a='a "problematic" \\string'
serialize(a)

function quote(s)
    --查找最长的等号序列
    local n=-1
    for w in string.gmatch(s,"]=*") do
        n=math.max(n,#w-1)
    end
    --产生'n'+1个等号
    local eq=string.rep("=",n+1)

    --生成长字符串的字面表示
    return string.format(" [&s[\n%s]%s ",eq,s,eq)
end