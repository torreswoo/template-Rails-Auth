class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :keyname,           null: false, default: ""
      t.string :description,       null: false, default: ""
      t.timestamps
    end
  end
end
