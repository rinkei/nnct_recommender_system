class RatingsController < ApplicationController
  before_action :require_login, only: [:create]
  before_action :set_item, only: [:create]
  before_action :rating_params, only: [:create]

  # POST /items/1
  def create
    @rating = Rating.new(rating_params)
    @rating.item = @item
    @rating.user = current_user

    ActiveRecord::Base.transaction do
      @rating.save!
    end

    redirect_to @item
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:item_id])
    end

    def rating_params
      params.require(:rating).permit(:type, :value)
    end
end
