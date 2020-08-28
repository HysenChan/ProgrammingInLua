--第十一章——数据结构

--基本数组的创建
a={}
for i = -5, 5 do
    a[i]=0
end

for key, value in pairs(a) do
    print(key,value)
end

squares={1,4,9,16,25,36,49,64,81}
print(#squares)
