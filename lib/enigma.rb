class Enigma

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key = random_key, date = current_date)
    encrypted = []
    shifts = total_shift(key_shift(key), offset_shift(date))
    letters = message.split("")
    letters.each_with_index do |letter, index|
      new_index = @character_set.index(letter) + shifts[index % 4]
      encrypted << @character_set[new_index % 27]
    end
    encrypted
  end

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
