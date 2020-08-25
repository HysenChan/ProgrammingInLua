a="one string"
b=string.gsub(a,"one","another")
print(a)
print(b)

-- line=io.read()
-- n=tonumber(line)
-- if n==nil then
--     error(line .. "is not a valid number")
-- else
--     print(n*2)
-- end

print(10=="10") -->false
print(tostring(10)=="10")   -->true
print(10 .. ""=="10")   -->true

print(a)
print(#a)
print(#"good\0bye")