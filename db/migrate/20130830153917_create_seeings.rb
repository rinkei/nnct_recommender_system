class CreateSeeings < ActiveRecord::Migration
  def change
    create_table :seeings do |t|
      t.string :type

      t.timestamps
    end
  end
end
