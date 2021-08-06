require './lib/enigma'

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

enigma = Enigma.new
hash = eval(incoming_text)
decrypted_message = enigma.decrypt(hash[:encryption], ARGV[2], ARGV[3])
puts "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and date #{
decrypted_message[:date]}"

writer = File.open(ARGV[1], "w")
writer.write(decrypted_message)
writer.close
