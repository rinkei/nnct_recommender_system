class AddDepartmentToItem < ActiveRecord::Migration
  def change
    add_column :items, :department, :string
  end
end
