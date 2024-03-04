class ZaraStore
  attr_accessor :inventory, :cart

  def initialize
    @inventory = {
      "shirt" => { availability: 3, price: 29.99 },
      "pant" => { availability: 0, price: 49.99 },
      "dress" => { availability: 10, price: 79.99 }
    }
    @cart = []
  end

  def welcome_message
    "\nWelcome to Zara!\nHow may we assist you today?"
  end

  def customer_interaction
    loop do
      puts "\nType 'buy' to start shopping or 'exit' to leave."
      choice = gets.chomp.downcase

      case choice
      when 'buy'
        buy_items_prompt
      when 'exit'
        puts "Thank you for visiting Zara. Have a great day!"
        break
      else
        puts "Invalid option. Please choose 'buy' or 'exit'."
      end
    end
  end

  def buy_items_prompt
    puts "\nPlease type 'shirt', 'pants', or 'dress' to check availability."
    item = gets.chomp.downcase
    buy_items(item)
  end

  def buy_items(item)
    if @inventory.key?(item) && @inventory[item][:availability] > 0
      check_availability(item)
    else
      puts "Sorry, we either don't have #{item} or it's out of stock."
    end
  end

  def check_availability(item)
    puts "Great choice! We have #{@inventory[item][:availability]} #{item}s available for $#{@inventory[item][:price]} each."
    puts "Would you like to add to your cart? (yes/no)"
    add_to_cart = gets.chomp.downcase

    case add_to_cart
    when 'yes'
      add_to_cart(item)
    when 'no'
      continue_shopping
    else
      puts "Invalid option. Returning to the main menu."
    end
  end

  def add_to_cart(item)
    @cart.push(item)
    puts "Thank you for your purchase!"
    continue_shopping
  end

  def continue_shopping
    puts "\nWould you like to buy something else? Please type 'shirt', 'pants', or 'dress' to check availability, or type 'exit' to leave."
    choice = gets.chomp.downcase

    case choice
    when 'shirt', 'pants', 'dress'
      check_availability(choice)
    when 'exit'
      puts "Thank you for shopping at Zara. Have a great day!"
    else
      puts "Invalid option. Returning to the main menu."
    end
  end

  def number_of_items(item)
    @inventory[item][:availability] if @inventory.key?(item)
  end
end

zara = ZaraStore.new
zara.customer_interaction
