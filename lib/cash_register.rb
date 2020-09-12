require 'pry'

class CashRegister
    attr_accessor :discount, :total

    def initialize(total = 0)
        @total = total
        @discount = 20
    end

    def add_item(title, price, quantity = 0)
        if quantity > 0
            @total += (price * quantity)
        else
            @total += price
        end
    end

    def apply_discount
        @total
       # @total = (((@discount/100)*@total)/100)
    end

end