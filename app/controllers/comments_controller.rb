class CommentsController < ApplicationController

    def new
        @user = current_user
        @product = Product.find(params[:product_id])
        @comment = @product.comments.new
    end

    def create
      @user = current_user
      @comment = @user.comments.create(comment_params)

      if @comment.save
        redirect_to products_path(@product)
      else
        render 'new'
      end
    end

  private
    def comment_params
      params.require(:comment)
            .permit(:comment, :user_id)
            .merge(product_id: params[:product_id])
    end
end
