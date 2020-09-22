class CashRegister 
  
  attr_accessor :total, :discount, :items, :last_trans
  
  def initialize(discount = 0)
    @total = 0 
    @discount = discount
    @items = []
  end
  
  def add_item(items, price, quantity=1)
    @total += price * quantity
    quantity.times do 
      @items << items  
    end
    @last_trans = price * quantity
  end
  
  def apply_discount
    if discount > 0 
      @total = (total * ((100.0 - discount.to_f)/100.00)).to_i 
      "After the discount, the total comes to $#{total}."
    else 
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    @total -= @last_trans
  end
  
  
  
end 