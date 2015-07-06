class CommentsController < ApplicationController
  def create
      @restaurant = Restaurant.find(params[:restaurant_id])
      @comment = Comment.new(comment_params)
      @comment.restaurant = @restaurant
      # authorize @review
      if @comment.save
        redirect_to restaurant_path(@restaurant)
      else
        render 'restaurants/show'
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
