class CommentsController < ApplicationController
  skip_after_action :verify_policy_scoped
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment    = @restaurant.comments.new(comment_params)

    if @comment.save
      @comments = @restaurant.comments.for_service_date(@comment.service_date)

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

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    comment     = @restaurant.comments.find(params[:id])

    comment.destroy
    redirect_to restaurant_path(@restaurant, date: comment.service_date)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :service_date)
  end
end
