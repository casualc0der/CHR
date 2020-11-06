#!/usr/bin/env ruby

require_relative '../lib/user'

tests = [
    Date.new(1986, 1, 1),
    Date.new(1988, Date.today.month, Date.today.day),
    Date.new(1990, 12, 30)
]
puts '====== ages ======'
tests.each do |date|
  puts "#{date} => #{User.new('Test', date).age}"
end
puts '====== birthdays ======'
tests.each do |date|
  puts "#{date} => #{User.new('Test', date).next_birthday}"
end