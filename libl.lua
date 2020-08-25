function norm(x,y)
    return (x^2+y^2)^0.5
end

function twice(x)
    return 2*x
end

--[[
    print(10)   -->10
]]
n=norm(1,2)
print(twice(n))

print(b)
b=10
print(b)
b=nil
print(b)

a=print
a(type(a))