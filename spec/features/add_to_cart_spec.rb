  require 'rails_helper'
  require './spec/features/images.rb'
  RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
    scenario "They see all products" do
      # ACT
      visit root_path
  
      # DEBUG / VERIFY
     
      puts page.html 
      expect(page).to have_css 'article.product', count: 10
      find("article.product", match: :first).click_button('Add')
      sleep 2
      save_screenshot
     find('.navbar-right > li:nth-child(2)').click_link('My Cart')
     sleep 2
     save_screenshot
    #  page.find(:xpath, '(//ul[@class="nav"]/li[6]').should have_content("My Cart")
  end
  end
  
