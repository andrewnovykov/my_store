class Item < ActiveRecord::Base
	attr_accessible :price, :name, :real, :weight, :desciption

	validates :price,  numericality: { greater_than: 0, allow_nil: true } 
	validates :desciption, presence: true
	validates :name, presence: true

end
