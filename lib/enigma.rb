class Enigma
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key = random_key, date = current_date)
    encrypted = {:encryption => "", :key => key, :date => date}
    shifts = total_shift(key_shift(key), offset_shift(date))
    letters = message.downcase.split("")
    letters.each_with_index do |letter, index|
      if @character_set.index(letter).nil?
        encrypted[:encryption] << letter
      else
        new_index = @character_set.index(letter) + shifts[index % 4]
        encrypted[:encryption] += @character_set[new_index % 27]
      end
    end
    encrypted
  end

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

  # def encrypt_letters(letters, shifts, hash_key)
  #   letters.each_with_index do |letter, index|
  #     if @character_set.index(letter).nil?
  #       hash_key += letter
  #     else
  #       new_index = @character_set.index(letter) + shifts[index % 4]
  #       hash_key += @character_set[new_index % 27]
  #       require 'pry'; binding.pry
  #     end
  #   end
  # end

  def current_date
    Date.today.strftime("%d%m%y")
  end

  def random_key
    5.times.map{rand(10)}.join
  end

  def key_shift(key)
    shifts = []
    shifts << key[0..1].to_i
    shifts << key[1..2].to_i
    shifts << key[2..3].to_i
    shifts << key[3..4].to_i
    shifts
  end

  def offset_shift(date)
    squared = (date.to_i) ** 2
    string_array = squared.to_s.split('')[-4..-1]
    string_array.map do |string|
      string.to_i
    end
  end

  def total_shift(keys, offsets)
    shifts = []
    shifts << keys[0] + offsets[0]
    shifts << keys[1] + offsets[1]
    shifts << keys[2] + offsets[2]
    shifts << keys[3] + offsets[3]
    shifts
  end
end
