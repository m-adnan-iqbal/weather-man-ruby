# frozen_string_literal: true

require 'date'
require 'colorize'
# class for calculating monthly weather
class Monthlyweather
  def initialize(file_names, year)
    @year = year
    @file_names = file_names
    @average_max_temp = 0
    @average_min_temp = 0
    @average_humidity = 0
  end

  def obtain_average_max_temp
    @file_names.each do |file|
      divisor = 0
      File.readlines(file).each do |line|
        if line.include?(@year)
          divisor += 1
          @average_max_temp += line.split(',')[1].to_i
        end
      end
      @average_max_temp /= divisor
    end
    @average_max_temp
  end

  def obtain_average_min_temp
    @file_names.each do |file|
      divisor = 0
      File.readlines(file).each do |line|
        if line.include?(@year)
          divisor += 1
          @average_min_temp += line.split(',')[3].to_i
        end
      end
      @average_min_temp /= divisor
    end
    @average_min_temp
  end

  def obtain_average_humidity
    @file_names.each do |file|
      divisor = 0
      File.readlines(file).each do |line|
        if line.include?(@year)
          divisor += 1
          @average_humidity += line.split(',')[8].to_i
        end
      end
      @average_humidity /= divisor
    end
    @average_humidity
  end

  def display
    obtain_average_max_temp
    obtain_average_min_temp
    obtain_average_humidity
    puts("Highest Average: #{@average_max_temp}C")
    puts("Lowest Average: #{@average_min_temp}C")
    puts("Average Humid: #{@average_humidity}%")
  end
end
