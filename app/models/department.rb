class Department < ApplicationRecord

  belongs_to :team
  has_many :user_departments
  has_many :users, through: :user_departments
  has_many :user_exercises, through: :users
  has_many :challenges
  validates :name, presence: true,
            length: { minimum: 3, maximum: 50 }

  def top_performers
    self.users.find_by_sql("SELECT users.id, users.first_name, users.last_name, SUM(user_exercises.number_of_reps) AS total FROM users INNER JOIN user_exercises on user_exercises.user_id = users.id GROUP BY users.id ORDER BY total DESC LIMIT 10")
  end

end
