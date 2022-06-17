# frozen_string_literal: true

require 'date'
require 'colorize'
require './monthlybarchart'
require './monthlyweather'
require './yearlyweather'
require './barchart'

case ARGV[0]
when '-e'
  year = ARGV[1].split('/')[0]
  file_names = Dir.glob("#{ARGV[2]}/*").select { |e| e.include?(year) }
  Yearlyweather.new(file_names, year).display
when '-a'
  year = ARGV[1].split('/')[0]
  month = Date.parse(ARGV[1]).strftime('%b')
  file_names = Dir.glob("#{ARGV[2]}/*").select { |e| (e.include?(year) && e.include?(month)) }
  Monthlyweather.new(file_names, year).display
when '-c'
  year = ARGV[1].split('/')[0]
  month = Date.parse(ARGV[1]).strftime('%b')
  file_names = Dir.glob("#{ARGV[2]}/*").select { |e| (e.include?(year) && e.include?(month)) }
  MonthlyweatherChart.new(file_names, year).display
  Monthlychart.new(file_names, year).display
end
