class Category < ActiveRecord::Base
  validates :name, presence: true
  validate
  has_many :products

end
