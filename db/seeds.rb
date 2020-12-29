# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


title = ['Test project1', 'Test project2']
description = [
  'Description for project 1',
  'Description for project 2'
]

title.each_with_index do |t, index|
  Portfolio.create!(
    title: t,
    description: description[index]
  )
end
