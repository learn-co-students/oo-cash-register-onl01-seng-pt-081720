require 'pry'

class CashRegister

  attr_accessor :total, :discount, :cart, :previous_price

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @cart = []
  end

  def add_item(title, price, quantity = 1)
    @previous_price = @total
    i = 0
    while i < quantity do
      @cart << title
      i += 1
    end
    @total += price * quantity
  end

  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
      @total = @total - (@total * (@discount * 0.01))
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @cart
  end

  def void_last_transaction
    @cart = @cart.pop
    if @cart.length == 0
      @total = 0
    else
    @total = @previous_price
    end
  end


end
