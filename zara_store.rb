require_relative "item"

class ZaraStore
  def initialize
    @items = []
  end

  def open
    puts "Welcome to Zara!"

    loop do
      if @items.empty?
        puts 'Zara store is empty. Type "add" to start adding items or type "exit" to leave.'
      else
        puts 'Type "add", "check", or "list" to manage the store or type "exit" to leave.'
      end

      action = gets.chomp.downcase

      case action
      when "add"
        add_item()
      when "check"
        check_availability()
      when "list"
        list_items()
      when "exit"
        puts "Thank you for visiting Zara. Have a great day!"
        break
      else
        puts "Invalid option. Please choose a valid option."
      end
    end
  end

  private

  def add_item
    puts "Enter item details:"
    puts "Name:"
    name = gets.chomp.downcase
    puts "Availability:"
    availability = gets.chomp.to_i
    puts "Price:"
    price = gets.chomp.to_f

    item = Item.new(name, availability, price)
    @items.push(item)

    puts "#{item.to_s} has been added to Zara store."
  end

  def check_availability
    puts "Enter the name of the item you want to check:"
    item_name = gets.chomp.downcase

    item = @items.find { |item| item.name == item_name }

    if item
      puts "#{item.to_s} is available in Zara store."
    else
      puts "Sorry, we don't have #{item_name} in our inventory at the moment."
    end
  end

  def list_items
    if @items.empty?
      puts "No items at the moment."
    else
      @items.each do |item|
        puts item.to_s
      end
    end
  end
end
