class RemoveReactionIdAndReactionTypeFromTouch < ActiveRecord::Migration
  def change
    remove_column :touches, :reaction_id, :integer
    remove_column :touches, :reaction_type, :string
  end
end
