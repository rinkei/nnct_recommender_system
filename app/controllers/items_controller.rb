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
    if current_user
      ActiveRecord::Base.transaction do
        @seeing = Seeing.create!
        Touch.create!(user: current_user, item: @item, reaction: @seeing)
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end
end
