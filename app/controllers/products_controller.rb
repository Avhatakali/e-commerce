class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @user = current_user
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
    user = @product.user

    redirect_to products_path, alert: "Access Denied" unless current_user == user
  end

  def create
    @product = current_user.products.create(product_params)

    if @product.save
      redirect_to products_path(@product)
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])

    user = @product.user
    if current_user == user
      @product.destroy
      redirect_to products_path
    else
       redirect_to products_path, alert: "Access Denied"
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :quantity)
    end
end
