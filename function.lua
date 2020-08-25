-- x=math.pi
-- print(x%1)  --0.14159265358979
-- print(x-x%1)    --3.0
-- print(x-x%0.01) --3.14

--角度
-- local tolerance=10
-- function isturnback(angle)
--     angle=angle%360
--     return (math.abs(angle-180)<tolerance)
-- end

--弧度
-- local tolerance=10*math.pi/180
-- print(tolerance)
-- function isturnback(angle)
--     angle=angle%(2*math.pi) --angle%(2*math.pi)就是把任意角度规范化为区间[0,2pi]
--     return (math.abs(angle-math.pi)<tolerance)
-- end

-- print(isturnback(120))
-- print(isturnback(-180))
-- print(isturnback(190))

--只有false和nil为假，其余都为真
print(0 and 2)  --2 --and:第一个为假才返回0，否则返回2
print(a and 2)  --nil
print(0 or 2)   --0 --or:第一个为真才返回0，否则返回2
print(a or 2)   --2

