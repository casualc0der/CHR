# frozen_string_literal: true

require_relative '../../lib/user'
require 'date'
RSpec.describe User do
  describe '#age' do
    context 'returns an Integer representing the user’s current age' do
      # these tests are very flaky!
      example 'who is 34 years old' do
        user = User.new('Test', Date.new(1986, 1, 1))
        expect(user.age).to eq(34)
      end
      example 'who is 32 years old' do
        user = User.new('Test', Date.new(1988, 11, 6))
        expect(user.age).to eq(32)
      end
      example 'who is 29 years old' do
        user = User.new('Test', Date.new(1990, 12, 30))
        expect(user.age).to eq(29)
      end
      example 'who is an older person' do
        user = User.new('Test', Date.new(1900, 1, 1))
        expect(user.age).to eq(120)
      end
      example 'who was born on a leap year (29/02)' do
        user = User.new('Test', Date.new(1996, 2, 29))
        expect(user.age).to eq(6)
      end
    end
  end

  describe '#next_birthday' do
    context "returns a Date object for the user's current upcoming birthday" do
      example 'who has a birthday on 1st January' do
        user = User.new('Test', Date.new(1986, 1, 1))
        expect(user.next_birthday).to eq(Date.new(2021, 1, 1))
      end
      example 'who has a birthday 6th November' do
        user = User.new('Test', Date.new(1988, 11, 6))
        expect(user.next_birthday).to eq(Date.new(2021, 11, 6))
      end
      example 'who has a birthday December 30th' do
        user = User.new('Test', Date.new(1990, 12, 30))
        expect(user.next_birthday).to eq(Date.new(2020, 12, 30))
      end
      example 'who has a birthday 29th February' do
        user = User.new('Test', Date.new(1996, 2, 29))
        expect(user.next_birthday).to eq(Date.new(2024, 2, 29))
      end
    end
  end
end
