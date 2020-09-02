--第十四章——环境

function setfield(f,v)
    local t=_G  --从全局变量的table开始
    for w,d in string.gmatch(f,"([%w_]+)(%.?)") do
        if d=="." then  --是最后一个字段吗
            t[w]=t[w] or {} --如果不存在就创建table
            t=t[w]  --获取该table
        else    --最后的字段
            t[w]=v  --完成赋值
        end
    end
end

setfield("t.x.y",10)

print(t.x.y)
print(getfield("t.x.y"))