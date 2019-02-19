class CommentsController < ApplicationController
    def new
        @product = Product.find(params[:product_id])
    end

    def create
      @product = Product.find(params[:product_id])
      @comment = @product.comments.create(comment_params)

      if @comment.save
        redirect_to products_path(@product)
      else
        render 'new'
      end
    end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
