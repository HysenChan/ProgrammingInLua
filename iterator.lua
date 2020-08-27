--第七章——迭代器
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

