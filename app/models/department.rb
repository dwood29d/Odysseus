class Department < ApplicationRecord

  belongs_to :team
  has_many :user_departments
  has_many :users, through: :user_departments
  has_many :user_exercises, through: :users
  has_many :challenges
  validates :name, presence: true,
            length: { minimum: 3, maximum: 50 }

  def top_performers
    self.users.select('SUM(number_of_reps) as total').order('total desc').limit(10)
  end



end
