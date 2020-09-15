class CashRegister 
attr_accessor :total, :discount, :items, :last_item 

def initialize(discount=0)
  @total = 0 
  @discount = discount 
  @items = []
end

def add_item (title,price,quantity=1)
@total += price * quantity
quantity.times do 
  @items << title 
end 
@last_item = price * quantity
end 


def apply_discount 
  if discount !=0 
  @total-=(@total * @discount/100)
  "After the discount, the total comes to $#{@total}."
else 
  "There is no discount to apply."
end 
end 

def items 
  @items 
end 

def void_last_transaction
  if last_item !=0 
  self.total = self.total - @last_item
  end
end 

end 


