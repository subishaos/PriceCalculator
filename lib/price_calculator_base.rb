class PriceCalculatorBase
	class << self

		#start the program from this method
		def start
			initialization
			get_input_from_user
			sale_according_to_the_needs	
			send_sale_details_to_user		 
		end


		#check if this item available or not
		def is_available? name
			!Item.find_by_name(name).nil?
		end

		#sale of the item 
		def sale(item, quantity)
			if (item_has_sale_price?(item) && quantity_appliacble_for_sale_price?(item,quantity))	
				sale_with_sale_price(item, quantity)
			else
				sale_with_unit_price(item, quantity)
			end
		end

		#check if the item has sale price
		def item_has_sale_price? item
			!Item.find_by_name(item).sale_price.nil?
		end

		#sale with sale price
		def sale_with_sale_price(item, quantity)
			actual_quantity = quantity
			sale_price = get_sale_price(item)
			discount_status = 0
			while(quantity_appliacble_for_sale_price?(item, quantity))
				quantity = quantity - sale_price.sale_price_quantity
				discount_status += 1
			end
			@price << (discount_status * sale_price.sale_price_value) + (quantity * get_item(item).unit_price)
			get_saved_price(@price.last, actual_quantity * get_item(item).unit_price)
			@price.last.round(2)
		end

		#sale with unit price
		def sale_with_unit_price(item, quantity)
			item = Item.find_by_name(item)
			@price << quantity * item.unit_price
			@price.last.round(2)
		end

		#check if the quantity applicable for saleprice or not 
		def quantity_appliacble_for_sale_price?(item, quantity)
			sale_price = get_sale_price(item)
			sale_price.sale_price_quantity <= quantity
		end

		#get item by name
		def get_item(item)
			Item.find_by_name(item)
		end

		#get sale_price
		def get_sale_price(item)
			Item.find_by_name(item).sale_price
		end

		#get saved price
		def get_saved_price(dicount_price, actual_price)
			@saved_price = @saved_price + (actual_price - dicount_price)
		end

		def get_price_sum price
			@price_sum = 0
			price.each { |a| a.is_a?(Numeric)? @price_sum+=a : a}
		  @price_sum

		end

		def send_sale_details_to_user
			rows = []
			rows << ["item","quantity","price" ]
			rows << ['----------','------------','--------']
			for i in (0..@item_count-1)
				rows << [@item[i],@quantity[i],@price[i]]
			end
			table = Terminal::Table.new :rows => rows
			puts table
			p "Hai Your total price is #{get_price_sum(@price)}"
			p "You saved #{@saved_price} today" unless @saved_price.zero?
		end

		#initialize the variable
		def initialization
			@saved_price = 0
			@price = []
			@quantity = []
			@item = []
		end

		#get input from user
		def get_input_from_user
			puts "Please enter all the items purchased separated by a comma"
			items = convert_input_to_array
			@item_count = items.uniq.count
			get_quantity_of_enterd_items(items)
			@item = items.uniq
		end

		#get _quantity of enterd items
		def get_quantity_of_enterd_items(items)
			items.uniq.each do |item|
				@quantity << items.count(item)
			end
			@quantity
		end

		#sale conditions
		def sale_according_to_the_needs
			for i in (0..@item_count-1)
				if is_available? @item[i]
					sale(@item[i], @quantity[i])
				else
					p "#{@item[i]} is not available in this shop"
					@price << "NA"
				end
			end 
		end

		#convert input to array
		def convert_input_to_array
			items = gets.chomp.to_s.split(',')
		  items.collect{|e| e.strip}
		end

	end
end