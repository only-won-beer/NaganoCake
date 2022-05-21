class Public::ReviewsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.item_id = @item.id
    @review.save
    redirect_to items_path
  end

  def destroy
    Item.find(params[:item_id]).destroy
    redirect_to item_path
  end

  private

  def review_params
    params.require(:review).permit(:star, :title, :body)
  end

end
