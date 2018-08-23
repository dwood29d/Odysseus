class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :name
      t.datetime :start_date, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :end_date
      t.references :department, foreign_key: true
      t.timestamps
    end
  end
end
