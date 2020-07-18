
class CashRegister

    attr_accessor :total, :discount, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @@all = []
    end

    def add_item(item, price, quantity = 1)
        self.total += (price * quantity)
        quantity.times do
            @@all << item
        end
        self.last_transaction = price * quantity
    end

    def items
        @@all
    end

    def apply_discount
        if self.discount != 0
            self.total -= ((self.discount.to_f / 100.0) * self.total.to_f)
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
      self.total -= self.last_transaction
    end
end