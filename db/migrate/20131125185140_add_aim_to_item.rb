class AddAimToItem < ActiveRecord::Migration
  def change
    add_column :items, :aim, :text
  end
end
