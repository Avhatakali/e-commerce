class ProductsController < ApplicationController

    def index
      @products = Product.all
    end

    def show
      @product = Product.find(params[:id])
    end

    def new
      @user = current_user
    #  @user = User.find(params[:user_id])
    end

    def edit

    end

    def create
      @user = current_user
      @product = @user.products.create(product_params)

      if @product.save
        redirect_to user_products_path(@product)
      else
        render 'new'
      end
    end


  private
    def product_params
      params.require(:product).permit(:name, :price, :quantity)
    end
end
