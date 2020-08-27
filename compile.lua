--第八章——编译，执行与错误

-- function dofile(filename)
--     local f=assert(loadfile(filename))
--     return f()
-- end

--[[
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

-- print "Enter your expression:"
-- local l=io.read()
-- local func=assert(loadstring("return " .. l))
-- print("the value of your expression is " .. func())

-- print "enter funciton to be plotted (with variable 'x'):"
-- local l=io.read()
-- local f=assert(loadstring("local x=...;return " .. l))
-- for i = 1, 20 do
--     print(string.rep("*",f()))  --string.rep：指定次数复制一个字符串
-- end

foo=loadstring("local a=10;print(a+10)")
foo()

foo2=loadfile("compileTest.lua")    --完成编译

print(foo1) --nill
foo2()  --定义
foo1("ok")  --ok

]]

--代码
local path="/usr/local/lib/lua/5.1/socket.so"
local f=package.loadlib(path,"luaopen_socket")

