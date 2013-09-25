class AddTouchToRating < ActiveRecord::Migration
  def change
    add_reference :ratings, :touch, index: true
  end
end
