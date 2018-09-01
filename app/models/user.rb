class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

 has_one :user_team
 has_one :team, through: :user_team
 has_one :user_department
 has_one :department, through: :user_department
 has_many :user_exercises
 has_many :exercises, through: :user_exercises

 def full_name
   return "#{first_name} #{last_name}".strip if (first_name || last_name)
   "Anonymous"
 end

 def most_massive_day
   # Returns a hash with the day and the value
   day = self.user_exercises.group_by_day(:created_at).sum(:number_of_reps).max_by{ |k, v| v}
   return day[0]
 end

 def most_reps
   reps = self.user_exercises.group_by_day(:created_at).sum(:number_of_reps).max_by{ |k, v| v}
   return reps[1]
 end

 def has_team?
   return !self.team.nil?
 end

 def has_department?
   return !self.department.nil?
 end
end
