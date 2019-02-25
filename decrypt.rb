require './lib/enigma'

handle = File.open(ARGV[0], "r")
encrypted = handle.read
handle.close

enigma = Enigma.new
enigma.decrypt(encrypted, ARGV[2], ARGV[3])
decrypted = enigma.decrypted[:decryption]

writer = File.open(ARGV[1], "w")
writer.write(decrypted)
writer.close

puts "Created '#{ARGV[1]}' with key #{enigma.decrypted[:key]} and date #{enigma.decrypted[:date]}"
