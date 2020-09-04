require "pry"

class CashRegister
  attr_accessor :total, :discount, :last_item
  @total
  @discount
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @its = []
    @last_item = 0
  end

  def add_item(title, price, quantity = 1)
    (quantity).times do
      @its << title
    end
    @last_item = (price * quantity)
    @total = @total + (price * quantity)
  end

  def apply_discount
    if @discount != 0
      @total = @total - ((@total / 100)* (@discount) )
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @its
  end

  def void_last_transaction
    @total = @total - @last_item
  end

end
