require "spec_helper"
# require_relative "lib/dependencies"

describe PriceCalculatorBase do

	describe '#initialization' do
		it 'get the count of each item in array' do
  	  expect(PriceCalculatorBase.initialization).to be_kind_of(Array)
  	end
	end

	describe '#get_quantity_of_enterd_items' do
		it 'get the count of each item in array' do
  	  expect(PriceCalculatorBase.get_quantity_of_enterd_items(TEST_INPUT)).to eq TEST_QUANTITY_ARRAY
  	end
	end


  describe '#get_input_from_user' do
  	it 'get the input from user' do
  	  expect(PriceCalculatorBase.get_input_from_user).to be_kind_of(Array)
  	end
  end


  describe '#is_available?' do
  	it 'check if the item is available in the shop' do
  	  expect(PriceCalculatorBase.is_available?("milk")).to eq true
  	end
  end

  describe '#sale' do
  	it 'sale with unitprice/saleprice' do
  	  expect(PriceCalculatorBase.sale("milk", 2)).to eq 5.0
  	end
  end

	describe '#sale' do
  	it 'sale with unitprice/saleprice' do
  	  expect(PriceCalculatorBase.sale("apple", 1)).to eq 0.89
  	end
  end

end