# frozen_string_literal: true

require 'date'
require 'colorize'
# class for calculation of yearly weather
class Yearlyweather
  attr_reader :maximum_temp

  def initialize(file_names, year)
    @year = year
    @file_names = file_names
    first_record = File.readlines(file_names[0])[2].split(',')
    @maximum_temp = []
    @minimum_temp = []
    @highest_humidity = []
    @maximum_temp << first_record[1].to_i
    @maximum_temp << first_record[0]
    @minimum_temp << first_record[3].to_i
    @minimum_temp << first_record[0]
    @highest_humidity << first_record[7].to_i
    @highest_humidity << first_record[0]
  end

  def obtain_maximum_temp
    @file_names.each do |file|
      File.readlines(file).each do |line|
        next unless line.include?(@year)

        maximum_temp = line.split(',')[1].to_i
        if maximum_temp > @maximum_temp[0]
          @maximum_temp[0] = maximum_temp
          @maximum_temp[1] = line.split(',')[0]
        end
      end
    end
    @maximum_temp
  end

  def obtain_minimum_temp
    @file_names.each do |file|
      File.readlines(file).each do |line|
        next unless line.include?(@year)

        minimum_temp = line.split(',')[3].to_i
        if minimum_temp < @minimum_temp[0]
          @minimum_temp[0] = minimum_temp
          @minimum_temp[1] = line.split(',')[0]
        end
      end
    end
    @minimum_temp
  end

  def obtain_highest_humidity
    @file_names.each do |file|
      File.readlines(file).each do |line|
        next unless line.include?(@year)

        highest_humidity = line.split(',')[7].to_i
        if highest_humidity > @highest_humidity[0]
          @highest_humidity[0] = highest_humidity
          @highest_humidity[1] = line.split(',')[0]
        end
      end
    end
    @highest_humidity
  end

  def display
    obtain_maximum_temp
    obtain_minimum_temp
    obtain_highest_humidity
    puts("Highest: #{@maximum_temp[0]}C on #{Date.parse(@maximum_temp[1]).strftime('%B')} #{Date.parse(@maximum_temp[1]).day}")
    puts("Lowest: #{@minimum_temp[0]}C on #{Date.parse(@minimum_temp[1]).strftime('%B')} #{Date.parse(@minimum_temp[1]).day}")
    puts("Humid: #{@highest_humidity[0]}% on #{Date.parse(@highest_humidity[1]).strftime('%B')} #{Date.parse(@highest_humidity[1]).day}")
  end
end
