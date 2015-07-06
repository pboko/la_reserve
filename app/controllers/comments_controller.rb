class CommentsController < ApplicationController
  def create
      @restaurant = Restaurant.find(params[:restaurant_id])
      @comment = Comment.new(comment_params)
      @comment.restaurant = @restaurant
      # authorize @review

      if @comment.save
        respond_to do |format|
          format.html { redirect_to restaurant_path(@restaurant) }
          format.js  # <-- will render `app/views/reviews/create.js.erb`
        end
      else
        respond_to do |format|
          format.html { render 'restaurants/show' }
          format.js  # <-- idem
        end
      end


    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
