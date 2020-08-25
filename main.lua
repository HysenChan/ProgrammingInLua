print("Hello World");

--定义一个阶乘函数
function Fact(n)
    if n==0 then
        return 1
    else
        return n*Fact(n-1)
    end
end

print("enter a number:")
a=io.read("*number")    --读取一个数字
print(Fact(a));