require 'pry'

class CashRegister
  attr_accessor :total, :discount, :price, :quantity
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(item, price, quantity = 1)
    @price = price
    @quantity = quantity
    if quantity > 1 
      i = 0 
      while i < quantity
        @items << item 
        i += 1 
      end
      
    else 
      @items << item 
    end
      @total += price * quantity
      @final_total = @total
      @final_total

  end
  
  def apply_discount
    if @discount > 0 
      discount_amount = @discount.to_f/100
      new_total = @total * discount_amount
      @total = @total - new_total
      "After the discount, the total comes to $#{total.to_i}."
      
    else 
      "There is no discount to apply."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    if items.length > 0
      @total -= @price * @quantity
    elsif items.length == 0
      total = 0
   
    end
  end

end