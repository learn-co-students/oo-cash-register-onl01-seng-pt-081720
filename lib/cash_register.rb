require 'pry'

class CashRegister

    attr_accessor :total, :discount, :price, :items, :last_transaction_amount

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def total
        @total
    end

    def add_item(item, price, quantity = 1)
        @price = price
        @total += price * quantity
        @last_transaction_amount = price * quantity
        @total

        quantity.times do
            @items << item
        end
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else @total -= @total * @discount/100
            "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @last_transaction_amount
    end


end
