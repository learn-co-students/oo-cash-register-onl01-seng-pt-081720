require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :quantity, :price

    def initialize(discount = nil) #default argument of nil = undefined
        @total = 0
        @discount = discount
        @items = [] #need to confirm if items is a nested array of items & their prices
    end

    def total #return current total
        @total
    end

    def add_item(title, price, quantity = 1)
        @quantity = quantity
        @price = price
        @total += price * quantity
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
        if discount
            @total -= (@total * @discount/100.0).round #discount/100.0 => 20/100.0 to make it a percentage. Added .0 to make it a float or else it automatically rounded it.
            "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @price * quantity
    end

end
