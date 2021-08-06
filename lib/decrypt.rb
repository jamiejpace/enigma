require './lib/enigma'

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

enigma = Enigma.new
decrypted_message = enigma.decrypt(incoming_text.strip)

writer = File.open(ARGV[1], "w")
writer.write(encrypted_message)
writer.close
