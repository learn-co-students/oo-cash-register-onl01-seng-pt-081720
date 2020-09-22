require 'pry'
class CashRegister 
  attr_accessor :total, :discount, :quanity, :last_transaction
  def initialize(discount = 0)
    @total = 0
    @discount = discount
      @items= []
  end
  
  def add_item(title, price, quanity = 1)
    @total += price * quanity
    quanity.times do   
       @items << title 
   end
   @last_transaction = price * quanity 
  end

  def apply_discount
    if @discount > 0
   self.total -= (self.total * @discount/100)
   return "After the discount, the total comes to $#{self.total}."
    else 
   return "There is no discount to apply."
   end

 end

 def items
   @items 
 end
  
def void_last_transaction
  @total -= last_transaction
end

end

