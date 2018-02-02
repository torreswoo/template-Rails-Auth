class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :keyname,           null: false, default: ""
      t.string :ptype,              null: false, default: ""
      t.timestamps
    end
  end
end
