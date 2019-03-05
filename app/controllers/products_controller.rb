class ProductsController < ApplicationController

  def index
    @products = Product.all
    @product_pages = Product.order(:name).page params[:page]
    @user_login = current_user
  end

  def show
    @product = Product.find(params[:id])
    @user_login = current_user

    @track_transactions = TrackTransaction.where(product_id: @product.id)
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
    @product = current_user.products.create!(product_params)

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
      redirect_to products_path, alert: "Access Denied, yuh cannot delete another user's product"
    end
  end

  def purchase
    @user = current_user
    @product = Product.find(params[:id])
    @product.quantity -= 1 unless @product.quantity == 0
    @product.save

    @track_transaction = TrackTransaction.create(product_id: @product.id, seller_id: @product.user.id, buyer_id: current_user.id, price: @product.price)
    if @track_transaction.save
      redirect_to products_path, alert: "Purchase Successful: #{@product.name}"
    else
      render 'show'
    end
  end

  def increase
    @user = current_user
    @product = Product.find(params[:id])
  end

  private
    def product_params
      params.require(:product).permit(:name, :price, :quantity, :purchase, :avatar)
    end
end
