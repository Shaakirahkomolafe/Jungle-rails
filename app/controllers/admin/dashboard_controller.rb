class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']
  def show
    @allproducts = Product.count
    @allcategory = Category.count
  end
end
