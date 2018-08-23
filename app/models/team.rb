class Team < ApplicationRecord
  has_many :user_teams
  has_many :users, through: :user_team
  has_many :departments
  has_many :challenges, through: :department
  validates :name, presence: true,
            uniqueness: {case_sensitive: false },
            length: { minimum: 3, maximum: 50 }

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
