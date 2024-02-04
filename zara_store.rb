class ZaraStore
  attr_accessor :inventory

  def initialize
    @inventory = {
      "shirt" => { availability: 10, price: 29.99 },
      "pants" => { availability: 5, price: 49.99 },
      "dress" => { availability: 8, price: 79.99 },
    }
  end

  def welcome_message
    puts "\n"
    puts "Welcome to Zara!"
    puts "How may we assist you today?"
    customer_interaction
  end

  def customer_interaction
    loop do
      puts "\n"
      puts "1. Check item availability"
      puts "2. Inquire about delivery"
      puts "3. Return and Exchange Policy"
      puts "4. Exit"
      puts "Choose an option: "
      choice = gets.chomp.to_i

      case choice
      when 1
        check_availability_interaction
      when 2
        inquire_about_delivery
      when 3
        return_exchange_policy
      when 4
        puts "Thank you for visiting Zara. Have a great day!"
        break
      else
        puts "Invalid option. Please choose a valid option."
      end
    end
  end

  def check_availability_interaction
    puts "\n"
    puts "What item are you interested in?"
    item = gets.chomp.downcase
    number_of_items(item)
  end

  def number_of_items(item)
    if @inventory.key?(item)
      puts "\n"
      puts "Great choice! We have #{@inventory[item][:availability]} #{item}s available."
      puts "Each #{item} costs $#{@inventory[item][:price]}."
      return @inventory[item][:availability]
    else
      puts "\n"
      puts "Sorry, we don't have #{item} in our inventory at the moment."
      return 0
    end
  end

  def inquire_about_delivery
    puts "\n"
    puts "Our standard delivery time is 3-5 business days."
    puts "For expedited delivery options, please contact our customer service."
  end

  def return_exchange_policy
    puts "\n"
    puts "Our return and exchange policy is as follows:"
    puts "For in-store purchases, you can return items within 30 days for a full refund."
    puts "After 30 days, store credit will be provided for in-store purchases."
    puts "For online purchases, a 30-day full refund policy applies with no exceptions."
  end
end
