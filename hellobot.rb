require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "AustinPowers"
channel = "#bitmaker"
greeting_prefix = "privmsg #{channel} :"
greetings = ["time"]
greetings1 = ["hello from irc bot"]
greetings2 = ["i must meditate on this"]

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
irc_server.puts "PRIVMSG #{channel} :Hello from IRC Bot"

# Hello, Bot!
until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg

  was_greeted = false
  greetings.each do |g|
    was_greeted = true if msg.include?(g)
  end

  if msg.include?(greeting_prefix) and was_greeted
  	response = "You have eyes, use them!"
  	irc_server.puts "PRIVMSG #{channel} :#{response}"
  end

  was_greeted1 = false
  greetings1.each do |h|
  was_greeted1 = true if msg.include?(h)
  end

  if msg.include?(greeting_prefix) and was_greeted1
    response1 = "I welcome a fellow friend!"
    irc_server.puts "PRIVMSG #{channel} :#{response1}"
  end

  was_greeted2 = false
  greetings2.each do |x|
  was_greeted2 = true if msg.include?(x)
  end

  if msg.include?(greeting_prefix) and was_greeted2
    response2 = "I thought monks were silent?"
    irc_server.puts "PRIVMSG #{channel} :#{response2}"
  end


end








