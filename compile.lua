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

--[[
--代码
local path="/usr/local/lib/lua/5.1/socket.so"
local f=package.loadlib(path,"luaopen_socket")

]]

--错误
--[[
--检测输入的是否为number值
--方式1：
print "enter a number:"
n=io.read("*number")
if not n then
    error("invalid input")
end

--方式2：
--assert函数检查第一个参数是否为true，为true则简单地返回该参数，否则就引发一个错误
print "enter a number:"
n=assert(io.read("*number"),"invalid input")

]]

--输入文件名称，检测文件是否能打开
--方式1：
-- local file,msg
-- repeat
--     print "enter a file name"
--     local name=io.read()
--     if not name then
--         return
--     end
--     file,msg=io.open(name,"r")
--     if not file then
--         print(msg)
--     end
-- until file

--方式2：
-- file=assert(io.open(name,"r"))

--自定义输出错误信息
--[[
local status,err=pcall(function () 
    error({code=120})
end)
print(err.code) --120

local status,err=pcall(function ()
    a="a"+1
end)
print(err)

local status,err=pcall(function ()
    error("my error")
end)
print(err)
]]

function foo(str)
    if type(str)~="string" then
        error("string expected",2)
    end
end

foo({x=1})
print(debug.traceback())