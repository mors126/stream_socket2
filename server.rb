#!/usr/bin/ruby
require 'socket'
client = UDPSocket.open
puts "log: Socket created..."
client.bind('localhost', 1234)

def num (cl, n, adr)
  cc=n.to_i
  i=1
  while i<=cc
    cl.send("request number #{i}\n", 0, 'localhost', adr)
    i+=1
  end
end

while true
  data, addr = client.recvfrom(2)
  num(client, data, addr[1])
end
client.close
