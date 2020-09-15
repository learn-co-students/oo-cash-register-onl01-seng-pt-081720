require 'pry'
class CashRegister
  attr_accessor :total, :discount, :price, :quantity, :last_transaction_amount, :item

  def initialize(discount= 0)
    @total = 0
    @discount = discount
    @price = price
    @quantity = quantity
    @items = []
  end

  def total
   @total
  end

  def add_item (title, price, quantity=1)
    @total = @total + (price*quantity)
    quantity.times {@items << title}
    @last_transaction_amount = (price*quantity)
  end

  def apply_discount
    if discount > 0
      @discount = discount/100.to_f
      @total = @total - (@total*discount)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction_amount.to_f
  end
end
