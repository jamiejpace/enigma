require './lib/enigma'

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

enigma = Enigma.new
encrypted_message = enigma.encrypt(incoming_text.strip)

writer = File.open(ARGV[1], "w")
writer.write(encrypted_message)
writer.close
