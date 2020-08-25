a={}    --创建一个table，并将它的引用存储到a
k="x"
a[k]=10 --新条目，key="x",value=10
a[20]="great"   --新条目，key=20,value="great"
print(a["x"])   --10
k=20
print(a[k]) --"great"
a["x"]=a["x"]+5 --递增条目"x"
print(a["x"])   --15

