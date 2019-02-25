require './lib/enigma'

handle = File.open(ARGV[0], "r")
message = handle.read
handle.close

enigma = Enigma.new
enigma.encrypt(message)
encrypted = enigma.encrypted[:encryption]

writer = File.open(ARGV[1], "w")
writer.write(encrypted)
writer.close

puts "Created '#{ARGV[1]}' with key #{enigma.encrypted[:key]} and date #{enigma.encrypted[:date]}"
