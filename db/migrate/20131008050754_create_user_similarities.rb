class CreateUserSimilarities < ActiveRecord::Migration
  def change
    create_table :user_similarities do |t|
      t.references :user, index: true
      t.references :target, index: true
      t.float :value

      t.timestamps
    end
  end
end
