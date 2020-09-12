require 'pry'

class CashRegister
    attr_accessor :discount, :total

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items_array = []
        @last_item = Array.new
        @temp = []
    end

    def add_item(title, price, quantity = 1)
            quantity.times {@items_array << title} 
            @last_item = [title, price, quantity]
            @total += (price * quantity) 
    end

    def apply_discount
        if @discount > 0
            @total = (@total - (@total *@discount/100))
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items_array
    end
 

    def void_last_transaction
            @total = (@total - ((@last_item[1].to_f)*(@last_item[2].to_f)))
    end

end