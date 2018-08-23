class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name, null: false, default: ""
      t.references :team, foreign_key: true
      t.timestamps
    end
  end
end
