require './spec/spec_helper'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists and has attributes' do
    enigma = Enigma.new
    expect(enigma).to be_a(Enigma)
    expect(enigma.character_set.length).to eq(27)
    expect(enigma.character_set.class).to eq(Array)
  end

  it 'can encrypt when given a date and a key' do
    enigma = Enigma.new
    allow(enigma).to receive(:current_date).and_return("060821")
    allow(enigma).to receive(:random_key).and_return("36346")

    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }

    expected2 = {
                encryption: "keder ohulw!",
                key: "02715",
                date: "040895"
              }

    expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    expect(enigma.encrypt("jamie pace", "01030", "050821")[:encryption]).to eq("oktmjjweho")
    expect(enigma.encrypt("hello world!", "02715", "040895")).to eq(expected2)
  end

  it 'can encrypt with a given key and current date' do
    enigma = Enigma.new
    allow(enigma).to receive(:current_date).and_return("060821")

    expected = {:date=>"060821",
                :encryption=>"12ropyduzjclyeciau",
                :key=>"21688"
              }
    expect(enigma.encrypt("12 Grimmauld Place", "21688")).to eq(expected)
  end


  it 'can encrypt with a random key and current date' do
    enigma = Enigma.new
    allow(enigma).to receive(:current_date).and_return("060821")
    allow(enigma).to receive(:random_key).and_return("36346")

    expected = {:date=>"060821",
                :encryption=>"12k drxfncwxmywupn",
                :key=>"36346"
              }
    expect(enigma.encrypt("12 Grimmauld Place")).to eq(expected)
  end

  it 'can decrypt a message' do
    enigma = Enigma.new

    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
              }
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
  end

  it 'can decrypt a message with a key and current date' do
    enigma = Enigma.new
    encrypted = enigma.encrypt("12 Grimmauld Place", "21688")
    allow(enigma).to receive(:current_date).and_return("060821")

    expected = {:date=>"060821",
                :decryption=>"12 grimmauld place",
                :key=>"21688"
              }

    expect(enigma.decrypt(encrypted[:encryption], "21688")).to eq (expected)
  end

  it 'encrypts new letters based on shifts' do
    enigma = Enigma.new
    expected = {:date=>"040895",
                :encryption=>"keder ohulw",
                :key=>"02715"
              }

    expect(enigma.encrypt_letters(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], [3, 27, 73, 20], "02715", "040895")).to eq(expected)
  end

  it 'decrypts based on shifts' do
    enigma = Enigma.new
    expected = {:date=>"040895",
                :decryption=>"hello world",
                :key=>"02715"
              }

    expect(enigma.decrypt_letters(["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"], [3, 27, 73, 20], "02715", "040895")).to eq (expected)
  end

  it 'can return current date in correct format' do
    enigma = Enigma.new

    expect(enigma.current_date.length).to eq(6)
    expect(enigma.current_date.class).to eq(String)
  end

  it 'can create a random key' do
    enigma = Enigma.new
    expect(enigma.random_key).to be_a(String)
    expect(enigma.random_key.length).to eq(5)
  end

  it 'creates a key shift' do
    enigma = Enigma.new

    expect(enigma.key_shift("01010")).to eq([01, 10, 01, 10])
    expect(enigma.key_shift("02715")).to eq([02, 27, 71, 15])
  end

  it 'creates a offset shift' do
    enigma = Enigma.new

    expect(enigma.offset_shift("050821")).to eq([4, 0, 4, 1])
    expect(enigma.offset_shift("040895")).to eq([1, 0, 2, 5])
  end

  it 'combines the shifts together' do
    enigma = Enigma.new

    expect(enigma.total_shift([01, 10, 01, 10], [4, 0, 4, 1])).to eq([5, 10, 5, 11])
    expect(enigma.total_shift([02, 27, 71, 15], [1, 0, 2, 5])).to eq([3, 27, 73, 20])
  end
end
