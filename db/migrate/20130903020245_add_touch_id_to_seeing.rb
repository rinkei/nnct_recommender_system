class AddTouchIdToSeeing < ActiveRecord::Migration
  def change
    add_column :seeings, :touch_id, :integer
  end
end
