# require_relative '../config/database'
class Item < ActiveRecord::Base
	has_one :sale_price

end