class ReviewsController < ApplicationController
  def new
    # @user = User.find(params[:user_id])
    @review = Review.new
    authorize @review
  end

  def create
    item = Item.find(params[:item_id])
    @review = Review.new(review_params)
    authorize @review
    @review.user = item.pickup.user
    if @review.save
      redirect_to dashboard_path
    else
      flash[:alert] = "Something is not right."
      redirect_to dashboard_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
