class AddColumnUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :department, :string
    add_column :users, :mobile, :string
    add_column :users, :department_number, :string
  end
end
