# app.rb
require_relative 'zara_store'

zara = ZaraStore.new
puts zara.welcome_message

loop do
  choice = gets.chomp.downcase

  case choice
  when 'buy'
    puts "Please type 'shirt', 'pants', or 'dress' to check availability."
    item = gets.chomp.downcase
    puts zara.buy_items(item)
  when 'exit'
    puts zara.customer_interaction(choice)
    break
  else
    puts zara.customer_interaction(choice)
  end
end
