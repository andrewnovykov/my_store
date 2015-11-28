class Item < ActiveRecord::Base
	attr_accessible :price, :name, :real, :weight, :description

	validates :price,  numericality: { greater_than: 0, allow_nil: true } 
	validates :description, presence: true
	validates :name, presence: true

	after_initialize {  }
	after_save {   }
	after_create {  }
	after_update {   }
	after_destroy {   }



end
