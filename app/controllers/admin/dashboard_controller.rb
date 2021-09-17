class Admin::DashboardController < ApplicationController
  def show
    @allproducts = Product.count
    @allcategory = Category.count
  end
end
