-- a={}    --创建一个table，并将它的引用存储到a
-- k="x"
-- a[k]=10 --新条目，key="x",value=10
-- a[20]="great"   --新条目，key=20,value="great"
-- print(a["x"])   --10
-- k=20
-- print(a[k]) --"great"
-- a["x"]=a["x"]+5 --递增条目"x"
-- print(a["x"])   --15

a={}
a["x"]=10
b=a --b与a引用了同一个table
print(b["x"])   --10
b["x"]=20
print(a["x"])   --20
a=nil   --现在只有b还在引用table
print(b["x"]+2) --22
b=nil   --b也没有table的引用了

