require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items, :price, :last_transaction # items - fails returning array w/o it due to no getter

  def initialize(discount = 0)
    # sets instance var to def val = 0
    # option: employee discount
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  # getter for @total and @items - not needed after attr_accessor, infinite loops occurred 

  def add_item(item, price, quantity = 1)
    # accepts title & price, increases total
    quantity.times do
      @items << item
      # loop to get all items into array
    end
    @last_transaction = price * quantity
    self.total = @total + (price * quantity)
    # binding.pry
  end

  def apply_discount 
    # integer(1) vs float (1.0)
    if @discount > 0
      self.total -= (@total * @discount/100.0).round
      # applies discount to total price, .0 for float, .round to make even
      "After the discount, the total comes to $#{@total}." 
      # => success msg w/updated total
    else
      "There is no discount to apply."
      # => err msg no discount is avail to apply
      # binding.pry
    end
  end

  def void_last_transaction
    # remove last transaction
    # additional attr_accessor
    # keep track of last transaction in add_items
    self.total -= @last_transaction
    # sub the last item from total
    # => total to 0.0 IF all items have been removed

    # binding.pry
  end
end