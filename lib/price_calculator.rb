require_relative "dependencies"

#add table content for the application
if Item.count.zero?
  DatabaseValue.item_create
end
if SalePrice.count.zero?
	DatabaseValue.sale_prices_create
end


#Program start
PriceCalculatorBase.start