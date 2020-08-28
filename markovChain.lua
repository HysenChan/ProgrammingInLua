--马尔可夫链算法

function allwords()
    local line=io.read()    --当前行
    -- local line={"Constructors", "can", "also", "traverse", "a" ,"table", "constructor"}
    local pos=1 --行中的当前位置
    return function ()  --迭代器函数
        while line do   --只要还有行就一直循环
            local s,e=string.find(line,"%w+",pos)
            if s then   --找到一个单词
                pos=e+1 --更新下一个位置
                return string.sub(line,s,e) --返回该单词
            else
                line=io.read()  --没有找到单词，尝试下一行
                pos=1   --从行首位置重新开始
            end
        end
        return nil  --所有行都遍历完毕
    end
end

function prefix(w1,w2)
    return w1 .. " " .. w2
end

local statetab={}

function insert(index,value)
    local list=statetab[index]
    if list==nil then
        statetab[index]={value}
    else
        list[#list+1]=value
    end
end

local N=2
local MAXGEN=10000
local NOWORD="\n"

--构建table
local w1,w2=NOWORD,NOWORD
for w in allwords() do
    insert(prefix(w1,w2),w)
    w1=w2;w2=w;
end
insert(prefix(w1,w2),NOWORD)

--生成文本
w1=NOWORD;W2=NOWORD --重新初始化
for i = 1, MAXGEN do
    local list=statetab[prefix(w1,w2)]
    --从列表中选择一个随机项
    local r=math.random(#list)
    local nextword=list[r]
    if nextword==NOWORD then
        return
    end
    io.write(nextword," ")
    w1=w2;w2=nextword
end