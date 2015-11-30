class ItemsController < ApplicationController

	def index
		@items = Item.all 		
	end

	# /items/1  GET
	def show
		unless @item = Item.where(id: params[:id]).first
			
		
		render text: "Страница не найдена", status: 404
		end
	end

	# /items/  POST
	def create
		@item = Item.create(params[:item])
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "new"
		end
	end

	# /items/1  PUT
	def update
		@item = Item.find(params[:id])
		@item.update_attributes(params[:item])
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "edit"
		end		
	end

	# /items/1  DELETE
	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to action: "index"
	end

	# /items/1/edit  GET
	def edit
		@item = Item.find(params[:id])
	end

	# /items/new  GET
	def new
		@item = Item.find(params[:id])

	end


end

