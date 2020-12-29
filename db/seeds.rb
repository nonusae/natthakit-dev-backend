# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Portfolio.destroy_all

Portfolio.create!(
  title: 'Fake task 1',
  description: Faker::Lorem.paragraph,
  company: Faker::Company.name,
  company_website: 'https://www.google.com',
  location: 'Bangkok',
  job_title: 'Developer',
  start_date: '10/12/2018',
  end_date: '10/01/2019',
)

Portfolio.create!(
  title: 'Fake task 2',
  description: Faker::Lorem.paragraph,
  company: Faker::Company.name,
  company_website: 'https://www.google.com',
  location: 'Bangkok',
  job_title: 'Senior Developer',
  start_date: '10/12/2019',
  end_date: '10/01/2020',
)

Portfolio.create!(
  title: 'Fake task 3',
  description: Faker::Lorem.paragraph,
  company: Faker::Company.name,
  company_website: 'https://www.google.com',
  location: 'Bangkok',
  job_title: 'Senior Software Engineer',
  start_date: '10/12/2020',
  end_date: '10/01/2021',
)
