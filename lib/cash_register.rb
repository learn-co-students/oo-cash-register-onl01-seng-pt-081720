require 'pry'

class CashRegister
  attr_accessor :total, :discount, :last_transaction
  attr_reader :items
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    
    
  end
  
  def add_item (title,price, quantity = 1)
    quantity.times do
      @items << title
    end
    @last_transaction = @total
    @total += price * quantity
    
    end
    
  
  def apply_discount
    if @discount > 0
      @total -= @total * @discount / 100
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
end

def void_last_transaction
  @total = @last_transaction
end
end
