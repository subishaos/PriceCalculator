class DatabaseValue
	class << self

		def item_create
			Item.create(name: "milk", unit_price: 3.97)
			Item.create(name:"bread", unit_price: 2.17)
			Item.create(name: "banana", unit_price: 0.99)
			Item.create(name: "apple", unit_price: 0.89)
		end

		def sale_prices_create
			SalePrice.create(sale_price_value: 5.00, sale_price_quantity: 2, item_id: Item.find_by(name: "milk").id)
			SalePrice.create(sale_price_value: 6.00, sale_price_quantity: 3, item_id: Item.find_by(name: "bread").id)
		end
	end
end