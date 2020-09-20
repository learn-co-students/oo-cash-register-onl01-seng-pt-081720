class CashRegister
    attr_accessor :items, :discount, :total, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, amount, quantity = 1)
         item_total = amount * quantity
    self.total += item_total
        quantity.times { items << title }
    self.last_transaction = item_total
    end
    
    def apply_discount
    
        if discount != 0
    self.total = (total * ((100.0 - discount.to_f) / 100)).to_i
    
    "After the discount, the total comes to $#{total}."
        else
        'There is no discount to apply.'
    end
end
    
    def void_last_transaction    
        self.total = self.total - self.last_transaction
    end
end