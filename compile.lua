--第八章——编译，执行与错误

-- function dofile(filename)
--     local f=assert(loadfile(filename))
--     return f()
-- end

--loadstring()函数：用来执行外部代码，返回值是function，如果load失败，则返回nil
i=1
local i=0
f=loadstring("i=i+1;print(i)")
g=function ()
    i=i+1
    print(i)
end

f() --2 操作全局i
g() --1 操作局部i