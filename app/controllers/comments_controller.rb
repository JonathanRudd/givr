class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :create
  def new
    @item = Item.find(params[:item_id])
    @comment = Comment.new
    authorize @item
    authorize @comment
  end

  def create
    comment = Comment.new(comment_params)
    item = Item.find(params[:item_id])
    comment.user = current_user
    comment.item = item
    authorize comment
    if comment.save
      redirect_to item_url(item), notice: 'Comment Succesfully Added!!!!'
    else
      redirect_to item_url(item), notice: 'Comment Reply Failed!!!!'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:question, :parent_id).merge(item_id: params[:item_id])
  end
end
