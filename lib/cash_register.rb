require 'pry'
class CashRegister



attr_accessor :total, :discount, :items, :previous_total, :previous_items


def initialize(employee_discount=0)
	@total = 0.00
	@discount = employee_discount
	@items = []
	@previous_total = 0
	@previous_items = []

end

def add_item(name, price, quantity=1)
	self.previous_total = self.total
	self.total += price * quantity
	self.previous_items = self.items
	quantity.times{self.items << name}

end

def apply_discount
	return "There is no discount to apply." if self.discount == 0

	self.total -= (self.discount.to_f / 100.00) * self.total
	"After the discount, the total comes to $#{self.total.to_i}."
end

def void_last_transaction
	self.total = self.previous_total
	self.items = self.previous_items

end



end
