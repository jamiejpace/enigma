require './spec/spec_helper'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new
    expect(enigma).to be_a(Enigma)
  end

  xit 'can encrypt' do
    enigma = Enigma.new

    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }

    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
  end

  it 'can return current date in correct format' do
    enigma = Enigma.new

    expect(enigma.current_date).to eq("050821")
  end

  it 'can create a random key' do
    enigma = Enigma.new
    expect(enigma.random_key).to be_a(String)
    expect(enigma.random_key.length).to eq(5)
  end

  it 'creates a key shift' do
    enigma = Enigma.new

    expect(enigma.key_shift("01010")).to eq([01, 10, 01, 10])
  end

  it 'creates a offset shift' do
    enigma = Enigma.new

    expect(enigma.offset_shift("050821")).to eq([4, 0, 4, 1])
  end

  it 'combines the shifts together' do
    enigma = Enigma.new

    expect(enigma.total_shift([01, 10, 01, 10], [4, 0, 4, 1])).to eq([5, 10, 5, 11])
  end
end
