class CreateTouches < ActiveRecord::Migration
  def change
    create_table :touches do |t|
      t.references :user, index: true
      t.references :item, index: true
      t.integer :reaction_id
      t.string :reaction_type

      t.timestamps
    end
  end
end
