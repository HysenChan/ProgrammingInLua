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
    else
        print("nil")
    end
end
