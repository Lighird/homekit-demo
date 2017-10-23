pin = 0
gpio.mode(0, gpio.INPUT)
gpio.write(0, gpio.HIGH)

-- print IP address
ip = wifi.sta.getip()
print(ip)

-- Configure the ESP as a station (client)
wifi.setmode(wifi.STATION)
wifi.sta.config("ChinaNet-xiaobai", "13860461743")
wifi.sta.autoconnect(1)
tmr.alarm(1, 1000, 1, function()
     if wifi.sta.getip() == nil then
         print("Connecting...")
     else
         tmr.stop(1)
         print("Connected, IP is "..wifi.sta.getip())
     end
end)



-- Create a server
server = net.createServer(net.TCP, 60)

-- Server listen on 80
-- Print HTTP headers to console
server:listen(80, function(c)
    c:on("receive", function(conn, payload)
        print(payload)

        if(string.find(payload, "POST /power/on") ~= nil) then
            gpio.write(pin, gpio.LOW)
        elseif(string.find(payload, "POST /power/off") ~= nil) then
            gpio.write(pin, gpio.HIGH)
        end
            
        conn:send("HTTP/1.1 200 OK\n\n")
        conn:close()
    end)
end)