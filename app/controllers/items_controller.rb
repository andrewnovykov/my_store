class ItemsController < ApplicationController
	def index
		@items = Item.all
		render text: @items.map { |i| "#{i.name}:  #{i.price}"}.join("</br>")
	end

	def show
		@item = Item.create(params[:item])
		render text: "#{@item.id}: #{@item.name} "
	end
end
