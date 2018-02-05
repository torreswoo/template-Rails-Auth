class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :keyname,           null: false, default: ""
      t.string :description,       null: false, default: ""
      t.references :project,       foreign_key: true

      t.timestamps
    end
    add_index :posts, :keyname, unique: true
  end
end
