# frozen_string_literal: true

require 'date'
require 'colorize'

# class for creating monthly weather charts
class Monthlychart
  def initialize(file_names, year)
    @year = year
    @file_names = file_names
    @extreme_temperatures = []
  end

  def obtain_extreme_temperature
    @file_names.each do |file|
      File.readlines(file).each do |line|
        next unless line.include?(@year)

        extremes = []
        extremes << line.split(',')[3].to_i
        extremes << line.split(',')[1].to_i
        @extreme_temperatures << extremes
      end
    end
    @extreme_temperatures
  end

  def display
    obtain_extreme_temperature
    day = 1
    @extreme_temperatures.each do |extremes|
      print("#{day} ")
      day += 1
      low = extremes[0]
      high = extremes[1]
      i = 0
      while i <= low
        print '+'.blue
        i += 1
      end
      puts "#{low}C "
      puts "\n"
      while i <= high
        print '+'.red
        i += 1
      end
      puts(" #{high}C")
    end
  end
end
