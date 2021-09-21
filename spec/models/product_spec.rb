require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should validate name' do
      @category = Category.new(name: "whatever")
      expect(@category).to be_valid
    end
    it 'should validate that price is present' do
      @category = Category.new(name: "whatever")
      @product = Product.new(name: 'whatever', price: 2000, quantity: 50, category: @category)
      
       expect(@product).to be_valid
    end
     it 'should validate that quantity is present' do
      @category = Category.new
      @product = Product.new(name: 'something', quantity: 20, price: 100, category: @category)
      expect(@product).to be_valid
    end
    it 'should validate that category is present' do
      @category = Category.new
      @product = Product.new(name: 'wakanda', price: 10000 , quantity: 500 , category: @category)
      expect(@product).to be_valid
    end
  end
end
