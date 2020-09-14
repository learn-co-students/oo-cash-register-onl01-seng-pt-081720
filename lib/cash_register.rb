require 'pry'

class CashRegister
  
  attr_accessor :total, :discount, :title, :price, :quantity, :items
  
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount 
    @items = []
    @last_transaction_amount = 0 
  end 
  
  def add_item(title, price, quantity = 1)
    @title = title
    @price = price 
    @total += price * quantity
    @last_transaction_amount = quantity * price
    if quantity > 1
      counter = 0
      while counter < quantity
        @items << title
        counter += 1
      end
    else
      @items << title
  end 
end 
  
  def apply_discount
    if @discount > 0 
      discount_off = (@price * @discount)/100 
      @total -= discount_off
      "After the discount, the total comes to $#{@total}."
    else "There is no discount to apply."
    end 
  end 
  
  def void_last_transaction
    
      @total -= @last_transaction_amount
   
  end 
  
end 