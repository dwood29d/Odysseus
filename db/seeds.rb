# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

exercise_list = [
  ["Squats", 1.0],
  ["Single Leg Squats", 1.5],
  ["Lunges", 1.0],
  ["Pull Ups", 2.0],
  ["Push Ups", 1.0],
  ["Sit Ups", 1.0],
  ["Bicycle Crunches", 0.25],
  ["Double Leg Lifts", 1.0],
  ["Burpees", 1.5],
  ["Burpees with Push Ups", 2.0],
  ["Jumping Jacks", 0.20],
  ["Mountain Climbers", 0.5],
  ["Tricep Dips", 1.0],
  ["Elevated Leg Tricep Dips", 1.5],
  ["Russian Twists", 0.25],
  ["Bent Knee Push Ups", 0.5],
  ["Dumbbell Curl", 1.0],
  ["Dumbbell Military Press", 1.0]
]

exercise_list.each do |name, worth|
  Exercise.create(name: name, worth: worth)
end
