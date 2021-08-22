require 'nokogiri'
require 'open-uri'
require_relative 'lib/calculator'

doc = Nokogiri::XML(URI.open('https://www.cbr.ru/scripts/XML_daily.asp'))

rate = doc.xpath('//Valute[@ID="R01235"]/Value').text.gsub(",", ".").to_f

puts "Курс доллара: #{rate} руб."

puts "Сколько у вас рублей: "
rubls = STDIN.gets.to_f

puts "Сколько у вас долларов?"
dollars = STDIN.gets.to_f

calculator = Calculator.new(dollars, rubls, rate)

count_dollars = calculator.count_dollars

puts calculator.need_to_buy_dollars(count_dollars)
