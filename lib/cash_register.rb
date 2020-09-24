
require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items_added_to_cart = []
        @transactions = []
    end

    def add_item(title, price, quantity=1)
        @transactions << [title, price, quantity]
        if quantity != 0
            @total += (price * quantity)
            while quantity != 0
                quantity -= 1
                @items_added_to_cart << title
            end
        else
            @items_added_to_cart << title
            @total += price
        end
    end

    def apply_discount
        if @discount != 0
          new_total = @total - (@total * (@discount / 100.0))
          @total = new_total.to_i
          "After the discount, the total comes to $#{@total}." 
        else
            "There is no discount to apply."
        end
    end

    def items
        @items_added_to_cart
    end


    def void_last_transaction
        count_of_items = @transactions[@transactions.length-1][2]
        if count_of_items > 1
            amount = @transactions[@transactions.length-1][1]
            amount_to_void = amount * count_of_items
            @total = @total - amount_to_void
        else
            amount_to_void = @transactions[@transactions.length-1][1]
            @total = @total - amount_to_void
        end 
    end
end