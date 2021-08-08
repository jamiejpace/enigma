require 'date'
require './helpable'

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

  # def encrypt(message, key = random_key, date = current_date)
  #   encrypted = {:encryption => "", :key => key, :date => date}
  #   shifts = total_shift(key_shift(key), offset_shift(date))
  #   letters = message.downcase.split("")
  #   letters.each_with_index do |letter, index|
  #     if @character_set.index(letter).nil?
  #       encrypted[:encryption] << letter
  #     else
  #       new_index = @character_set.index(letter) + shifts[index % 4]
  #       encrypted[:encryption] += @character_set[new_index % 27]
  #     end
  #   end
  #   encrypted
  # end

  def decrypt(ciphertext, key, date = current_date)
    decrypted = {:decryption => "", :key => key, :date => date}
    shifts = total_shift(key_shift(key), offset_shift(date))
    letters = ciphertext.downcase.split("")
    letters.each_with_index do |letter, index|
      if @character_set.index(letter).nil?
        decrypted[:decryption] << letter
      else
        new_index = @character_set.index(letter) - shifts[index % 4]
        decrypted[:decryption] += @character_set[new_index % 27]
      end
    end
    decrypted
  end
end
