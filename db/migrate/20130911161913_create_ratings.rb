class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :item, index: true
      t.references :user, index: true
      t.string :type
      t.integer :value

      t.timestamps
    end
  end
end
