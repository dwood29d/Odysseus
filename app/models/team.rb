class Team < ApplicationRecord
  has_many :user_teams
  has_many :users, through: :user_teams
  has_many :user_exercises, through: :users
  has_many :departments
  has_many :challenges, through: :department
  validates :name, presence: true,
            uniqueness: {case_sensitive: false },
            length: { minimum: 3, maximum: 50 }

  def top_performers
    self.users.find_by_sql("SELECT users.id, users.first_name, users.last_name, SUM(user_exercises.number_of_reps) AS total FROM users INNER JOIN user_exercises on user_exercises.user_id = users.id GROUP BY users.id ORDER BY total DESC LIMIT 10")
  end

  def top_department
    self.department
  end

  def self.search(param)
    param.strip!
    param.downcase!
    to_send_back = name_matches(param).uniq
    return nil unless to_send_back
    to_send_back
  end

  def self.name_matches(param)
    matches('name', param)
  end

  def self.matches(field_name, param)
    Team.where("#{field_name.downcase} like?", "%#{param}%")
  end

end
