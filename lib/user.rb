# frozen_string_literal: true

require 'date'
class User
  attr_reader :name, :date_of_birth

  DAYS_IN_YEAR = 365 # 365.2425, use int to truncate output
  def initialize(name, date_of_birth)
    @name = name
    @date_of_birth = date_of_birth
  end

  def age
    age_in_years = age_conversion_to_rational.to_i / DAYS_IN_YEAR
    return age_in_years / 4 if leap_year?

    age_in_years
  end

  def next_birthday
    d = date_of_birth
    return Date.new(Date.today.year + 4, d.month, d.day) if had_birthday_this_year? && leap_year?
    return Date.new(Date.today.year + 1, d.month, d.day) if had_birthday_this_year?
    return Date.new(next_leap_year, d.month, d.day) if leap_year?

    Date.new(Date.today.year, d.month, d.day)
  end

  private

  def age_conversion_to_rational
    Date.today - date_of_birth
  end

  def had_birthday_this_year?
    d = date_of_birth
    birthday = Date.today - Date.new(Date.today.year, d.month, d.day)
    birthday >= 0
  end

  def leap_year?
    d = date_of_birth
    return true if d.day == 29 && d.month == 2

    false
  end

  def next_leap_year
    d = Date.today.year
    loop do
      d += 1
      return d if Date.new(d, 1, 1).leap?
    end
  end
end

