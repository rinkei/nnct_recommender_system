# -*- coding: utf-8 -*-
class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @rating = Rating.new

    if current_user
      @user_last_general_rating = GeneralRating.where(item: @item, user: current_user).last
      @user_last_usability_rating = UsabilityRating.where(item: @item, user: current_user).last
      @user_last_looks_rating = LooksRating.where(item: @item, user: current_user).last

      ActiveRecord::Base.transaction do
        @touch = Touch.create!(user: current_user, item: @item)
        SeeingPage.create!(touch: @touch)
      end
    end
  end

  def recommended
    if current_user
      @items = Item.recommended_for(current_user)
    else
      redirect_to signin_path, alert: "Please, sign in"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end
end
