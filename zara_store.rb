class ZaraStore
  attr_accessor :inventory

  def initialize
    @inventory = {
      "shirt" => { availability: 10, price: 29.99 },
      "pants" => { availability: 5, price: 49.99 },
      "dress" => { availability: 8, price: 79.99 },
    }
  end

  def check_availability(item)
    return unless @inventory.key?(item)

    {
      available: true,
      message: "Great choice! We have #{@inventory[item][:availability]} #{item}s available.",
      price: @inventory[item][:price],
      availability: @inventory[item][:availability],
    }
  end

  def inquire_about_delivery
    {
      message: "Our standard delivery time is 3-5 business days. For expedited delivery options, please contact our customer service.",
    }
  end

  def return_exchange_policy
    {
      message: "Our return and exchange policy is as follows: For in-store purchases, you can return items within 30 days for a full refund. After 30 days, store credit will be provided for in-store purchases. For online purchases, a 30-day full refund policy applies with no exceptions.",
    }
  end
end
