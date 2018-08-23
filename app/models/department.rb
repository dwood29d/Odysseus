class Department < ApplicationRecord

  belongs_to :team
  has_many :user_departments
  has_many :users, through: :user_departments
  has_many :challenges
  validates :name, presence: true,
            length: { minimum: 3, maximum: 50 }

end
