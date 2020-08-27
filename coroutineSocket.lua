--TODO:安装socket库
require "socket"

host="www.w3.org"
file="/TR/REC-html32.html"

c=assert(socket.connect(host,80))
c:send("GET" .. file.. "HTTP/1.0\r\n\r\n")

while true do
    local s,statue,partial=c:receive(2^10)
    io.write(s or partial)
    if statue=="closed" then
        break
    end
end