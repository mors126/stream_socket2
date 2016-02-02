#!/usr/bin/ruby
require 'socket'
sock = UDPSocket.new
while true
  print "Enter number of msg: "
  sms = gets
  sock.send(sms, 0, 'localhost', 1234)
  if sms.include?("q")
    break
  end
  i = sms.to_i
  while i != 0
    str = sock.gets
    puts str
    i-=1
  end
end
sock.close