class UserExercise < ApplicationRecord
  belongs_to :user
  belongs_to :exercise

  def full_name
    return self.user.full_name
  end
end
