class CommentsController < ApplicationController

    def new
      @user = current_user
      @product = Product.find(params[:product_id])
      @comment = @product.comments.new
    end

    def edit
      @comment = Comment.find(params[:id])
      @product = @comment.product
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

    def update
      @comment = Comment.find(params[:id])
      @product = @comment.product

      if @comment.update(comment_params)
        redirect_to products_path(@product)
      else
        render 'edit'
      end
    end

    def destroy
      @comment = Comment.find(params[:id])
      @product = @comment.product

      @comment.destroy
      redirect_to product_path(@product)
    end

  private
    def comment_params
      params.require(:comment)
            .permit(:comment, :user_id)
            .merge(product_id: params[:product_id])
    end
end
