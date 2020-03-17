puts '---Seeding database---'

puts '-Creating Course Seeds:'

course = Course.create(
  name: 'Ruby on Rails',
  details: 'The Ultimate Ruby on Rails Developer Course'
)

puts '-Creating Material seeds:'

material = Material.create(
  name: 'Firs File',
  path: 'https://somewebsite.com.br/file123.pdf',
  kind: :pdf,
  course: course
)

puts '---End Seeds---'
