class AddGoalToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :goal, :int
  end
end
