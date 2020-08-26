--第六章——深入函数
a={p=print}
a.p("Hello World")
print=math.sin  --print 现在引用了正弦函数
a.p(print(1))   --0.8414709848079
sin=a.p --sin   现在引用了print函数
sin(10,20)  --10,20

