require 'pry'

class CashRegister
    attr_accessor :discount, :total

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items_array = []
        @items_history = Array.new
        @temp = []
    end

    def add_item(title, price, quantity = 0)
        if quantity > 0
            quantity.times {@items_array << title} 
            @items_history << [title, price, quantity]
            @total += (price * quantity)
        else
            @items_array << title
            @items_history << [title, price]
            @total += price
        end
        
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
        @temp = @items_history.pop
        if @temp.length() > 2
            @total = (@total - (@temp[1].to_i)*(@temp[2].to_i))
            @total
        else
            @total = (@total - @temp[1].to_i)
            @total
        end
    end

end