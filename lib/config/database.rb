require 'active_record'

 
# rake db:create unless ActiveRecord::Base.connection

# client = Mysql2::Client.new(:host => 'localhost', :username=>"root", :password=> "root")
# client.query("CREATE DATABASE price_calculator") unless ActiveRecord::Base.connection
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :dbfile  => ":memory:",
  :database => "price_calculator"
)
 
ActiveRecord::Schema.define do

    create_table :items do |table|
        table.column :name, :string
        table.column :unit_price, :float
    end unless ActiveRecord::Base.connection.table_exists? 'items'

    create_table :sale_prices do |table|
        table.column :item_id, :string
        table.column :sale_price_value, :float
        table.column :sale_price_quantity, :integer
    end unless ActiveRecord::Base.connection.table_exists? 'sale_prices'

end