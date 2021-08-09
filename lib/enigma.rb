require 'date'
require './lib/helpable'

class Enigma
  include Helpable

  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key = random_key, date = current_date)
    shifts = total_shift(key_shift(key), offset_shift(date))
    letters = message.downcase.split("")
    encrypt_letters(letters, shifts, key, date)
  end

  def decrypt(ciphertext, key, date = current_date)
    shifts = total_shift(key_shift(key), offset_shift(date))
    letters = ciphertext.downcase.split("")
    decrypt_letters(letters, shifts, key, date)
  end
end
