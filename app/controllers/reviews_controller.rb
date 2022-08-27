class ReviewsController < ApplicationController
  def new
    # @user = User.find(params[:user_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @review.user = current_user
    if @review.save
      redirect_to new_review_path
    else
      flash[:alert] = "Something is not right."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
