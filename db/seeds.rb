# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a user
if User.count <= 3
  User.create!(email: 'test1@gmail.com', password: 'password', username: 'test1')
  User.create!(email: 'test2@gmail.com', password: 'password', username: 'test2')
  User.create!(email: 'test3@gmail.com', password: 'password', username: 'test3')
  User.create!(email: 'test4@gmail.com', password: 'password', username: 'test4')
  User.create!(email: 'test5@gmail.com', password: 'password', username: 'test5')
  User.create!(email: 'test6@gmail.com', password: 'password', username: 'test6')
  User.create!(email: 'test7@gmail.com', password: 'password', username: 'test7')
  User.create!(email: 'test8@gmail.com', password: 'password', username: 'test8')
end

# Create a message
if Message.count <= 10
    Message.create!(body: 'Hello', user_id: 1)
    Message.create!(body: 'Hi', user_id: 2)
    Message.create!(body: 'Hey', user_id: 3)
    Message.create!(body: 'Hola', user_id: 4)
    Message.create!(body: 'Bonjour', user_id: 5)
    Message.create!(body: 'Ciao', user_id: 6)
    Message.create!(body: 'Hallo', user_id: 7)
    Message.create!(body: 'Salut', user_id: 8)
end