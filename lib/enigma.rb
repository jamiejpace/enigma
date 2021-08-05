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
end
