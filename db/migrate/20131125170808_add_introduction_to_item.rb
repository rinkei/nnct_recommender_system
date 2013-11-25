class AddIntroductionToItem < ActiveRecord::Migration
  def change
    add_column :items, :introduction, :text
  end
end
