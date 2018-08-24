# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# exercise_list = [
#1   ["Squats", 1.0],
#2   ["Single Leg Squats", 1.5],
#3   ["Lunges", 1.0],
#4   ["Pull Ups", 2.0],
#5   ["Push Ups", 1.0],
#6   ["Sit Ups", 1.0],
#7   ["Bicycle Crunches", 0.25],
#8   ["Double Leg Lifts", 1.0],
#9   ["Burpees", 1.5],
#10   ["Burpees with Push Ups", 2.0],
#11   ["Jumping Jacks", 0.20],
#12   ["Mountain Climbers", 0.5],
#13   ["Tricep Dips", 1.0],
#14   ["Elevated Leg Tricep Dips", 1.5],
#15   ["Russian Twists", 0.25],
#16   ["Bent Knee Push Ups", 0.5],
#17   ["Dumbbell Curl", 1.0],
#18   ["Dumbbell Military Press", 1.0]
# ]
#
# exercise_list.each do |name, worth|
#   Exercise.create(name: name, worth: worth)
# end


user_exercise_list = [
  # [user_id, exercise_id, worth]
  [1, 1, 15.0],
  [1, 2, 21.0],
  [1, 5, 25.0],
  [1, 9, 24.0],
  [1, 2, 12.0],
  [1, 15, 6.25],
  [1, 17, 20.0],
  [1, 7, 8.5],
  [1, 4, 10.0],
  [1, 3, 15.0],
  [1, 5, 10.0],
  [1, 5, 10.0],
  [1, 15, 15.25],
  [1, 14, 15.0]
]

user_exercise_list.each do |user_id, exercise_id, number_of_reps|
  UserExercise.create(user_id: user_id, exercise_id: exercise_id, number_of_reps: number_of_reps)
end
