require 'pry'
class CashRegister
  attr_accessor :discount, :total, :title, :last_transaction_amount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    if quantity > 1
      i = 0
      while i < quantity
        @items << title
        i += 1
      end
    else
      @items << title
    end
      @total += price * quantity
      @last_transaction_amount = price * quantity
      @total
    end

  def apply_discount
    @discount = discount.to_f/100
    discount_total = @total * discount
    if @discount > 0
      @total -= discount_total.to_int
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
   @total -= @last_transaction_amount
  end

end
