class ItemsController < ApplicationController

	before_filter :find_item, only: [:show, :edit, :update, :destroy]
	before_filter :check_if_admin, only: [:new, :create, :edit, :update, :destroy]


	def index
		@items = Item.all 		
	end

	# /items/1  GET
	def show
		unless @item			
		
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
		 
		@item.update_attributes(params[:item])
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "edit"
		end		
	end

	# /items/1  DELETE
	def destroy
		 
		@item.destroy
		redirect_to action: "index"
	end

	# /items/1/edit  GET
	def edit
		 
	end

	# /items/new  GET
	def new
		@item = Item.new

	end

	private

		def find_item
			@item = Item.find(params[:id])
		end

		def check_if_admin
			render text: "Access denied", status: 403 unless params[:admin]			
		end


end

