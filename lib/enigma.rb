class Enigma

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, date = current_date, key = random_key)

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
end
